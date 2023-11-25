package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAORota {
    String mensagem = "";
    DAOCidade daoCidade = new DAOCidade();
    DAOAviao daoAviao = new DAOAviao();
    DAOAeroporto daoAeroporto = new DAOAeroporto();
    
    public List<Rota> listar(){
        
        String sql = "select * from rota";
        List<Rota> listaRota = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Rota objRota = new Rota();
                objRota.setIdRota(rs.getInt("idRota"));
                objRota.setLocalSaida(daoCidade.localizar(rs.getInt("localSaida")));
                objRota.setDestino(daoCidade.localizar(rs.getInt("destino")));
                objRota.setAviao(daoAviao.localizar(rs.getInt("aviao")));
                objRota.setDistanciaRota(rs.getDouble("distanciaRota"));
                objRota.setAeroportoSaida(daoAeroporto.localizar(rs.getInt("aeroportoSaida")));
                objRota.setAeroportoDestino(daoAeroporto.localizar(rs.getInt("aeroportoDestino")));
                listaRota.add(objRota);
            }
            pst.close();
            rs.close();
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAORota"+erro);
        }
        return listaRota;
    }

    public String inserir(Rota obj){
       String sql = "insert into rota (localSaida, destino, aviao, distanciaRota, aeroportoSaida, aeroportoDestino) values (?, ?, ?, ?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getLocalSaida().getCodigo());
           pst.setInt(2, obj.getDestino().getCodigo());
           pst.setInt(3, obj.getAviao().getIdAviao());
           pst.setDouble(4, obj.getDistanciaRota());
           pst.setInt(5, obj.getAeroportoSaida().getIdAeroporto());
           pst.setInt(6, obj.getAeroportoDestino().getIdAeroporto());
           
           if(pst.executeUpdate() > 0){
               mensagem = "Rota Cadastrada com sucesso";
           }else{
               mensagem = "Rota não Cadastrada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAORota"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Rota obj){
       String sql = "update rota set localSaida = ?, destino = ?, aviao = ?,  distanciaRota = ?, aeroportoSaida = ?, aeroportoDestino = ? where idRota = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getLocalSaida().getCodigo());
           pst.setInt(2, obj.getDestino().getCodigo());
           pst.setInt(3, obj.getAviao().getIdAviao());
           pst.setDouble(4, obj.getDistanciaRota());
           pst.setInt(5, obj.getAeroportoSaida().getIdAeroporto());
           pst.setInt(6, obj.getAeroportoDestino().getIdAeroporto());
           pst.setInt(7, obj.getIdRota());
           if(pst.executeUpdate() > 0){
               mensagem = "Rota alterada com sucesso";
           }else{
               mensagem = "Rota não alterada";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAORota"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Rota obj){
       String sql = "delete from rota where idRota = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdRota());
           if(pst.executeUpdate() > 0){
               mensagem = "Rota excluida com sucesso";
           }else{
               mensagem="Rota não excluida";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAORota"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public Rota localizar(Integer id){
        String sql = "select * from rota where idRota = ?";
        Rota objRota = new Rota();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objRota.setIdRota(rs.getInt("idRota"));
                objRota.setLocalSaida(daoCidade.localizar(rs.getInt("localSaida")));
                objRota.setDestino(daoCidade.localizar(rs.getInt("destino")));
                objRota.setAviao(daoAviao.localizar(rs.getInt("aviao")));
                objRota.setDistanciaRota(rs.getDouble("distanciaRota"));
                objRota.setAeroportoSaida(daoAeroporto.localizar(rs.getInt("aeroportoSaida")));
                objRota.setAeroportoSaida(daoAeroporto.localizar(rs.getInt("aeroportoDestino")));
                return objRota;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
}
