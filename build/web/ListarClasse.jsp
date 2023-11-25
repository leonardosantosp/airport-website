<%@page import="Modelo.Classe"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DAOClasse"%>
<%
    DAOClasse daoClasse = new DAOClasse();
    List<Classe> listClasse = daoClasse.listar();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>PREÇO</th>
            <th>TIPO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Classe classe: listClasse){%>
            <tr>
                <td><%= classe.getIdClasse() %></td>
                <td><%= classe.getPreco() %></td>
                <td><%= classe.getTipo() %></td>
                <td><a href="CadastroClasse.jsp?opcao=alterar&codigoClasse=<%= classe.getIdClasse() %>&precoClasse=<%= classe.getPreco() %>&tipoClasse=<%= classe.getTipo() %>">alterar</a></td>
                <td><a href="CadastroClasse.jsp?opcao=excluir&codigoClasse=<%= classe.getIdClasse() %>&precoClasse=<%= classe.getPreco() %>&tipoClasse=<%= classe.getTipo() %>">excluir</a></td>
            </tr>
        <%  }%>
    </tbody>
</table>
