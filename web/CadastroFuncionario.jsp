<%@include file="Menu.jsp" %>
<%@page import="Modelo.Cargo"%>
<%@page import="Modelo.Cidade"%>
<%@page import="Modelo.DAOCargo"%>
<%@page import="Modelo.DAOCidade"%>
<% if (session.getAttribute("nome") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.nomeFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.salarioFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Salário';
            } else if (document.cadastro.cpfFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cpf';
            } else if (document.cadastro.codigoCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            }else if (document.cadastro.nascimentoFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';
            }else if (document.cadastro.codigoCargo.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cargo';
            }else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEFuncionario.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.nomeFuncionario.value = '';
            document.cadastro.salarioFuncionario.value = '';
            document.cadastro.cpfFuncionario.value = '';
            document.cadastro.codigoCidade.value = '';
            document.cadastro.nascimentoFuncionario.value = '';
            document.cadastro.codigoCargo.value = '';
            document.cadastro.action = 'CadastroFuncionario.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.nomeFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.salarioFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Salário';
            }else if (document.cadastro.cpfFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cpf';
            }else if (document.cadastro.codigoCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            }else if (document.cadastro.nascimentoFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';
            }else if (document.cadastro.codigoCargo.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cargo';
            }else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAEFuncionario.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAEFuncionario.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoFuncionario = request.getParameter("codigoFuncionario");
    if(codigoFuncionario==null)codigoFuncionario="0";
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String salarioFuncionario = request.getParameter("salarioFuncionario"); 
    String cpfFuncionario = request.getParameter("cpfFuncionario");
    String codigoCidade = request.getParameter("codigoCidade");
    if(codigoCidade==null){
        codigoCidade="0";
    }
    String nascimentoFuncionario = request.getParameter("nascimentoFuncionario");
    String codigoCargo = request.getParameter("codigoCargo");
    if(codigoCargo==null){
        codigoCargo="0";
    }
    
    DAOCidade daoCidade = new DAOCidade();
    DAOCargo daoCargo = new DAOCargo();
    List<Cidade> listaCidade = daoCidade.listar();
    List<Cargo> listaCargo = daoCargo.listar();
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Funcionário</title>
    </head>
    <body>
        <h1>Cadastro Funcionário</h1>
        <form name="cadastro" >
            <p><label>Nome : </label> <input type="text" name="nomeFuncionario" value="<%= (nomeFuncionario==null)?"":nomeFuncionario %>" size="50" /></p>
            <p><label>Salário : </label> <input type="number" required="" name="salarioFuncionario" value="<%= (salarioFuncionario==null)?"":salarioFuncionario %>" size="11" /></p>
            <p><label>Cpf : </label> <input type="text" name="cpfFuncionario" value="<%= (cpfFuncionario==null)?"":cpfFuncionario %>" size="50" /></p>
            <p><label>Nascimento : </label> <input type="text" name="nascimentoFuncionario" value="<%= (nascimentoFuncionario==null)?"":nascimentoFuncionario %>" size="50" /></p>
            <p><label>Cidade : </label>
                <select name="codigoCidade">
                    <%for(Cidade cidade:listaCidade) { %> 
                        <% if(codigoCidade.equals(String.valueOf(cidade.getCodigo()))){ %>    
                            <option selected value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
                        <% }else{%>
                            <option value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
                        <% } %>
                    <% } %>
                </select>
            </p>
            <p><label>Cargo : </label>
                <select name="codigoCargo">
                    <%for(Cargo cargo:listaCargo) { %>
                        <% if(codigoCargo.equals(String.valueOf(cargo.getIdCargo()))){ %>   
                            <option selected value="<%= cargo.getIdCargo() %>"><%= cargo.getNome() %></option>
                        <% }else{%>
                            <option value="<%= cargo.getIdCargo() %>"><%= cargo.getNome() %></option>
                        <% } %>
                    <% } %>
                </select>
            </p>
            
            <% if(opcao.equals("cadastrar")){%>
                <input type="button" value="Cadastrar" name="cadastrar" onclick="enviar('cadastrar')" />
            <% }%>
            <% if(opcao.equals("alterar")){%>
                <input type="button" value="Alterar" name="alterar" onclick="enviar('alterar')" />
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')" />
            <% }%>
            <% if(opcao.equals("excluir")){%>
                <input type="button" value="Excluir" name="excluir" onclick="enviar('excluir')" />
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')" />
            <% }%>
            <input type="hidden" name="opcao" value="<%= opcao %>">
            <input type="hidden" name="codigoFuncionario" value="<%= codigoFuncionario %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
        
            <%@include file="ListarFuncionario.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>
