package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOPassageiroViagem {
    String mensagem = "";
    DAOPassageiro daoPassageiro = new DAOPassageiro();
    DAOClasse daoClasse = new DAOClasse();
    DAOViagem daoViagem = new DAOViagem();
    
    public List<PassageiroViagem> listar(Integer id){
        
        String sql = "select * from passageiroViagem where viagem = ?";
        List<PassageiroViagem> listaPassageiroViagem = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
             pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                PassageiroViagem objPassageiroViagem = new PassageiroViagem();
                objPassageiroViagem.setIdPassageiroViagem(rs.getInt("idPassageiroViagem"));
                objPassageiroViagem.setPassageiro(daoPassageiro.localizar(rs.getInt("passageiro")));
                objPassageiroViagem.setPrecoViagem(rs.getDouble("precoViagem"));
                objPassageiroViagem.setClasse(daoClasse.localizar(rs.getInt("classe")));
                objPassageiroViagem.setIdviagem(rs.getInt("viagem"));
                listaPassageiroViagem.add(objPassageiroViagem);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOPassageiroViagem"+erro);
        }
        return listaPassageiroViagem;
    }

    public String inserir(PassageiroViagem obj){
       String sql = "insert into passageiroViagem (passageiro, precoViagem, classe, viagem) values (?, ?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getPassageiro().getIdPassageiro());
           pst.setDouble(2, obj.getPrecoViagem());
           pst.setInt(3, obj.getClasse().getIdClasse());
           pst.setInt(4, obj.getIdviagem());
           if(pst.executeUpdate() > 0){
               mensagem = "Viagem do Passageiro Cadastrada com sucesso";
           }else{
               mensagem = "Viagem do Passageiro não Cadastrada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOPassageiroViagem"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String remover(PassageiroViagem obj){
       String sql = "delete from passageiroViagem where idPassageiroViagem = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdPassageiroViagem());
           if(pst.executeUpdate() > 0){
               mensagem = "Viagem do Passageiro excluida com sucesso";
           }else{
               mensagem="Viagem do Passageiro não excluida";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOPassageiroViagem"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
  
}