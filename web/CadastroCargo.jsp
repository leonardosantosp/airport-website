<%@include file="Menu.jsp" %>
<% if (session.getAttribute("nome") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.funcaoCargo.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Função';
            } else if (document.cadastro.nomeCargo.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAECargo.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.nomeCargo.value = '';
            document.cadastro.funcaoCargo.value = '';
            document.cadastro.action = 'CadastroCargo.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.funcaoCargo.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Função';
            } else if (document.cadastro.nomeCargo.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAECargo.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAECargo.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoCargo = request.getParameter("codigoCargo");
    if(codigoCargo==null)codigoCargo = "0";
    String funcaoCargo = request.getParameter("funcaoCargo");
    String nomeCargo = request.getParameter("nomeCargo");
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Cargo</title>
    </head>
    <body>
        <h1>Cadastro Cargo</h1>
        <form name="cadastro" >
            <p><label>Função : </label> <input type="text" name="funcaoCargo" value="<%= (funcaoCargo==null)?"":funcaoCargo%>" size="150" /></p>
            <p><label>Nome : </label> <input type="text" name="nomeCargo" value="<%= (nomeCargo==null)?"":nomeCargo%>" size="50" /></p>
            <% if(opcao.equals("cadastrar")){%>
            <input type="button" value="Cadastrar" name="cadastrar" onclick="enviar('cadastrar')" />
            <% }%>
            <% if(opcao.equals("alterar")){%>
                <input type="button" value="Alterar" name="alterar" onclick="enviar('alterar')" />
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')" />
            <% }%>
            <% if(opcao.equals("excluir")){%>
                <input type="button" value="Excluir" name="excluir" onclick="enviar('excluir')"/>
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')" />
            <% }%>
            <input type="hidden" name="opcao" value="<%= opcao %>">
            <input type="hidden" name="codigoCargo" value="<%= codigoCargo %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
            <%@include file="ListarCargo.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>