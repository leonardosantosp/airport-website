<%@page import="Modelo.Passageiro"%>
<%@page import="Modelo.DAOPassageiro"%>
<%@page import="Modelo.ConverteData"%>
<%@page import="java.util.List"%>
<%
    DAOPassageiro daoPassageiro = new DAOPassageiro();
    List<Passageiro> listPassageiro = daoPassageiro.listar();
    ConverteData converte = new ConverteData();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>TELEFONE</th>
            <th>CPF</th>
            <th>NASCIMENTO</th>
            <th>CIDADE</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Passageiro passageiro: listPassageiro){%>
            <tr>
                <td><%= passageiro.getIdPassageiro() %></td>
                <td><%= passageiro.getNome() %></td>
                <td><%= passageiro.getTelefone() %></td>
                <td><%= passageiro.getCpf() %></td>
                <td><%= converte.converteTela(passageiro.getNascimento()) %></td>
                <td><%= passageiro.getCidade().getNome() %></td>
                <td><a href="CadastroPassageiro.jsp?opcao=alterar&codigoPassageiro=<%= passageiro.getIdPassageiro() %>&nomePassageiro=<%= passageiro.getNome() %>&telefonePassageiro=<%= passageiro.getTelefone() %>&cpfPassageiro=<%= passageiro.getCpf() %>&nascimentoPassageiro=<%= converte.converteTela(passageiro.getNascimento()) %>&codigoCidade=<%= passageiro.getCidade().getCodigo() %>">alterar</a></td>
                <td><a href="CadastroPassageiro.jsp?opcao=excluir&codigoPassageiro=<%= passageiro.getIdPassageiro() %>&nomePassageiro=<%= passageiro.getNome() %>&telefonePassageiro=<%= passageiro.getTelefone() %>&cpfPassageiro=<%= passageiro.getCpf() %>&nascimentoPassageiro=<%= converte.converteTela(passageiro.getNascimento()) %>&codigoCidade=<%= passageiro.getCidade().getCodigo() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>
