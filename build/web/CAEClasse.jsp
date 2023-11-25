<%@page import="Modelo.DAOClasse"%>
<%@page import="Modelo.Classe"%>
<%
    String opcao = request.getParameter("opcao");
    
    Classe objClasse = new Classe();    
    objClasse.setIdClasse(Integer.parseInt(request.getParameter("codigoClasse")));
    objClasse.setPreco(Double.parseDouble(request.getParameter("precoClasse")));
    objClasse.setTipo(request.getParameter("tipoClasse"));

    DAOClasse daoClasse = new DAOClasse();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
        mensagem = daoClasse.inserir(objClasse);
        response.sendRedirect("CadastroClasse.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
        mensagem = daoClasse.alterar(objClasse);
        response.sendRedirect("CadastroClasse.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
        mensagem = daoClasse.remover(objClasse);
        response.sendRedirect("CadastroClasse.jsp?mensagem="+mensagem);
    }
    
%>