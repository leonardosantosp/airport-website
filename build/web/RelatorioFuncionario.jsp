<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JRResultSetDataSource"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.Relatorio"%>
<%
    Relatorio rel = new Relatorio();
    ResultSet rs = rel.relatorioFuncionario();
                  if (rs.next()){
                      rs.beforeFirst();
    String caminho = "C:/Users/Asus/Desktop/TrabTuio/ProjetoAeroporto/web/Relatorios/RelatorioFuncionario.jasper";
                  
    Map parameters = new HashMap();
    JRResultSetDataSource jrRS = new JRResultSetDataSource(rs);
    JasperPrint impressao = JasperFillManager.fillReport(caminho, parameters,jrRS);


byte[] bytes = JasperExportManager.exportReportToPdf(impressao);
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream ouputStream = response.getOutputStream();
ouputStream.write(bytes, 0, bytes.length);
ouputStream.flush();
ouputStream.close();

}
  else{
    %>

<jsp:forward page="Mensagem.jsp">
    <jsp:param name="mensagem" value="N�o h� Funcion�rio cadastrado, para cadastrar um Funcion�rio clique no menu CADASTRO > Funcionario." />
</jsp:forward>


<%
    }

%>