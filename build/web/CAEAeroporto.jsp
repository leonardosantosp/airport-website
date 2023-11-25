<%@page import="Modelo.DAOAeroporto"%>
<%@page import="Modelo.Aeroporto"%>
<%
    String opcao = request.getParameter("opcao");
    
    Aeroporto objAeroporto = new Aeroporto();
    objAeroporto.setIdAeroporto(Integer.parseInt(request.getParameter("codigoAeroporto")));
    objAeroporto.setNome(request.getParameter("nomeAeroporto"));
    objAeroporto.getCidade().setCodigo(Integer.parseInt(request.getParameter("codigoCidade")));
    objAeroporto.setEndereco(request.getParameter("enderecoAeroporto"));
    
    DAOAeroporto daoAeroporto = new DAOAeroporto();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
    mensagem = daoAeroporto.inserir(objAeroporto);
    response.sendRedirect("CadastroAeroporto.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
    mensagem = daoAeroporto.alterar(objAeroporto);
    response.sendRedirect("CadastroAeroporto.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
    mensagem = daoAeroporto.remover(objAeroporto);
    response.sendRedirect("CadastroAeroporto.jsp?mensagem="+mensagem);
    }
    
%>