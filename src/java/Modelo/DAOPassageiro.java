package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOPassageiro {
    String mensagem = "";
    DAOCidade daoCidade = new DAOCidade();
    ConverteData converte = new ConverteData();
    
    public List<Passageiro> listar(){
        
        String sql = "select * from passageiro";
        List<Passageiro> listaPassageiro = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Passageiro objPassageiro = new Passageiro();
                objPassageiro.setIdPassageiro(rs.getInt("idPassageiro"));
                objPassageiro.setNome(rs.getString("nome"));
                objPassageiro.setTelefone(rs.getString("telefone"));
                objPassageiro.setCpf(rs.getString("cpf"));
                objPassageiro.setNascimento(converte.converteCalendario(rs.getDate("nascimento")));
                objPassageiro.setCidade(daoCidade.localizar(rs.getInt("cidade")));
                listaPassageiro.add(objPassageiro);
            }
        }catch(SQLException erro){
            System.out.println("Erro no listar do DAOPassageiro"+erro);
        }
        return listaPassageiro;
    }

    public String inserir(Passageiro obj){
       String sql = "insert into passageiro (nome, telefone, cpf, nascimento, cidade) values (?, ?, ?, ?, ?)" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setString(2, obj.getTelefone());
           pst.setString(3, obj.getCpf());
           pst.setDate(4, converte.converteBanco(obj.getNascimento()));
           pst.setInt(5, obj.getCidade().getCodigo());
           if(pst.executeUpdate() > 0){
               mensagem = "Passageiro Cadastrado com sucesso";
           }else{
               mensagem = "Passageiro não Cadastrado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no incluir do DAOPassageiro"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public String alterar(Passageiro obj){
       String sql = "update passageiro set nome = ?, telefone = ?, cpf = ?,  nascimento = ?, cidade = ? where idPassageiro = ? " ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setString(1, obj.getNome());
           pst.setString(2, obj.getTelefone());
           pst.setString(3, obj.getCpf());
           pst.setDate(4, converte.converteBanco(obj.getNascimento()));
           pst.setInt(5, obj.getCidade().getCodigo());
           pst.setInt(6, obj.getIdPassageiro());
           if(pst.executeUpdate() > 0){
               mensagem = "Passageiro alterado com sucesso";
           }else{
               mensagem = "Passageiro não alterado";
           }
           pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no alterar do DAOPassageiro"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    public String remover(Passageiro obj){
       String sql = "delete from passageiro where idPassageiro = ?" ;
       try{
           PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getIdPassageiro());
           if(pst.executeUpdate() > 0){
               mensagem = "Passageiro excluido com sucesso";
           }else{
               mensagem="Passageiro não excluido";
           }
        pst.close();
       }catch(SQLException erro){
            mensagem = "Erro de sql no excluir do DAOAPassageiro"+erro.getMessage()+"/nComando sql="+sql;
       }
       return mensagem;
    }
    
    public Passageiro localizar(Integer id){
        String sql = "select * from passageiro where idPassageiro = ?";
        Passageiro objPassageiro = new Passageiro();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objPassageiro.setIdPassageiro(rs.getInt("idPassageiro"));
                objPassageiro.setNome(rs.getString("nome"));
                objPassageiro.setTelefone(rs.getString("telefone"));
                objPassageiro.setCpf(rs.getString("cpf"));
                objPassageiro.setNascimento(converte.converteCalendario(rs.getDate("nascimento")));
                objPassageiro.setCidade(daoCidade.localizar(rs.getInt("cidade")));
                return objPassageiro;
            }
       }catch(SQLException erro){
            System.out.println("Erro de SQL no Localizar"+erro.getMessage());
       }
       return null;
    }
   
}
