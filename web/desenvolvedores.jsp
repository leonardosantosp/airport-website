
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sobre o Software</title>
  <meta name='viewport' content='width=Bootstree, initial-scale=1'>
    <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
  <body class="background">  
    <nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="#">
      <img src="imagens/Logo.png" width="150">
    </a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="desenvolvedores.jsp">Quem somos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="servicos.jsp">Serviços</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Login</a>
        </li>
      </ul>
      <div class="button-search">
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-primary" type="submit">Search</button>
        </div>
      </form>
        </div>
      </form>
    </div>
  </nav>
    
    <nav class="navigationAbout">
            <ul class="menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Cadastro</a>
                    <ul>
                        <li><a href="CadastroAeroporto.jsp">Aeroporto</a></li>
                        <li><a href="CadastroAviao.jsp">Avião</a></li>
                        <li><a href="CadastroCargo.jsp">Cargo</a></li>
                        <li><a href="CadastroCidade.jsp">Cidade</a></li>
                        <li><a href="CadastroClasse.jsp">Classe</a></li>
                        <li><a href="CadastroFuncionario.jsp">Funcionário</a></li>
                        <li><a href="CadastroPassageiro.jsp">Passageiro</a></li>
                        <li><a href="CadastroRota.jsp">Rota</a></li>
                        <li><a href="CadastroViagem.jsp">Viagem</a></li>
                    </ul>
                </li>
                <li><a href="#">Relatórios</a> 
                    <ul>
                        <li><a href="RelatorioAeroporto.jsp">Aeroporto</a></li>
                        <li><a href="RelatorioAviao.jsp">Avião</a></li>
                        <li><a href="RelatorioCargo.jsp">Cargo</a></li>
                        <li><a href="RelatorioCidade.jsp">Cidade</a></li>
                        <li><a href="RelatorioClasse.jsp">Classe</a></li>
                        <li><a href="RelatorioFuncionario.jsp">Funcionário</a></li>
                        <li><a href="RelatorioPassageiro.jsp">Passageiro</a></li>
                        <li><a href="RelatorioRota.jsp">Rota</a></li>
                        <li><a href="RelatorioViagem.jsp">Viagem</a></li>
                    </ul>
                </li>
                <li><a href="contato.jsp">Contato</a></li>                
                <li><a href="sobre.jsp">Sobre</a></li>   
            </ul>
        </nav>
      <div class="txtQuemSomos">
          <div class="titleDesenvolvedores">
            <h1>Sobre os desenvolvedores:</h1>
          </div>
          <div class="conteudoQuemSomos">
              <div class="imgConteudo">
                  <img src="imagens/leo.png" alt="logoff">
                <h2>Software e estilização desenvolvido por Leonardo dos Santos Paiva.</h2>
              </div>
              <div class="imgConteudo imgpedro">
                <img src="imagens/pedro.png" alt="logoff">
                <h2>Design e imagens desenvolvidas por Pedro Ferreira Franco</h2>
              </div>
              <div class="imgConteudo">
                <img src="imagens/erick.png" alt="logoff">
                <h2>Design e estilização do software desenvolvido por Erick de Bem Campos</h2>
              </div>
          </div>
      </div>
  </body>
</html>
