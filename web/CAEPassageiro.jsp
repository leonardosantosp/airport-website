<%@page import="Modelo.DAOPassageiro"%>
<%@page import="Modelo.ConverteData"%>
<%@page import="Modelo.Passageiro"%>
<%
    ConverteData converte = new ConverteData();
    String opcao = request.getParameter("opcao");
    
    Passageiro objPassageiro = new Passageiro();
    objPassageiro.setIdPassageiro(Integer.parseInt(request.getParameter("codigoPassageiro")));
    objPassageiro.setNome(request.getParameter("nomePassageiro"));
    objPassageiro.setTelefone(request.getParameter("telefonePassageiro"));
    objPassageiro.setCpf(request.getParameter("cpfPassageiro"));
    objPassageiro.setNascimento(converte.converteCalendario(request.getParameter("nascimentoPassageiro")));
    objPassageiro.getCidade().setCodigo(Integer.parseInt(request.getParameter("codigoCidade")));
    
    DAOPassageiro daoPassageiro = new DAOPassageiro();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
    mensagem = daoPassageiro.inserir(objPassageiro);
    response.sendRedirect("CadastroPassageiro.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
    mensagem = daoPassageiro.alterar(objPassageiro);
    response.sendRedirect("CadastroPassageiro.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
    mensagem = daoPassageiro.remover(objPassageiro);
    response.sendRedirect("CadastroPassageiro.jsp?mensagem="+mensagem);
    }
    
%>