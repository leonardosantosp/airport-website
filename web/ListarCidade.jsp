<%@page import="Modelo.Cidade"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DAOCidade"%>
<%
    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listCidade = daoCidade.listar();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>UF</th>
            <th>CEP</th>
            <th>PAÍS</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Cidade cidade: listCidade){ %>
            <tr>
                <td><%= cidade.getCodigo() %></td>
                <td><%= cidade.getNome() %></td>
                <td><%= cidade.getUf() %></td>
                <td><%= cidade.getCep() %></td>
                <td><%= cidade.getPais() %></td>
                <td><a href="CadastroCidade.jsp?opcao=alterar&codigoCidade=<%= cidade.getCodigo()%>&nomeCidade=<%= cidade.getNome()%>&ufCidade=<%= cidade.getUf()%>&cepCidade=<%= cidade.getCep()%>&paisCidade=<%= cidade.getPais() %>">alterar</a> </td>
                <td><a href="CadastroCidade.jsp?opcao=excluir&codigoCidade=<%= cidade.getCodigo()%>&nomeCidade=<%= cidade.getNome()%>&ufCidade=<%= cidade.getUf()%>&cepCidade=<%= cidade.getCep()%>&paisCidade=<%= cidade.getPais() %>">excluir</a> </td>
            </tr>
        <% } %>
    </tbody>
</table>
