<%@include file="Menu.jsp" %>
<%@page import="Modelo.Aviao"%>
<%@page import="Modelo.DAOAviao"%>
<%@page import="Modelo.Aeroporto"%>
<%@page import="Modelo.DAOAeroporto"%>
<%@page import="Modelo.Cidade"%>
<%@page import="Modelo.DAOCidade"%>
<% if (session.getAttribute("usuario") != null){%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.localSaida.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Local de Saída';
            } else if (document.cadastro.destino.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Destino';
            } else if (document.cadastro.codigoAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Avião';
            } else if (document.cadastro.distanciaRota.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Distância';
            }else if (document.cadastro.aeroportoSaida.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Aeroporto de Saída';
            }else if (document.cadastro.aeroportoDestino.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Aeroporto de Destino';
            }else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAERota.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastrar';
            document.cadastro.localSaida.value = '';
            document.cadastro.destino.value = '';
            document.cadastro.codigoAviao.value = '';
            document.cadastro.distanciaRota.value = '';
            document.cadastro.aeroportoSaida.value = '';
            document.cadastro.aeroportoDestino.value = '';
            document.cadastro.action = 'CadastroRota.jsp';
            document.cadastro.submit();
            
        } else if (par == 'alterar') {

            if (document.cadastro.localSaida.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Local de Saída';
            } else if (document.cadastro.destino.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Destino';
            }else if (document.cadastro.codigoAviao.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Avião';
            }else if (document.cadastro.distanciaRota.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Distância';
            }else if (document.cadastro.aeroportoSaida.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Aeroporto de Saída';
            }else if (document.cadastro.aeroportoDestino.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Aeroporto de Destino';
            }else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAERota.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAERota.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    if(opcao==null)opcao = "cadastrar";
    String codigoRota = request.getParameter("codigoRota");
    if(codigoRota==null)codigoRota="0";
    String localSaida = request.getParameter("localSaida");
    if(localSaida==null){
        localSaida="0";
    }
    String destino = (request.getParameter("destino")); 
    if(destino==null){
        destino="0";
    }
    String codigoAviao = (request.getParameter("codigoAviao"));
    if(codigoAviao==null){
        codigoAviao="0";
    }
    String distanciaRota = request.getParameter("distanciaRota");
    String aeroportoSaida = request.getParameter("aeroportoSaida");
    if(aeroportoSaida==null){
        aeroportoSaida="0";
    }
    String aeroportoDestino = request.getParameter("aeroportoDestino");
    if(aeroportoDestino==null){
        aeroportoDestino="0";
    }
    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listaCidade = daoCidade.listar();
    DAOAeroporto daoAeroporto = new DAOAeroporto();
    List<Aeroporto> listaAeroporto = daoAeroporto.listar();
    DAOAviao daoAviao = new DAOAviao();
    List<Aviao> listaAviao = daoAviao.listar();
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro Rota</title>
    </head>
    <body>
        <h1>Cadastro Rota</h1>
        <form name="cadastro" >
            
            <p><label>Local de Saída : </label>
                <select name="localSaida">
                    <% for(Cidade cidade:listaCidade){%>
                        <% if(localSaida.equals(String.valueOf(cidade.getCodigo()))){ %>    
                            <option selected value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
                        <% }else{%>
                            <option value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
                        <% } %>
                    <% } %>
                </select>
            </p>
            
            <p><label>Local de Destino : </label> 
                <select name="destino">
                    <% for(Cidade cidade:listaCidade){%>
                        <% if(destino.equals(String.valueOf(cidade.getCodigo()))){ %>      
                            <option selected value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
                        <% }else{%>
                            <option value="<%= cidade.getCodigo() %>"><%= cidade.getNome() %></option>
                        <% } %>
                    <% } %>
                </select>
            </p>
            
            <p><label>Avião : </label>
                <select name="codigoAviao">
                    <% for(Aviao aviao:listaAviao){%>
                        <% if(codigoAviao.equals(String.valueOf(aviao.getIdAviao()))){ %>     
                            <option selected value="<%= aviao.getIdAviao() %>"><%= aviao.getModelo() %></option>
                        <% }else{%>
                            <option value="<%= aviao.getIdAviao() %>"><%= aviao.getModelo() %></option>
                        <% } %>
                    <% } %>
                </select>
            </p>
            
            <p><label>Distância : </label> <input type="number" required="" name="distanciaRota" value="<%= (distanciaRota==null)?"":distanciaRota %>" size="50" /></p>
            
            <p><label>Aeroporto de Saída : </label> 
                <select name="aeroportoSaida">
                    <% for(Aeroporto aeroporto:listaAeroporto){%>
                        <% if(aeroportoSaida.equals(String.valueOf(aeroporto.getIdAeroporto()))){ %>       
                            <option selected value="<%= aeroporto.getIdAeroporto() %>"><%= aeroporto.getNome() %></option>
                        <% }else{%>
                            <option value="<%= aeroporto.getIdAeroporto() %>"><%= aeroporto.getNome() %></option>
                        <% } %>
                    <% } %>
                </select>
            </p>
            <p><label>Aeroporto de Destino : </label>
            <select name="aeroportoDestino">
                    <% for(Aeroporto aeroporto:listaAeroporto){%>
                        <% if(aeroportoDestino.equals(String.valueOf(aeroporto.getIdAeroporto()))){ %>     
                            <option selected value="<%= aeroporto.getIdAeroporto() %>"><%= aeroporto.getNome() %></option>
                        <% }else{%>
                            <option value="<%= aeroporto.getIdAeroporto() %>"><%= aeroporto.getNome() %></option>
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
            <input type="hidden" name="codigoRota" value="<%= codigoRota %>">
            <br><br>
            <textarea name="mensagem" rows="2" cols="100">
                <%= (mensagem==null)?"":mensagem%>
            </textarea>
        </form>
        
            <%@include file="ListarRota.jsp" %>
    </body>
</html>
<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>