<%@include file="Menu.jsp" %>
<%@page import="Modelo.Cidade"%>
<%@page import="Modelo.DAOCidade"%>
<% if (session.getAttribute("nome") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.nomeAeroporto.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.codigoCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            } else if (document.cadastro.enderecoAeroporto.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Endereço';
            }else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEAeroporto.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.nomeAeroporto.value = '';
            document.cadastro.codigoCidade.value = '';
            document.cadastro.enderecoAeroporto.value = '';
            document.cadastro.action = 'CadastroAeroporto.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.nomeAeroporto.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.codigoCidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            }else if (document.cadastro.enderecoAeroporto.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Endereço';
            }else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAEAeroporto.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAEAeroporto.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoAeroporto = request.getParameter("codigoAeroporto");
    if(codigoAeroporto==null)codigoAeroporto="0";
    String nomeAeroporto = (request.getParameter("nomeAeroporto")); 
    String codigoCidade = (request.getParameter("codigoCidade"));
    String enderecoAeroporto = request.getParameter("enderecoAeroporto");
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
        <title>Cadastro Aeroporto</title>
    </head>
    <body>
        <h1>Cadastro Aeroporto</h1>
        <form name="cadastro" >
            <p><label>Nome : </label> <input type="txt" name="nomeAeroporto" value="<%= (nomeAeroporto==null)?"":nomeAeroporto %>" size="50" /></p>
            <p><label>Endereço : </label> <input type="text" name="enderecoAeroporto" value="<%= (enderecoAeroporto==null)?"":enderecoAeroporto %>" size="50" /></p>
            <p><label>Cidade : </label>
                <select name="codigoCidade">
                    <% for(Cidade cidade:listaCidade) { %>
                        <% if(codigoCidade.equals(String.valueOf(cidade.getCodigo()))){ %>
                            <option selected value="<%=cidade.getCodigo() %>"><%=cidade.getNome() %></option>
                        <% }else{%>
                            <option value="<%=cidade.getCodigo() %>"><%=cidade.getNome() %></option>
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
            <input type="hidden" name="codigoAeroporto" value="<%= codigoAeroporto %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
        
            <%@include file="ListarAeroporto.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>