<%@page import="Modelo.Aviao"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DAOAviao"%>
<%
    DAOAviao daoAviao = new DAOAviao();
    List<Aviao> listAviao = daoAviao.listar();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>TAMANHO</th>
            <th>CAPACIDADE</th>
            <th>MODELO</th>
            <th>COR</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Aviao aviao: listAviao){%>
            <tr>
                <td><%= aviao.getIdAviao() %></td>
                <td><%= aviao.getTamanho() %></td>
                <td><%= aviao.getCapacidade() %></td>
                <td><%= aviao.getModelo() %></td>
                <td><%= aviao.getCor() %></td>
                <td><a href="CadastroAviao.jsp?opcao=alterar&codigoAviao=<%= aviao.getIdAviao() %>&tamanhoAviao=<%= aviao.getTamanho() %>&capacidadeAviao=<%= aviao.getCapacidade() %>&modeloAviao=<%= aviao.getModelo() %>&corAviao=<%= aviao.getCor() %>">alterar</a></td>
                <td><a href="CadastroAviao.jsp?opcao=excluir&codigoAviao=<%= aviao.getIdAviao() %>&tamanhoAviao=<%= aviao.getTamanho() %>&capacidadeAviao=<%= aviao.getCapacidade() %>&modeloAviao=<%= aviao.getModelo() %>&corAviao=<%= aviao.getCor() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>
