package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOViagem {
    DAORota daoRota = new DAORota();
    private int lastId;

    public int getLastId() {
        return lastId;
    }
    
    
    ConverteData converte = new ConverteData();
    
    public String inserir(Viagem obj){
       String mensagem;
       String sql = "insert into viagem (rota,data,linhaAerea) values (?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getRota().getIdRota());
           pst.setDate(2, converte.converteBanco(obj.getData()));
           pst.setString(3, obj.getLinhaAerea());
           
           if(pst.executeUpdate() > 0){
               ResultSet rs = pst.getGeneratedKeys();// retorna o último idCaixa cadastrado
               if (rs.next()) {
                    lastId = rs.getInt(1); //armazena o último idCaixa cadastrado
                }
               mensagem = "Viagem cadastrada com sucesso";
           }else{
               mensagem = "Viagem não Cadastrada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = erro.getMessage();
       }
       return mensagem;
    }
    
    public String remover(Viagem obj){
       String mensagem;
       String sql = "delete from viagem where idViagem = ?" ;
       try{
           PreparedStatement stmt = Conexao.getPreparedStatement(sql);
           stmt.setInt(1, obj.getIdViagem());
           if(stmt.executeUpdate() > 0){
               mensagem = "Vinculação cancelada";
           }else{
               mensagem="Vinculação não cancelada";
           }
        stmt.close();
       }catch(SQLException erro){
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
       }
       return mensagem;
    }
    
    public Viagem localizar(Integer id){
        String sql = "select * from viagem where idViagem = ?";
        Viagem objViagem = new Viagem();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objViagem.setIdViagem(rs.getInt("idViagem"));
                objViagem.setRota(daoRota.localizar(rs.getInt("rota")));
                objViagem.setData(converte.converteCalendario(rs.getDate("data")));
                objViagem.setLinhaAerea(rs.getString("linhaAerea"));
                return objViagem;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
   
}