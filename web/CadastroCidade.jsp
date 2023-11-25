<%@include file="Menu.jsp" %>
<% if (session.getAttribute("nome") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.nomeCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            } else if (document.cadastro.ufCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo UF';
            }else if (document.cadastro.cepCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cep';
            }else if (document.cadastro.paisCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Pais';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAECidade.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.nomeCidade.value = '';
            document.cadastro.ufCidade.value = '';
            document.cadastro.cepCidade.value = '';
            document.cadastro.paisCidade.value = '';
            document.cadastro.action = 'CadastroCidade.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.nomeCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.ufCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo UF';
            }else if (document.cadastro.cepCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cep';
            }else if (document.cadastro.paisCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo País';
            } else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAECidade.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAECidade.jsp';
            document.cadastro.submit();
        }
    }
</script>


<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoCidade = request.getParameter("codigoCidade");
    if(codigoCidade==null)codigoCidade="0";
    String nomeCidade = request.getParameter("nomeCidade");
    String ufCidade = request.getParameter("ufCidade");
    String cepCidade = request.getParameter("cepCidade");
    String paisCidade = request.getParameter("paisCidade");
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Cidade</title>
    </head>
    <body>
        <h1>Cadastro Cidade</h1>
        <form name="cadastro" >
            <p><label>Cidade :</label><input type="text" name="nomeCidade" value="<%= (nomeCidade==null)?"":nomeCidade %>" size="50" /></p>
            <p><label>UF :</label><input type="text" name="ufCidade" value="<%= (ufCidade==null)?"":ufCidade %>" size="5" /></p>
            <p><label>CEP :</label><input type="text" name="cepCidade" value="<%= (cepCidade==null)?"":cepCidade %>" size="50" /></p>
            <p><label>País :</label><input type="text" name="paisCidade" value="<%= (paisCidade==null)?"":paisCidade %>" size="50" /></p>
            <%if (opcao.equals("cadastrar")){%>
                <input type="button" value="Cadastrar" name="cadastrar" onclick="enviar('cadastrar')" />
            <%}%>
            <%if (opcao.equals("alterar")){%>
                <input type="button" value="Alterar" name="alterar" onclick="enviar('alterar')" />
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')"/>
            <%}%>
            <%if (opcao.equals("excluir")){%>
                <input type="button" value="Excluir" name="excluir" onclick="enviar('excluir')" />
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')"/>
            <%}%>
            <input type="hidden" name="opcao" value="<%= opcao %>">
            <input type="hidden" name="codigoCidade" value="<%= codigoCidade %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100" readonly="readonly">
                <%= (mensagem==null)?"":mensagem %>
            </textarea>
        </form>
        <%@include file="ListarCidade.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>
