package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOCidade {
    String mensagem = "";
    public List<Cidade> listar(){
        
        String sql = "select * from cidade";
        List<Cidade> listaCidade = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Cidade objCidade = new Cidade();
                objCidade.setCodigo(rs.getInt("codigo"));
                objCidade.setNome(rs.getString("nome"));
                objCidade.setUf(rs.getString("uf"));
                objCidade.setCep(rs.getString("cep"));
                objCidade.setPais(rs.getString("pais"));
                listaCidade.add(objCidade);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOCidade"+erro);
        }
        return listaCidade;
    }

    public String inserir(Cidade obj){
       String sql = "insert into cidade (nome, uf, cep, pais) values (?, ?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setString(2, obj.getUf());
           pst.setString(3, obj.getCep());
           pst.setString(4, obj.getPais());
           if(pst.executeUpdate() > 0){
               mensagem = "Cidade Cadastrada com sucesso";
           }else{
               mensagem = "Cidade não Cadastrada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOCidade"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Cidade obj){
       String sql = "update cidade set nome = ?, uf = ?,  cep = ?, pais=? where codigo = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setString(2, obj.getUf());
           pst.setString(3, obj.getCep());
           pst.setString(4, obj.getPais());
           pst.setInt(5, obj.getCodigo());
           if(pst.executeUpdate() > 0){
               mensagem = "Cidade alterada com sucesso";
           }else{
               mensagem = "Cidade não alterada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOCidade"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Cidade obj){
       String sql = "delete from cidade where codigo = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getCodigo());
           if(pst.executeUpdate() > 0){
               mensagem = "Cidade excluida com sucesso";
           }else{
               mensagem="Cidade não excluida";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOCidade"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public Cidade localizar(Integer id){
        String sql = "select * from cidade where codigo = ?";
        Cidade objCidade = new Cidade();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objCidade.setCodigo(rs.getInt("codigo"));
                objCidade.setNome(rs.getString("nome"));
                objCidade.setUf(rs.getString("uf"));
                objCidade.setCep(rs.getString("cep"));
                objCidade.setPais(rs.getString("pais"));
                return objCidade;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
    
}

