package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOAviao {
    String mensagem = "";
    public List<Aviao> listar(){
        
        String sql = "select * from aviao";
        List<Aviao> listaAviao = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Aviao objAviao = new Aviao();
                objAviao.setIdAviao(rs.getInt("idAviao"));
                objAviao.setModelo(rs.getString("modelo"));
                objAviao.setCor(rs.getString("cor"));
                objAviao.setCapacidade(rs.getInt("capacidade"));
                objAviao.setTamanho(rs.getDouble("tamanho"));
                listaAviao.add(objAviao);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOAviao"+erro);
        }
        return listaAviao;
    }

    public String inserir(Aviao obj){
       String sql = "insert into aviao (tamanho, capacidade, modelo, cor) values (?, ?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setDouble(1, obj.getTamanho());
           pst.setInt(2, obj.getCapacidade());
           pst.setString(3, obj.getModelo());
           pst.setString(4, obj.getCor());
           if(pst.executeUpdate() > 0){
               mensagem = "Aviao Cadastrado com sucesso";
           }else{
               mensagem = "Aviao não Cadastrado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOAviao"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Aviao obj){
       String sql = "update aviao set tamanho = ?, capacidade = ?, modelo = ?, cor = ? where idAviao = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setDouble(1, obj.getTamanho());
           pst.setInt(2, obj.getCapacidade());
           pst.setString(3, obj.getModelo());
           pst.setString(4, obj.getCor());
           pst.setInt(5, obj.getIdAviao());
           if(pst.executeUpdate() > 0){
               mensagem = "Aviao alterado com sucesso";
           }else{
               mensagem = "Aviao não alterado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOAviao"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Aviao obj){
       String sql = "delete from aviao where idAviao = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdAviao());
           if(pst.executeUpdate() > 0){
               mensagem = "Aviao excluido com sucesso";
           }else{
               mensagem="Aviao não excluido";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOAviao"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public Aviao localizar(Integer id){
        String sql = "select * from aviao where idAviao = ?";
        Aviao objAviao = new Aviao();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objAviao.setIdAviao(rs.getInt("idAviao"));
                objAviao.setTamanho(rs.getFloat("tamanho"));
                objAviao.setCapacidade(rs.getInt("capacidade"));
                objAviao.setModelo(rs.getString("modelo"));
                objAviao.setCor(rs.getString("cor"));
                return objAviao;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
}
