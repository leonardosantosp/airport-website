<%@include file="Menu.jsp" %>
<% if (session.getAttribute("nome") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.tamanhoAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Tamanho';
            } else if (document.cadastro.capacidadeAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Capacidade';
            } else if (document.cadastro.modeloAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Modelo';
            } else if (document.cadastro.corAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cor';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEAviao.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.tamanhoAviao.value = '';
            document.cadastro.capacidadeAviao.value = '';
            document.cadastro.modeloAviao.value = '';
            document.cadastro.corAviao.value = '';
            document.cadastro.action = 'CadastroAviao.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.tamanhoAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Tamanho';
            } else if (document.cadastro.capacidadeAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Capacidade';
            }else if (document.cadastro.modeloAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Modelo';
            }else if (document.cadastro.corAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cor';
            } else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAEAviao.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAEAviao.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoAviao = request.getParameter("codigoAviao");
    if(codigoAviao==null)codigoAviao="0";
    String tamanhoAviao = (request.getParameter("tamanhoAviao")); 
    String capacidadeAviao = (request.getParameter("capacidadeAviao"));
    String modeloAviao = request.getParameter("modeloAviao");
    String corAviao = request.getParameter("corAviao");
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Avião</title>
    </head>
    <body>
        <h1>Cadastro Avião</h1>
        <form name="cadastro" >
            <p><label>Tamanho : </label> <input type="number" required="" name="tamanhoAviao" value="<%= (tamanhoAviao==null)?"":tamanhoAviao %>" size="50" /></p>
            <p><label>Capacidade : </label> <input type="number" required="" name="capacidadeAviao" value="<%= (capacidadeAviao==null)?"":capacidadeAviao %>" size="11" /></p>
            <p><label>Modelo : </label> <input type="text" name="modeloAviao" value="<%= (modeloAviao==null)?"":modeloAviao %>" size="50" /></p>
            <p><label>Cor : </label> <input type="text" name="corAviao" value="<%= (corAviao==null)?"":corAviao %>" size="50" /></p>
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
            <input type="hidden" name="codigoAviao" value="<%= codigoAviao %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
        
            <%@include file="ListarAviao.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>