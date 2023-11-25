<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DAOUsuario1"%>
<%
    DAOUsuario1 daoUsuario = new DAOUsuario1();
    List<Usuario> listUsuario = daoUsuario.listar();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>USUÁRIO</th>
            <th>E-MAIL</th>
            <th>SENHA</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Usuario usuario: listUsuario){%>
            <tr>
                <td><%= usuario.getIdUsuario() %></td>
                <td><%= usuario.getUsuario() %></td>
                <td><%= usuario.getEmail() %></td>
                <td><%= usuario.getSenha() %></td>
                <td><a href="CadastroUsuario.jsp?opcao=alterar&codigoUsuario=<%= usuario.getIdUsuario() %>&usuarioUsuario=<%= usuario.getUsuario() %>&emailUsuario=<%= usuario.getEmail() %>&senhaUsuario=<%= usuario.getSenha() %>">alterar</a></td>
                <td><a href="CadastroUsuario.jsp?opcao=excluir&codigoUsuario=<%= usuario.getIdUsuario() %>&usuarioUsuario=<%= usuario.getUsuario() %>&emailUsuario=<%= usuario.getEmail() %>&senhaUsuario=<%= usuario.getSenha() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>
