<%@page import="Modelo.DAOUsuario1"%>
<%@page import="Modelo.Usuario"%>
<%
    String opcao = request.getParameter("opcao");
    
    Usuario objUsuario = new Usuario();
    objUsuario.setIdUsuario(Integer.parseInt(request.getParameter("codigoUsuario")));
    objUsuario.setUsuario(request.getParameter("usuarioUsuario"));
    objUsuario.setEmail(request.getParameter("emailUsuario"));
    objUsuario.setSenha(request.getParameter("senhaUsuario"));
    
    DAOUsuario1 daoUsuario = new DAOUsuario1();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
        mensagem = daoUsuario.inserir(objUsuario);
        response.sendRedirect("CadastroUsuario.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
        mensagem = daoUsuario.alterar(objUsuario);
        response.sendRedirect("CadastroUsuario.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
        mensagem = daoUsuario.remover(objUsuario);
        response.sendRedirect("CadastroUsuario.jsp?mensagem="+mensagem);
    }
    
%>