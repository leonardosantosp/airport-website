<%@page import="Modelo.DAOUsuario"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="Menu.jsp" %>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    DAOUsuario login = new DAOUsuario();
    Usuario usuario = new Usuario();
    usuario.setEmail(email);

    ResultSet rs = login.getLogin(usuario);

    if (!rs.next()) {
        response.sendRedirect("index.jsp?mensagem=Login inválido");
    } else {
        String senhaBD = rs.getString("senha");
        String nomeBD = rs.getString("usuario");
        String codigoIDUsuarioBD = rs.getString("idusuario");
        if (!senha.equals(senhaBD)) {
            response.sendRedirect("index.jsp?mensagem=Senha inválida");
        } else {
            session.setAttribute("email", email);
            session.setAttribute("nome", nomeBD);
            session.setAttribute("codigoUsuario", codigoIDUsuarioBD);
        }
    }

%>

<html>
    <head>
        <title>Página Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


    </head>
    <body >
<table width="1001" border="0" align="center" cellspacing="0" >
            <tr bgcolor="#D0D9D0">
                <th width="995" bgcolor="#CCCCCC" scope="col"><p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                                <div class="ajusteLogo">
                                    <img src="imagens/Logo.png" style="height: 300px">
                                </div>
                    <table border="0" cellpadding="0" cellspacing="0" align="center" width="700" bordercolor="#333366">
                        <tr bordercolor="#FFFFFF" bgcolor="#99CCCC">

                            <td colspan="2" valign="top" bgcolor="#CCCCCC">&nbsp;</td>
                        </tr>
                        <tr bordercolor="#006699">

                            <th align="LEFT" width="11%" bordercolor="#FFFFFF">


                                <div align="left"><font face="verdana" size="1"> </font></div>
                            </th>
                       
                            <th align="LEFT" bordercolor="#FFFFFF" width="89%" class="txtAjuste">
                                
                                <p>&nbsp;</p>
                                <p><b><font color="#990000"></font></b>Bem vindo,
                                    voc&ecirc; esta logado! </p>
                                <p><br>
                                    <font color="#990000"></font><font color="#990000"></font>Para
                                    sua seguran&ccedil;a, efetue seu logof sempre que voc&ecirc; sair do nosso
                                    site, para isso clique no link localizado na barra logo acima</p>
                                <p>Em caso de d&uacute;vida, entre em contato pelo e-mail: rna@yahoo.com.br<br>
                                    <br>
                                </p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p></th>
                      
                        </tr>
                    
                    </table>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    
</table>

    </body>
 
</html>