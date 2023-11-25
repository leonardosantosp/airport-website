package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOFuncionario {
    String mensagem = "";
    DAOCidade daoCidade = new DAOCidade();
    DAOCargo daoCargo = new DAOCargo();
    ConverteData converte = new ConverteData();
    
    public List<Funcionario> listar(){
        
        String sql = "select * from funcionario";
        List<Funcionario> listaFuncionario = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Funcionario objFuncionario = new Funcionario();
                objFuncionario.setIdFuncionario(rs.getInt("idFuncionario"));
                objFuncionario.setNome(rs.getString("nome"));
                objFuncionario.setSalario(rs.getDouble("salario"));
                objFuncionario.setCpf(rs.getString("cpf"));
                objFuncionario.setCidade(daoCidade.localizar(rs.getInt("cidade")));
                objFuncionario.setNascimento(converte.converteCalendario(rs.getDate("nascimento")));
                objFuncionario.setCargo(daoCargo.localizar(rs.getInt("cargo")));
                listaFuncionario.add(objFuncionario);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOFuncionario"+erro);
        }
        return listaFuncionario;
    }

    public String inserir(Funcionario obj){
       String sql = "insert into funcionario (nome, salario, cpf, cidade, nascimento, cargo) values (?, ?, ?, ?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setDouble(2, obj.getSalario());
           pst.setString(3, obj.getCpf());
           pst.setInt(4, obj.getCidade().getCodigo());
           pst.setDate(5, converte.converteBanco(obj.getNascimento()));
           pst.setInt(6, obj.getCargo().getIdCargo());
           
           
           if(pst.executeUpdate() > 0){
               mensagem = "Funcionario Cadastrado com sucesso";
           }else{
               mensagem = "Funcionario não Cadastrado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOFuncionario"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Funcionario obj){
       String sql = "update funcionario set nome = ?, salario = ?, cpf = ?, cidade = ?,  nascimento = ?, cargo = ? where idFuncionario = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setDouble(2, obj.getSalario());
           pst.setString(3, obj.getCpf());
           pst.setInt(4, obj.getCidade().getCodigo());
           pst.setDate(5, converte.converteBanco(obj.getNascimento()));
           pst.setInt(6, obj.getCargo().getIdCargo());
           pst.setInt(7, obj.getIdFuncionario());
           if(pst.executeUpdate() > 0){
               mensagem = "Funcionario alterado com sucesso";
           }else{
               mensagem = "Funcionario não alterado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOFuncionario"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Funcionario obj){
       String sql = "delete from funcionario where idFuncionario = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdFuncionario());
           if(pst.executeUpdate() > 0){
               mensagem = "Funcionario excluido com sucesso";
           }else{
               mensagem="Funcionario não excluido";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOAFuncionario"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
}
