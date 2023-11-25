package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOUsuario1 {
    String mensagem = "";
    public List<Usuario> listar(){
        
        String sql = "select * from usuario";
        List<Usuario> listaUsuario = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Usuario objUsuario = new Usuario();
                objUsuario.setIdUsuario(rs.getInt("idUsuario"));
                objUsuario.setUsuario(rs.getString("usuario"));
                objUsuario.setEmail(rs.getString("email"));
                objUsuario.setSenha(rs.getString("senha"));
                listaUsuario.add(objUsuario);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOUsuario"+erro);
        }
        return listaUsuario;
    }

    public String inserir(Usuario obj){
       String sql = "insert into usuario (usuario, email, senha) values (?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getUsuario());
           pst.setString(2, obj.getEmail());
           pst.setString(3, obj.getSenha());
           if(pst.executeUpdate() > 0){
               mensagem = "Usuario Cadastrado com sucesso";
           }else{
               mensagem = "Usuario não Cadastrado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOUsuario"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Usuario obj){
       String sql = "update usuario set usuario = ?, email = ?, senha = ? where idUsuario = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getUsuario());
           pst.setString(2, obj.getEmail());
           pst.setString(3, obj.getSenha());
           pst.setInt(4, obj.getIdUsuario());
           if(pst.executeUpdate() > 0){
               mensagem = "Usuario alterado com sucesso";
           }else{
               mensagem = "Usuario não alterado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOUsuario"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Usuario obj){
       String sql = "delete from usuario where idUsuario = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdUsuario());
           if(pst.executeUpdate() > 0){
               mensagem = "Usuario excluido com sucesso";
           }else{
               mensagem="Usuario não excluido";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOUsuario"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
}