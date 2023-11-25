<%@page import="Modelo.DAORota"%>
<%@page import="Modelo.Rota"%>
<%@page import="Modelo.DAOFuncionario"%>
<%@page import="Modelo.Funcionario"%>
<%
    String opcao = request.getParameter("opcao");
    
    Rota objRota = new Rota();
    objRota.setIdRota(Integer.parseInt(request.getParameter("codigoRota")));
    objRota.getLocalSaida().setCodigo(Integer.parseInt(request.getParameter("localSaida")));
    objRota.getDestino().setCodigo(Integer.parseInt(request.getParameter("destino")));
    objRota.getAviao().setIdAviao(Integer.parseInt(request.getParameter("codigoAviao")));
    objRota.setDistanciaRota(Double.parseDouble(request.getParameter("distanciaRota")));
    objRota.getAeroportoSaida().setIdAeroporto(Integer.parseInt(request.getParameter("aeroportoSaida")));
    objRota.getAeroportoDestino().setIdAeroporto(Integer.parseInt(request.getParameter("aeroportoDestino")));
    
    DAORota daoRota = new DAORota();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
    mensagem = daoRota.inserir(objRota);
    response.sendRedirect("CadastroRota.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
    mensagem = daoRota.alterar(objRota);
    response.sendRedirect("CadastroRota.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
    mensagem = daoRota.remover(objRota);
    response.sendRedirect("CadastroRota.jsp?mensagem="+mensagem);
    }
    
%>