<%@page import="Modelo.ConverteData"%>
<%@page import="Modelo.Funcionario"%>
<%@page import="Modelo.DAOFuncionario"%>
<%@page import="java.util.List"%>
<%
    DAOFuncionario daoFuncionario = new DAOFuncionario();
    List<Funcionario> listFuncionario = daoFuncionario.listar();
    ConverteData converte = new ConverteData();
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>SALÁRIO</th>
            <th>CPF</th>
            <th>CIDADE</th>
            <th>NASCIMENTO</th>
            <th>CARGO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Funcionario funcionario: listFuncionario){%>
            <tr>
                <td><%= funcionario.getIdFuncionario() %></td>
                <td><%= funcionario.getNome() %></td>
                <td><%= funcionario.getSalario() %></td>
                <td><%= funcionario.getCpf() %></td>
                <td><%= funcionario.getCidade().getNome() %></td>
                <td><%= converte.converteTela(funcionario.getNascimento()) %></td>
                <td><%= funcionario.getCargo().getNome() %></td>
                
                <td><a href="CadastroFuncionario.jsp?opcao=alterar&codigoFuncionario=<%= funcionario.getIdFuncionario() %>&nomeFuncionario=<%= funcionario.getNome() %>&salarioFuncionario=<%= funcionario.getSalario() %>&cpfFuncionario=<%= funcionario.getCpf() %>&codigoCidade=<%= funcionario.getCidade().getCodigo() %>&nascimentoFuncionario=<%= converte.converteTela(funcionario.getNascimento()) %>&codigoCargo=<%= funcionario.getCargo().getIdCargo() %>">alterar</a></td>
                <td><a href="CadastroFuncionario.jsp?opcao=excluir&codigoFuncionario=<%= funcionario.getIdFuncionario() %>&nomeFuncionario=<%= funcionario.getNome() %>&salarioFuncionario=<%= funcionario.getSalario() %>&cpfFuncionario=<%= funcionario.getCpf() %>&codigoCidade=<%= funcionario.getCidade().getCodigo() %>&nascimentoFuncionario=<%= converte.converteTela(funcionario.getNascimento()) %>&codigoCargo=<%= funcionario.getCargo().getIdCargo() %>">excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>
