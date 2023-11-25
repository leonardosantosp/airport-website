<%@page import="Modelo.DAOPassageiro"%>
<%@page import="Modelo.Passageiro"%>
<%@page import="Modelo.DAOPassageiroViagem"%>
<%@page import="Modelo.PassageiroViagem"%>
<%@page import="Modelo.DAOViagem"%>
<%@page import="Modelo.ConverteData"%>
<%@page import="Modelo.Viagem"%>
<%
    String codigoViagem = request.getParameter("codigoViagem");
    String idViagemAdquirida = request.getParameter("idViagemAdquirida");
    String dataViagem = request.getParameter("dataViagem");
    String opcao = request.getParameter("opcao");
    
    ConverteData converte = new ConverteData();
    Viagem viagem = new Viagem();
    viagem.setIdViagem(Integer.parseInt(request.getParameter("codigoViagem")));
    viagem.getRota().setIdRota(Integer.parseInt(request.getParameter("codigoRota")));
    viagem.setData(converte.converteCalendario(request.getParameter("dataViagem")));
    viagem.setLinhaAerea(request.getParameter("linhaAerea"));
    
    DAOViagem daoViagem = new DAOViagem();
    PassageiroViagem passageiroViagem = new PassageiroViagem();
    
    DAOPassageiroViagem daoPassageiroViagem = new DAOPassageiroViagem();
    
    if(opcao.equals("cadastrar") && codigoViagem.equals("0")){
        response.sendRedirect("CadastroViagem.jsp?mensagem=" + daoViagem.inserir(viagem)+"&codigoViagem="+daoViagem.getLastId()+"&codigoRota="+viagem.getRota().getIdRota()+"&dataViagem="+dataViagem+"&linhaAerea="+viagem.getLinhaAerea());
    }
    if(opcao.equals("vincular")){
        Passageiro passageiro = new Passageiro();
        DAOPassageiro daoPassageiro = new DAOPassageiro();
        
        
        passageiro = daoPassageiro.localizar(Integer.parseInt(request.getParameter("idPassageiro")));
        passageiroViagem.setIdviagem(Integer.parseInt(codigoViagem));
        System.out.println("idPassageiro="+request.getParameter("idPassageiro"));
        passageiroViagem.getPassageiro().setIdPassageiro(Integer.parseInt(request.getParameter("idPassageiro"))); ;
        double precoViagem = passageiroViagem.getPrecoViagem();
        passageiroViagem.getClasse().setIdClasse(Integer.parseInt(request.getParameter("idClasse")));
        passageiroViagem.setPrecoViagem(Integer.parseInt(request.getParameter("precoViagem")));
        response.sendRedirect("CadastroViagem.jsp?mensagem=" + daoPassageiroViagem.inserir(passageiroViagem)+"&codigoViagem="+codigoViagem+"&codigoRota="+viagem.getRota().getIdRota()+"&dataViagem="+dataViagem+"&linhaAerea="+viagem.getLinhaAerea());
    }
    if(opcao.equals("remover")){
    passageiroViagem.setIdPassageiroViagem(Integer.parseInt(idViagemAdquirida));
    response.sendRedirect("CadastroViagem.jsp?mensagem=" + daoPassageiroViagem.remover(passageiroViagem)+"&codigoViagem="+codigoViagem+"&codigoRota="+viagem.getRota().getIdRota()+"&dataViagem="+dataViagem+"&linhaAerea="+viagem.getLinhaAerea());
    }
    if (opcao.equals("finalizar")){
        response.sendRedirect("CadastroViagem.jsp?mensagem=Vincular Finalizada&codigoViagem=0");
    }
    if (opcao.equals("cancelar")){
        response.sendRedirect("CadastroViagem.jsp?mensagem=" + daoViagem.remover(viagem) +"&codigoViagem=0");
    }
%>