<%@include file="Menu.jsp" %>
<% if (session.getAttribute("usuario") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.usuarioUsuario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Usuário';
            } else if (document.cadastro.emailUsuario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo E-mail';
            } else if (document.cadastro.senhaUsuario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Senha';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEUsuario.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cancelar';
            document.cadastro.usuarioUsuario.value = '';
            document.cadastro.emailUsuario.value = '';
            document.cadastro.senhaUsuario.value = '';
            document.cadastro.action = 'CadastroUsuario.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.usuarioUsuario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Usuário';
            } else if (document.cadastro.emailUsuario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo E-mail';
            } else if (document.cadastro.senhaUsuario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Senha';
            } else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAEUsuario.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAEUsuario.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoUsuario = request.getParameter("codigoUsuario");
    if(codigoUsuario==null)codigoUsuario="0";
    String usuarioUsuario = request.getParameter("usuarioUsuario");
    String emailUsuario = request.getParameter("emailUsuario");
    String senhaUsuario = request.getParameter("senhaUsuario");
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Usuário</title>
    </head>
    <body>
        <h1>Cadastro Usuário</h1>
        <form name="cadastro" >
            <p><label>Usuário : </label> <input type="text" name="usuarioUsuario" value="<%= (usuarioUsuario==null)?"":usuarioUsuario %>" size="50" /></p>
            <p><label>E-mail : </label> <input type="text" name="emailUsuario" value="<%= (emailUsuario==null)?"":emailUsuario %>" size="50" /></p>
            <p><label>Senha : </label><input type="password" name="senhaUsuario" value="<%= (senhaUsuario==null)?"":senhaUsuario %>" size="50" /></p>
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
            <input type="hidden" name="codigoUsuario" value="<%= codigoUsuario %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
            <%@include file="ListarUsuario.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>