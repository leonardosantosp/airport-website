<%@page import="Modelo.DAOCargo"%>
<%@page import="Modelo.Cargo"%>
<%
    
    String opcao = request.getParameter("opcao");
    
    Cargo objCargo = new Cargo();
    objCargo.setIdCargo(Integer.parseInt(request.getParameter("codigoCargo")));
    objCargo.setFuncao(request.getParameter("funcaoCargo"));
    objCargo.setNome(request.getParameter("nomeCargo"));
    
    DAOCargo daoCargo = new DAOCargo();
    
    String mensagem = "";
    if(opcao.equals("cadastrar")){
        mensagem = daoCargo.inserir(objCargo);
        response.sendRedirect("CadastroCargo.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
        mensagem = daoCargo.alterar(objCargo);
        response.sendRedirect("CadastroCargo.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
        mensagem = daoCargo.remover(objCargo);
        response.sendRedirect("CadastroCargo.jsp?mensagem="+mensagem);
    }
%>
