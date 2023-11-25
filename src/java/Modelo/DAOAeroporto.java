package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOAeroporto {
    String mensagem = "";
    DAOCidade daoCidade = new DAOCidade();
    public List<Aeroporto> listar(){
        
        String sql = "select * from aeroporto";
        List<Aeroporto> listaAeroporto = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Aeroporto objAeroporto = new Aeroporto();
                objAeroporto.setIdAeroporto(rs.getInt("idAeroporto"));
                objAeroporto.setNome(rs.getString("nome"));
                objAeroporto.setEndereco(rs.getString("endereco"));
                objAeroporto.setCidade(daoCidade.localizar(rs.getInt("cidade")));
                listaAeroporto.add(objAeroporto);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOAeroporto"+erro);
        }
        return listaAeroporto;
    }

    public String inserir(Aeroporto obj){
       String sql = "insert into aeroporto (nome, cidade, endereco) values (?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setInt(2, obj.getCidade().getCodigo());
           pst.setString(3, obj.getEndereco());
           if(pst.executeUpdate() > 0){
               mensagem = "Aeroporto Cadastrado com sucesso";
           }else{
               mensagem = "Aeroporto não Cadastrado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOAeroporto"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Aeroporto obj){
       String sql = "update aeroporto set nome = ?, cidade = ?,  endereco = ? where idAeroporto = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setInt(2, obj.getCidade().getCodigo());
           pst.setString(3, obj.getEndereco());
           pst.setInt(4, obj.getIdAeroporto());
           if(pst.executeUpdate() > 0){
               mensagem = "Aeroporto alterado com sucesso";
           }else{
               mensagem = "Aeroporto não alterado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOAeroporto"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Aeroporto obj){
       String sql = "delete from aeroporto where idAeroporto = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdAeroporto());
           if(pst.executeUpdate() > 0){
               mensagem = "Aeroporto excluido com sucesso";
           }else{
               mensagem="Aeroporto não excluido";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOAeroporto"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public Aeroporto localizar(Integer id){
        String sql = "select * from aeroporto where idAeroporto = ?";
        Aeroporto objAeroporto = new Aeroporto();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objAeroporto.setIdAeroporto(rs.getInt("idAeroporto"));
                objAeroporto.setNome(rs.getString("nome"));
                objAeroporto.setCidade(daoCidade.localizar(rs.getInt("cidade")));
                objAeroporto.setEndereco(rs.getString("endereco"));
                return objAeroporto;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
}
