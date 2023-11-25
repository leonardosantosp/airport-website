
<%@page import="Modelo.Aeroporto"%>
<%@page import="Modelo.DAOAeroporto"%>
<%@page import="java.util.List"%>

<%
    DAOAeroporto daoAeroporto = new DAOAeroporto();
    List<Aeroporto> listAeroporto = daoAeroporto.listar();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>CIDADE</th>
            <th>ENDEREÇO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Aeroporto aeroporto: listAeroporto){%>
            <tr>
                <td><%= aeroporto.getIdAeroporto() %></td>
                <td><%= aeroporto.getNome() %></td>
                <td><%= aeroporto.getCidade().getNome() %></td>
                <td><%= aeroporto.getEndereco() %></td>
                <td><a href="CadastroAeroporto.jsp?opcao=alterar&codigoAeroporto=<%= aeroporto.getIdAeroporto() %>&nomeAeroporto=<%= aeroporto.getNome() %>&codigoCidade=<%= aeroporto.getCidade().getCodigo() %>&enderecoAeroporto=<%= aeroporto.getEndereco() %>">alterar</a></td>
                <td><a href="CadastroAeroporto.jsp?opcao=excluir&codigoAeroporto=<%= aeroporto.getIdAeroporto() %>&nomeAeroporto=<%= aeroporto.getNome() %>&codigoCidade=<%= aeroporto.getCidade().getCodigo() %>&enderecoAeroporto=<%= aeroporto.getEndereco() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>

