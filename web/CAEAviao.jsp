<%@page import="Modelo.DAOAviao"%>
<%@page import="Modelo.Aviao"%>
<%
    String opcao = request.getParameter("opcao");
    
    Aviao objAviao = new Aviao();
    objAviao.setIdAviao(Integer.parseInt(request.getParameter("codigoAviao")));
    objAviao.setTamanho(Double.parseDouble(request.getParameter("tamanhoAviao")));
    objAviao.setCapacidade(Integer.parseInt(request.getParameter("capacidadeAviao")));
    objAviao.setModelo(request.getParameter("modeloAviao"));
    objAviao.setCor(request.getParameter("corAviao"));
    
    DAOAviao daoAviao = new DAOAviao();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
    mensagem = daoAviao.inserir(objAviao);
    response.sendRedirect("CadastroAviao.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
    mensagem = daoAviao.alterar(objAviao);
    response.sendRedirect("CadastroAviao.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
    mensagem = daoAviao.remover(objAviao);
    response.sendRedirect("CadastroAviao.jsp?mensagem="+mensagem);
    }
    
%>