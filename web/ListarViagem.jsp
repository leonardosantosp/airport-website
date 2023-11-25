<%@page import="Modelo.ConverteData"%>
<%@page import="Modelo.Viagem"%>
<%@page import="Modelo.DAOViagem"%>
<%@page import="java.util.List"%>
<%
    DAOViagem daoViagem = new DAOViagem();
    List<Viagem> listViagem = daoViagem.listar();
    ConverteData converte = new ConverteData();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>ROTA</th>
            <th>DATA DA VIAGEM</th>
            <th>LINHA AÉREA</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Viagem viagem: listViagem){%>
            <tr>
                <td><%= viagem.getIdViagem() %></td>
                <td><%= viagem.getRota().getIdRota() %></td>
                <td><%= converte.converteTela(viagem.getData()) %></td>
                <td><%= viagem.getLinhaAerea() %></td>
                <td><a href="CadastroViagem.jsp?opcao=alterar&codigoViagem=<%= viagem.getIdViagem() %>&codigoRota=<%= viagem.getRota().getIdRota() %>&dataViagem=<%= converte.converteTela(viagem.getData()) %>&linhaAerea=<%= viagem.getLinhaAerea() %>">alterar</a></td>
                <td><a href="CadastroViagem.jsp?opcao=excluir&codigoViagem=<%= viagem.getIdViagem() %>&codigoRota=<%= viagem.getRota().getIdRota() %>&dataViagem=<%= converte.converteTela(viagem.getData()) %>&linhaAerea=<%= viagem.getLinhaAerea() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>