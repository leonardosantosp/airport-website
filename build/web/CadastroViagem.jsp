<%-- 
    Document   : CadastroAviao
    Created on : 30/04/2021, 19:25:12
    Author     : Asus
--%>

<%@page import="Modelo.DAOClasse"%>
<%@page import="Modelo.Classe"%>
<%@page import="Modelo.ConverteData"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.PassageiroViagem"%>
<%@page import="Modelo.DAOPassageiroViagem"%>
<%@page import="Modelo.DAOPassageiro"%>
<%@page import="Modelo.Passageiro"%>
<%@page import="Modelo.Rota"%>
<%@page import="Modelo.DAORota"%>
<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.codigoRota.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Rota';
            } else if (document.cadastro.dataViagem.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Data da Viagem';
            } else if (document.cadastro.linhaAerea.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Linha Aérea';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEViagem.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'vincular') {
             if (document.cadastro.idPassageiro.value == '') {
                document.cadastro.mensagem.value = 'Selecione um passageiro para a viagem';
            } else {
                document.cadastro.opcao.value = 'vincular';
                document.cadastro.action = 'CAEViagem.jsp';
                document.cadastro.submit();
            
              }
        } else if (par == 'remover') {

           if (document.cadastro.idViagemAdquirida.value == '') {
                document.cadastro.mensagem.value = 'Selecione um passageiro para remover';
            } else {
            document.cadastro.opcao.value = 'remover';
            document.cadastro.action = 'CAEViagem.jsp';
            document.cadastro.submit();
        }
        }else if (par == 'finalizar') {
            document.cadastro.opcao.value = 'finalizar';
            document.cadastro.action = 'CAEViagem.jsp';
            document.cadastro.submit();
        } 
        else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cancelar';
            document.cadastro.action = 'CAEViagem.jsp';
            document.cadastro.submit();
        }
    }
</script>

<%
    ConverteData converte = new ConverteData();
    
    DAORota daoRota = new DAORota();
    List<Rota> listaRota = daoRota.listar();
    
    DAOClasse daoClasse = new DAOClasse();
    List<Classe> listaClasse = daoClasse.listar();
    
    DAOPassageiro daoPassageiro = new DAOPassageiro();
    List<Passageiro> listaPassageiro = daoPassageiro.listar();
    
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    String codigoViagem = request.getParameter("codigoViagem");
    String codigoRota = request.getParameter("codigoRota");
    String dataViagem = (request.getParameter("dataViagem")); 
    String linhaAerea = request.getParameter("linhaAerea");
    
    if(codigoViagem == null){
        codigoViagem="0";
    }
    if(codigoRota==null){
        codigoRota="0";
    }
    if (opcao == null) {
        opcao = "nulo";
    }
Passageiro passageiro = new Passageiro();
DAOPassageiroViagem daoPassageiroViagem = new DAOPassageiroViagem();
List<PassageiroViagem> listaPassageiroViagem = daoPassageiroViagem.listar(Integer.parseInt(codigoViagem));
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Viagem</title>
    </head>
    <body>
        <h1>Viagem: <%= codigoViagem %> - <%= codigoRota %></h1>
        <form name="cadastro" >
            <p><label>Rota : </label>
                <select name="codigoRota">
                    <% for(Rota lista: listaRota){%>
                        <% if(codigoRota.equals(String.valueOf(lista.getIdRota()))){ %> 
                            <option selected value="<%= lista.getIdRota() %>"><%= lista.getIdRota() %></option>
                        <% }else{%>
                            <option value="<%= lista.getIdRota() %>"><%= lista.getIdRota() %></option>
                        <% } %>
                    <% } %>
                </select>
            </p>

            <p><label>Data da Viagem : </label> <input type="text" name="dataViagem" value="<%= (dataViagem==null)?"":dataViagem %>" size="11" /></p>
            <p><label>Linha Aérea : </label> <input type="text" name="linhaAerea" value="<%= (linhaAerea==null)?"":linhaAerea %>" size="50" /></p>
            
            <% if (!codigoViagem.equals("0")) { %>
                <table border="0" cellspacing="3" cellpadding="3">
                    <tr>
                        <td>
                            <p>  <label> Lista de Passageiros:</label> <br>
                                <select name="idPassageiro" size="10">
                                    <% for (Passageiro lista : listaPassageiro) {%>
                                        <option  value="<%= lista.getIdPassageiro() %>"><%= lista.getIdPassageiro() %> CPF: <%= lista.getCpf() %>  Nome:<%= lista.getNome() %></option>
                                    <% } %>
                                </select></p>
                        </td>
                    <td>
                                <select name="idClasse" size="10">
                                    <% for (Classe lista : listaClasse) {%>
                                        <option  value="<%= lista.getIdClasse() %>"><%= lista.getIdClasse() %>Tipo:<%= lista.getTipo() %></option>
                                    <% } %>
                                </select></p>
                    </td>
                    <td>
                    <td>
                        Preço.<br>
                        <input type="number" required="" name="precoViagem" value="5"  size="2" /><br><br>
                        
                        <input type="button" value="Vincular" name="vincular" onclick="enviar('vincular')" />
                    </td>
                   
                    <td>
                        <p>  <label> PassageirosVinculados:</label> <br>
                            <select name="idViagemAdquirida" size="10">
                                <% for (PassageiroViagem lista : listaPassageiroViagem) {%>
                                    <option  value="<%= lista.getIdPassageiroViagem() %>"><%= lista.getPassageiro().getNome() %> R$: <%= lista.getPrecoViagem() %> Classe: <%= lista.getClasse().getTipo() %> Viagem: <%= lista.getIdviagem() %></option>
                                <% } %>
                            </select>
                        <input type="button" value="Remover" name="remover" onclick="enviar('remover')" />
                        </p>
                    </td>
                </tr>

            </table>

             <% } %>               
                            
            <% if(codigoViagem.equals("0")){ %>
                <input type="button" value="Cadastrar" name="cadastrar" onclick="enviar('cadastrar')" />
            <% } %>
            
            <% if(!codigoViagem.equals("0")){ %>
                <input type="button" value="Finalizar" name="finalizar" onclick="enviar('finalizar')" />
                <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')" />
            <% }%>
            
        </p>       
            <p><textarea name="mensagem" rows="2" cols="60">    
            <%= (mensagem==null)?"":mensagem%></textarea></p>
        
            <input type="hidden" name="opcao"/>
            <input type="hidden" name="codigoViagem" value="<%= codigoViagem%>">
            
        </form>
    </body>
</html>