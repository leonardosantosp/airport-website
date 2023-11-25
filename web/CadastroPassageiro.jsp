<%@include file="Menu.jsp" %>
<%@page import="Modelo.Cidade"%>
<%@page import="Modelo.DAOCidade"%>
<% if (session.getAttribute("nome") != null){
System.out.println("nome="+session.getAttribute("nome"));
%>
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
    String codigoPassageiro = request.getParameter("codigoPassageiro");
    if(codigoPassageiro==null)codigoPassageiro="0";
    String nomePassageiro = request.getParameter("nomePassageiro");
    String telefonePassageiro = (request.getParameter("telefonePassageiro")); 
    String cpfPassageiro = (request.getParameter("cpfPassageiro"));
    String nascimentoPassageiro = request.getParameter("nascimentoPassageiro");
    String codigoCidade = request.getParameter("codigoCidade");
    if(codigoCidade==null){
        codigoCidade="0";
    }
    
    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listaCidade = daoCidade.listar();
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Passageiro</title>
    </head>
    <body>
        <h1>Cadastro Passageiro</h1>
        <form name="cadastro" >
            <p><label>Nome : </label> <input type="text" name="nomePassageiro" value="<%= (nomePassageiro==null)?"":nomePassageiro %>" size="50" /></p>
            <p><label>Telefone : </label> <input type="text" name="telefonePassageiro" value="<%= (telefonePassageiro==null)?"":telefonePassageiro %>" size="50" /></p>
            <p><label>Cpf : </label> <input type="text" name="cpfPassageiro" value="<%= (cpfPassageiro==null)?"":cpfPassageiro %>" size="50" /></p>
            <p><label>Nascimento : </label> <input type="text" name="nascimentoPassageiro" value="<%= (nascimentoPassageiro==null)?"":nascimentoPassageiro %>" size="50" /></p>
            
            <p><label>Cidade : </label>
                <select name="codigoCidade">
                    <% for(Cidade cidade:listaCidade){ %>
                        <% if(codigoCidade.equals(String.valueOf(cidade.getCodigo()))){ %>
                            <option  selected value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
                        <% }else{%>
                            <option value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
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
            <input type="hidden" name="codigoPassageiro" value="<%= codigoPassageiro %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
        
            <%@include file="ListarPassageiro.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>