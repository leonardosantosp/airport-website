package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset='utf-8'>\n");
      out.write("    <meta http-equiv='X-UA-Compatible' content='IE=edge'>\n");
      out.write("    <title>Rede Nacional de Aeroportos</title>\n");
      out.write("    <meta name='viewport' content='width=Bootstree, initial-scale=1'>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\"  href=\"conf/estilo.css\" />\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n");
      out.write("    <style>\n");
      out.write("      @import url('https://fonts.googleapis.com/css2?family=Anton&display=swap');\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body class=\"background\">  \n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-light\">\n");
      out.write("    <a class=\"navbar-brand\" href=\"#\">\n");
      out.write("      <img src=\"imagens/Logo.png\" width=\"150\">\n");
      out.write("    </a>\n");
      out.write("    <div class=\"collapse navbar-collapse\">\n");
      out.write("      <ul class=\"navbar-nav\">\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("          <a class=\"nav-link\" href=\"desenvolvedores.jsp\" target=\"_blank\">Quem somos</a>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("          <a class=\"nav-link\" href=\"servicos.jsp\" target=\"_blank\">Serviços</a>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"nav-link\" href=\"Login.jsp\">Login</a>\n");
      out.write("        </li>\n");
      out.write("      </ul>\n");
      out.write("      <div class=\"button-search\">\n");
      out.write("      <form class=\"d-flex\">\n");
      out.write("        <input class=\"form-control me-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("          <button class=\"btn btn-outline-primary\" type=\"submit\">Search</button>\n");
      out.write("        </div>\n");
      out.write("      </form>\n");
      out.write("        </div>\n");
      out.write("      </form>\n");
      out.write("      <div class=\"txtbemvindo\">");
 if (session.getAttribute("nome") != null) {
      out.write("\n");
      out.write("            Bem Vindo, ");
      out.print( session.getAttribute("nome"));
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("  </nav>\n");
      out.write("    \n");
      out.write("    <nav class=\"navmenu\">    \n");
      out.write("        <ul class=\"menu\">\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                <li><a href=\"#\">Cadastro</a>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"CadastroAeroporto.jsp\" target=\"_blank\">Aeroporto</a></li>\n");
      out.write("                        <li><a href=\"CadastroAviao.jsp\" target=\"_blank\">Avião</a></li>\n");
      out.write("                        <li><a href=\"CadastroCargo.jsp\" target=\"_blank\">Cargo</a></li>\n");
      out.write("                        <li><a href=\"CadastroCidade.jsp\" target=\"_blank\">Cidade</a></li>\n");
      out.write("                        <li><a href=\"CadastroClasse.jsp\" target=\"_blank\">Classe</a></li>\n");
      out.write("                        <li><a href=\"CadastroFuncionario.jsp\" target=\"_blank\">Funcionário</a></li>\n");
      out.write("                        <li><a href=\"CadastroPassageiro.jsp\" target=\"_blank\">Passageiro</a></li>\n");
      out.write("                        <li><a href=\"CadastroRota.jsp\" target=\"_blank\">Rota</a></li>\n");
      out.write("                        <li><a href=\"CadastroViagem.jsp\" target=\"_blank\">Viagem</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"#\">Relatórios</a> \n");
      out.write("                    <ul class=\"zindex-li\">\n");
      out.write("                        <li><a href=\"RelatorioAeroporto.jsp\" target=\"_blank\">Aeroporto</a></li>\n");
      out.write("                        <li><a href=\"RelatorioAviao.jsp\" target=\"_blank\">Avião</a></li>\n");
      out.write("                        <li><a href=\"RelatorioCargo.jsp\" target=\"_blank\">Cargo</a></li>\n");
      out.write("                        <li><a href=\"RelatorioCidade.jsp\" target=\"_blank\">Cidade</a></li>\n");
      out.write("                        <li><a href=\"RelatorioClasse.jsp\" target=\"_blank\">Classe</a></li>\n");
      out.write("                        <li><a href=\"RelatorioFuncionario.jsp\" target=\"_blank\">Funcionário</a></li>\n");
      out.write("                        <li><a href=\"RelatorioPassageiro.jsp\" target=\"_blank\">Passageiro</a></li>\n");
      out.write("                        <li><a href=\"RelatorioRota.jsp\" target=\"_blank\">Rota</a></li>\n");
      out.write("                        <li><a href=\"RelatorioViagem.jsp\" target=\"_blank\">Viagem</a></li>\n");
      out.write("                        <li><a href=\"RelatorioPassageiroViagem.jsp\" target=\"_blank\">Passageiro Viagem</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"Contato.jsp\">Contato</a></li>                \n");
      out.write("                <li><a href=\"Sobre.jsp\">Sobre</a></li>   \n");
      out.write("            </ul>\n");
      out.write("        <ul class=\"listlogoff\">\n");
      out.write("            <div class=\"btnlogoff\"><a href=\"Logoff.jsp\" class=\"btnlogoff\"><img src=\"imagens/logoff.png\" alt=\"logoff\">logoff</a></div>\n");
      out.write("            ");
 }
      out.write("\n");
      out.write("        </ul>\n");
      out.write("    </nav>\n");
      out.write("        <div class=\"CardSlide\">\n");
      out.write("            <div class=\"slideGeral\">\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\" crossorigin=\"anonymous\">\n");
      out.write("    </script>\n");
      out.write("<div class=\"carousel-frase slideAviao\"> \n");
      out.write("<div id=\"carouselExampleCaptions\" class=\"carousel slide\" data-bs-ride=\"carousel\">\n");
      out.write("  <div class=\"carousel-indicators\">\n");
      out.write("    <button type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>\n");
      out.write("    <button type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide-to=\"1\" aria-label=\"Slide 2\"></button>\n");
      out.write("    <button type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide-to=\"2\" aria-label=\"Slide 3\"></button>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"carousel-inner\">\n");
      out.write("    <div class=\"carousel-item active\">\n");
      out.write("      <img src=\"imagens/Imagem 1.png\" class=\"d-block w-100\" alt=\"conforto\">\n");
      out.write("      <div class=\"carousel-caption d-none d-md-block\">\n");
      out.write("        <p class=\"texto-inicio\">Viagens tranquilas e confortáveis.</p>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item\">\n");
      out.write("      <img src=\"imagens/Imagem 2.png\" class=\"d-block w-100\" alt=\"segurança\">\n");
      out.write("      <div class=\"carousel-caption d-none d-md-block\">\n");
      out.write("        <p class=\"texto-inicio\">Desfrute de viagens seguras sem medo.</p>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item\">\n");
      out.write("      <img src=\"imagens/Imagem 3.png\" class=\"d-block w-100\" alt=\"economizando\">\n");
      out.write("      <div class=\"carousel-caption d-none d-md-block\">\n");
      out.write("        <p class=\"texto-inicio\">Viagens com um ótimo custo benefício.</p>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide=\"prev\">\n");
      out.write("    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n");
      out.write("    <span class=\"visually-hidden\">Previous</span>\n");
      out.write("  </button>\n");
      out.write("  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide=\"next\">\n");
      out.write("    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n");
      out.write("    <span class=\"visually-hidden\">Next</span>\n");
      out.write("  </button>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</div> \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
