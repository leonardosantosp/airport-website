package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOCargo {
    String mensagem = "";
    public List<Cargo> listar(){
        
        String sql = "select * from cargo";
        List<Cargo> listaCargo = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Cargo objCargo = new Cargo();
                objCargo.setIdCargo(rs.getInt("idCargo"));
                objCargo.setFuncao(rs.getString("funcao"));
                objCargo.setNome(rs.getString("nome"));
                listaCargo.add(objCargo);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOCargo"+erro);
        }
        return listaCargo;
    }

    public String inserir(Cargo obj){
       String sql = "insert into cargo (funcao, nome) values (?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getFuncao());
           pst.setString(2, obj.getNome());
           if(pst.executeUpdate() > 0){
               mensagem = "Cargo Cadastrado com sucesso";
           }else{
               mensagem = "Cargo não Cadastrado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOCargo"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Cargo obj){
       String sql = "update cargo set funcao = ?, nome = ? where idCargo = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getFuncao());
           pst.setString(2, obj.getNome());
           pst.setInt(3, obj.getIdCargo());
           if(pst.executeUpdate() > 0){
               mensagem = "Cargo alterado com sucesso";
           }else{
               mensagem = "Cargo não alterado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOCargo"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Cargo obj){
       String sql = "delete from cargo where idCargo = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdCargo());
           if(pst.executeUpdate() > 0){
               mensagem = "Cargo excluido com sucesso";
           }else{
               mensagem="Cargo não excluido";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOCargo"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public Cargo localizar(Integer id){
        String sql = "select * from cargo where idCargo = ?";
        Cargo objCargo = new Cargo();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objCargo.setIdCargo(rs.getInt("idCargo"));
                objCargo.setFuncao(rs.getString("funcao"));
                objCargo.setNome(rs.getString("nome"));
                return objCargo;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
}
