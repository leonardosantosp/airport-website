package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexao {
    private static final String banco = "jdbc:mysql://localhost:3306/projetoaeroporto";
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String usuario = "root";
    private static final String senha = "";
    private static Connection con = null;
            
public Conexao(){
    
}

public static Connection getConexao(){
    if (con == null) {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(banco, usuario, senha);
        }catch (ClassNotFoundException erro) {
            System.out.println("Não encontrou o driver"+erro.getMessage());
        }catch(SQLException erro){
            System.out.println("erro de conexão"+erro.getMessage());
        }
    }
    return con;
}

public static PreparedStatement getPreparedStatement(String sql){
    if (con==null) {
        con = getConexao();
    }
    try {
        return con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    } catch (Exception erro) {
        System.out.println("Erro de SQL"+erro.getMessage());
    }
    return null;
}

}
