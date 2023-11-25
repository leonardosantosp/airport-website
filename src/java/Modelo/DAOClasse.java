package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOClasse {
    String mensagem = "";
    public List<Classe> listar(){
        
        String sql = "select * from classe";
        List<Classe> listaClasse = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Classe objClasse = new Classe();
                objClasse.setIdClasse(rs.getInt("idClasse"));
                objClasse.setPreco(rs.getDouble("preco"));
                objClasse.setTipo(rs.getString("tipo"));
                listaClasse.add(objClasse);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOClasse"+erro);
        }
        return listaClasse;
    }

    public String inserir(Classe obj){
       String sql = "insert into classe (preco, tipo) values (?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setDouble(1, obj.getPreco());
           pst.setString(2, obj.getTipo());
           if(pst.executeUpdate() > 0){
               mensagem = "Classe Cadastrada com sucesso";
           }else{
               mensagem = "Classe não Cadastrada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOClasse"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Classe obj){
       String sql = "update classe set preco = ?, tipo = ? where idClasse = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setDouble(1, obj.getPreco());
           pst.setString(2, obj.getTipo());
           pst.setInt(3, obj.getIdClasse());
           if(pst.executeUpdate() > 0){
               mensagem = "Classe alterada com sucesso";
           }else{
               mensagem = "Classe não alterada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOClasse"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Classe obj){
       String sql = "delete from classe where idClasse = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdClasse());
           if(pst.executeUpdate() > 0){
               mensagem = "Classe excluida com sucesso";
           }else{
               mensagem="Classe não excluida";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOClasse"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public Classe localizar(Integer id){
        String sql = "select * from classe where idClasse = ?";
        Classe objClasse = new Classe();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objClasse.setIdClasse(rs.getInt("idClasse"));
                objClasse.setPreco(rs.getDouble("preco"));
                objClasse.setTipo(rs.getString("tipo"));
                return objClasse;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
}
