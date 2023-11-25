package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Relatorio {
    
    public ResultSet relatorioCidade(){
        String sql = "select * from Cidade";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }
    
public ResultSet relatorioAeroporto(){
        String sql = "SELECT aeroporto.idAeroporto, aeroporto.nome, aeroporto.endereco, cidade.nome as nomecidade FROM aeroporto, cidade WHERE aeroporto.cidade = cidade.codigo";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioAviao(){
        String sql = "select * from aviao";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioCargo(){
        String sql = "select * from cargo";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioClasse(){
        String sql = "select * from classe";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioFuncionario(){
        String sql = "SELECT funcionario.idFuncionario, funcionario.nome, funcionario.salario,\n" +
"funcionario.cpf, cargo.nome AS nomecargo, date_format(funcionario.nascimento,\"%d/%m/%Y\") AS \"nascimento\", \n" +
"cidade.nome as nomecidade FROM funcionario, \n" +
"cidade, cargo WHERE funcionario.cidade = cidade.codigo and funcionario.cargo = cargo.idCargo";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioPassageiro(){
        String sql = "SELECT passageiro.idPassageiro, passageiro.nome, passageiro.telefone, passageiro.cpf, date_format(passageiro.nascimento,\"%d/%m/%Y\") AS \"nascimento\",  cidade.nome as nomecidade FROM passageiro, cidade WHERE passageiro.cidade = cidade.codigo";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioRota(){
        String sql = "SELECT rota.idRota, rota.distanciaRota, aviao.modelo, aeroporto.nome AS aeroportoDestino, aeroporto.nome AS aeroportoSaida, \n" +
"cidade.nome AS localsaida, cidade.nome AS localdestino FROM rota, \n" +
"cidade, aeroporto, aviao WHERE rota.localSaida = cidade.codigo and rota.aeroportoSaida = aeroporto.idAeroporto \n" +
"AND rota.aviao = aviao.idAviao";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioUsuario(){
        String sql = "select * from usuario";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioViagem(){
        String sql = "SELECT viagem.idViagem, viagem.linhaAerea,date_format(viagem.`data`,\"%d/%m/%Y\") AS dataviagem, rota.idRota FROM viagem, rota WHERE viagem.rota = rota.idRota";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

public ResultSet relatorioPassageiroViagem(){
        String sql = "SELECT passageiroviagem.idPassageiroViagem, passageiroviagem.precoViagem, passageiro.nome AS nomepassageiro, classe.tipo, \n" +
"classe.preco,viagem.linhaAerea, viagem.rota, date_format(viagem.`data`,\"%d/%m/%Y\") AS dataviagem, passageiro.cpf FROM passageiroviagem,\n" +
"passageiro, classe, viagem WHERE passageiroviagem.passageiro = passageiro.idPassageiro \n" +
"AND passageiroviagem.classe = classe.idClasse AND passageiroviagem.viagem = viagem.idViagem";
        ResultSet rs=null;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        }catch (SQLException e){
            System.out.println("Erro de SQL no Localizar"+e.getMessage());
        } 
    return rs;
    }

}
