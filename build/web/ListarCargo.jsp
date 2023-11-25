<%@page import="Modelo.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DAOCargo"%>
<%
    DAOCargo daoCargo = new DAOCargo();
    List<Cargo> listCargo = daoCargo.listar();
    
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>FUNÇÃO</th>
            <th>NOME</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Cargo cargo: listCargo){%>
            <tr>
                <td><%= cargo.getIdCargo() %></td>
                <td><%= cargo.getFuncao() %></td>
                <td><%= cargo.getNome() %></td>
                <td><a href="CadastroCargo.jsp?opcao=alterar&codigoCargo=<%= cargo.getIdCargo() %>&funcaoCargo=<%= cargo.getFuncao() %>&nomeCargo=<%= cargo.getNome() %>">alterar</a></td>
                <td><a href="CadastroCargo.jsp?opcao=excluir&codigoCargo=<%= cargo.getIdCargo() %>&funcaoCargo=<%= cargo.getFuncao() %>&nomeCargo=<%= cargo.getNome() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>
