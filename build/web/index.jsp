
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Rede Nacional de Aeroportos</title>
    <meta name='viewport' content='width=Bootstree, initial-scale=1'>
    <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Anton&display=swap');
    </style>
</head>
<body class="background">  
    <nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="#">
      <img src="imagens/Logo.png" width="150">
    </a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="desenvolvedores.jsp" target="_blank">Quem somos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="servicos.jsp" target="_blank">Serviços</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Login.jsp">Login</a>
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
      <div class="txtbemvindo"><% if (session.getAttribute("nome") != null) {%>
            Bem Vindo, <%= session.getAttribute("nome")%></div>
</div>
  </nav>
    
    <nav class="navmenu">    
        <ul class="menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Cadastro</a>
                    <ul>
                        <li><a href="CadastroAeroporto.jsp" target="_blank">Aeroporto</a></li>
                        <li><a href="CadastroAviao.jsp" target="_blank">Avião</a></li>
                        <li><a href="CadastroCargo.jsp" target="_blank">Cargo</a></li>
                        <li><a href="CadastroCidade.jsp" target="_blank">Cidade</a></li>
                        <li><a href="CadastroClasse.jsp" target="_blank">Classe</a></li>
                        <li><a href="CadastroFuncionario.jsp" target="_blank">Funcionário</a></li>
                        <li><a href="CadastroPassageiro.jsp" target="_blank">Passageiro</a></li>
                        <li><a href="CadastroRota.jsp" target="_blank">Rota</a></li>
                        <li><a href="CadastroViagem.jsp" target="_blank">Viagem</a></li>
                    </ul>
                </li>
                <li><a href="#">Relatórios</a> 
                    <ul class="zindex-li">
                        <li><a href="RelatorioAeroporto.jsp" target="_blank">Aeroporto</a></li>
                        <li><a href="RelatorioAviao.jsp" target="_blank">Avião</a></li>
                        <li><a href="RelatorioCargo.jsp" target="_blank">Cargo</a></li>
                        <li><a href="RelatorioCidade.jsp" target="_blank">Cidade</a></li>
                        <li><a href="RelatorioClasse.jsp" target="_blank">Classe</a></li>
                        <li><a href="RelatorioFuncionario.jsp" target="_blank">Funcionário</a></li>
                        <li><a href="RelatorioPassageiro.jsp" target="_blank">Passageiro</a></li>
                        <li><a href="RelatorioRota.jsp" target="_blank">Rota</a></li>
                        <li><a href="RelatorioViagem.jsp" target="_blank">Viagem</a></li>
                        <li><a href="RelatorioPassageiroViagem.jsp" target="_blank">Passageiro Viagem</a></li>
                    </ul>
                </li>
                <li><a href="Contato.jsp">Contato</a></li>                
                <li><a href="Sobre.jsp">Sobre</a></li>   
            </ul>
        <ul class="listlogoff">
            <div class="btnlogoff"><a href="Logoff.jsp" class="btnlogoff"><img src="imagens/logoff.png" alt="logoff">logoff</a></div>
            <% }%>
        </ul>
    </nav>
        <div class="CardSlide">
            <div class="slideGeral">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
<div class="carousel-frase slideAviao"> 
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="imagens/Imagem 1.png" class="d-block w-100" alt="conforto">
      <div class="carousel-caption d-none d-md-block">
        <p class="texto-inicio">Viagens tranquilas e confortáveis.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="imagens/Imagem 2.png" class="d-block w-100" alt="segurança">
      <div class="carousel-caption d-none d-md-block">
        <p class="texto-inicio">Desfrute de viagens seguras sem medo.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="imagens/Imagem 3.png" class="d-block w-100" alt="economizando">
      <div class="carousel-caption d-none d-md-block">
        <p class="texto-inicio">Viagens com um ótimo custo benefício.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>

</div>
</div> 
            </div>

</div>
</body>
</html>