<%@page import="Modelo.DAOFuncionario"%>
<%@page import="Modelo.ConverteData"%>
<%@page import="Modelo.Funcionario"%>
<%
    ConverteData converte = new ConverteData();
    String opcao = request.getParameter("opcao");
    
    Funcionario objFuncionario = new Funcionario();
    objFuncionario.setIdFuncionario(Integer.parseInt(request.getParameter("codigoFuncionario")));
    objFuncionario.setNome(request.getParameter("nomeFuncionario"));
    objFuncionario.setSalario(Double.parseDouble(request.getParameter("salarioFuncionario")));
    objFuncionario.setCpf(request.getParameter("cpfFuncionario"));
    objFuncionario.getCidade().setCodigo(Integer.parseInt(request.getParameter("codigoCidade")));
    objFuncionario.setNascimento(converte.converteCalendario(request.getParameter("nascimentoFuncionario")));
    objFuncionario.getCargo().setIdCargo(Integer.parseInt(request.getParameter("codigoCargo")));
    DAOFuncionario daoFuncionario = new DAOFuncionario();
    String mensagem = "";
    
    if(opcao.equals("cadastrar")){
    mensagem = daoFuncionario.inserir(objFuncionario);
    response.sendRedirect("CadastroFuncionario.jsp?mensagem="+mensagem);
    }if(opcao.equals("alterar")){
    mensagem = daoFuncionario.alterar(objFuncionario);
    response.sendRedirect("CadastroFuncionario.jsp?mensagem="+mensagem);
    }if(opcao.equals("excluir")){
    mensagem = daoFuncionario.remover(objFuncionario);
    response.sendRedirect("CadastroFuncionario.jsp?mensagem="+mensagem);
    }
    
%>