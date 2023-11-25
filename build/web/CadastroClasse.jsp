<%@include file="Menu.jsp" %>
<% if (session.getAttribute("nome") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.precoClasse.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Preço';
            } else if (document.cadastro.tipoClasse.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Tipo';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEClasse.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.precoClasse.value = '';
            document.cadastro.tipoClasse.value = '';
            document.cadastro.action = 'CadastroClasse.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.precoClasse.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Preço';
            } else if (document.cadastro.tipoClasse.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Tipo';
            } else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAEClasse.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAEClasse.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoClasse = request.getParameter("codigoClasse");
    if(codigoClasse==null)codigoClasse="0";
    String precoClasse = request.getParameter("precoClasse");
    String tipoClasse = request.getParameter("tipoClasse");
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Classe</title>
    </head>
    <body>
        <h1>Cadastro Classe</h1>
        <form name="cadastro" >
            <p><label>Preço : </label><input type="number" required="" name="precoClasse" value="<%= (precoClasse==null)?"":precoClasse %>" size="50" /></p>
            <p><label>Tipo : </label><input type="text" name="tipoClasse" value="<%= (tipoClasse==null)?"":tipoClasse %>" size="50" /></p>
            <% if(opcao.equals("cadastrar")){%>
                <input type="button" value="Cadastrar" name="cadastrar" onclick="enviar('cadastrar')" />
            <% }%>
            <% if(opcao.equals("alterar")){%>
                <input type="button" value="Alterar" name="alterar" onclick="enviar('alterar')"/>
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')"/>
            <% }%>
            <% if(opcao.equals("excluir")){%>
                <input type="button" value="Excluir" name="excluir" onclick="enviar('excluir')" />
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')" />
            <% }%>
            <input type="hidden" name="opcao" value="<%= opcao %>">
            <input type="hidden" name="codigoClasse" value="<%= codigoClasse %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%> 
            </textarea>
        </form>
            <%@include file="ListarClasse.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>