<%-- 
    Document   : index
    Created on : 22/10/2018, 14:47:50
    Author     : tulio
--%>
<script>
            function enviar(par){
                if (par == 'login'){
                    if (document.cadastro.email.value == ''){
                      alert("Preencha o campo email");
                    }else if (document.cadastro.senha.value == ''){
                        alert("Preencha o campo senha");
                    }else {
                        document.cadastro.action='LoginUsuario.jsp';
                        document.cadastro.submit();
                    }
                } 
            }
        </script>
        <% String mensagem = request.getParameter("mensagem"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
        <title>JSP Page</title>
    </head>
    <body class="bodyLogin">
        <div class="Logoimg"><img src="imagens/Logo.png" width="150"></div>
        <div class="contentLogin">
            <form action=""  name="cadastro" method="get" class="formLogin">
            <img src="imagens/login.jpg" width="150">
                <p>email: <input type="text" name="email" value="" size="20" /> </p>
            <p>senha:<input type="password" name="senha" value="" size="20" /> </p>
            <div class="btnOk"><p><input class="imputLogin" type="submit" name="login"  onClick="enviar('login')" 
                       value="OK"></p>
            </div>
            </form>
            </div>
            <p><% if (mensagem != null){ %><%= mensagem %><% } %></p>
    </body>
</html>