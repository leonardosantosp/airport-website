
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.nomePassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.telefonePassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Telefone';
            } else if (document.cadastro.cpfPassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cpf';
            } else if (document.cadastro.nascimentoPassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';
            }else if (document.cadastro.codigoCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            }else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEPassageiro.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.nomePassageiro.value = '';
            document.cadastro.telefonePassageiro.value = '';
            document.cadastro.cpfPassageiro.value = '';
            document.cadastro.nascimentoPassageiro.value = '';
            document.cadastro.codigoCidade.value = '';
            document.cadastro.action = 'CadastroPassageiro.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.nomePassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.telefonePassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Telefone';
            }else if (document.cadastro.cpfPassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cpf';
            }else if (document.cadastro.nascimentoPassageiro.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';
            }else if (document.cadastro.codigoCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            }else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAEPassageiro.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAEPassageiro.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoPassageiroViagem = request.getParameter("codigoPassageiroViagem");
    if(codigoPassageiroViagem==null)codigoPassageiroViagem="0";
    String codigoPassageiro = request.getParameter("codigoPassageiro");
    String precoViagem = (request.getParameter("precoViagem")); 
    String codigoClasse = (request.getParameter("codigoClasse"));
    String codigoViagem = request.getParameter("codigoViagem");
    if(codigoPassageiroViagem==null){
        codigoPassageiroViagem="0";
    }
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Viagem Passageiro</title>
    </head>
    <body>
        <h1>Cadastro Viagem Passageiro</h1>
        <form name="cadastro" >
            <p><label>Passageiro : </label> <input type="text" name="codigoPassageiro" value="<%= (codigoPassageiro==null)?"":codigoPassageiro %>" size="50" /></p>
            <p><label>Preço Viagem : </label> <input type="number" required="" name="precoViagem" value="<%= (precoViagem==null)?"":precoViagem %>" size="50" /></p>
            <p><label>Classe : </label> <input type="text" name="codigoClasse" value="<%= (codigoClasse==null)?"":codigoClasse %>" size="50" /></p>
            <p><label>Viagem : </label> <input type="text" name="codigoViagem" value="<%= (codigoViagem==null)?"":codigoViagem %>" size="50" /></p>
            
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
            <input type="hidden" name="codigoPassageiroViagem" value="<%= codigoPassageiroViagem %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
        
            <%@include file="ListarPassageiroViagem.jsp" %>
    </body>
</html>