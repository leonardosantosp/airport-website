<%@page import="Modelo.DAOCidade"%>
<%@page import="Modelo.Cidade"%>
<% 
    String opcao = request.getParameter("opcao");
    
    Cidade objCidade = new Cidade();
    objCidade.setCodigo(Integer.parseInt(request.getParameter("codigoCidade")));
    objCidade.setNome(request.getParameter("nomeCidade"));
    objCidade.setUf(request.getParameter("ufCidade"));
    objCidade.setCep(request.getParameter("cepCidade"));
    objCidade.setPais(request.getParameter("paisCidade"));
    
    DAOCidade daoCidade = new DAOCidade();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
        mensagem = daoCidade.inserir(objCidade);
        response.sendRedirect("CadastroCidade.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
        mensagem = daoCidade.alterar(objCidade);
        response.sendRedirect("CadastroCidade.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
        mensagem = daoCidade.remover(objCidade);
        response.sendRedirect("CadastroCidade.jsp?mensagem="+mensagem);
    }
%>