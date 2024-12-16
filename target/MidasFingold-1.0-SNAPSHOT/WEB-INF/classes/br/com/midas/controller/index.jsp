<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@include file="../../../../../webapp/resources/pages/links_header.jsp"%>
  <!-- css da tela -->
  <link rel="stylesheet" href="../../../../../webapp/resources/css/style.css">
  <link rel="shortcut icon" type="imagex/png" href="../../../../../webapp/resources/Imagens/Logo/Miniatura.png">
  <title>Landing Page</title>
</head>

<body>
<!-- Header -->
<header>
  <nav class="cabeçalho">
    <div class="logo">
      <img src="../../../../../webapp/resources/Imagens/Logo/FinGold%20branco%20sem%20fundo%201%20(1).png">
    </div>
    <nav class="nav-list">
      <a href="../../../../../webapp/resources/pages/Cadastro_Usuario.jsp">
        <button class="cadastre text-nowrap">Se Cadastre</button>
      </a>
    </nav>
  </nav>
</header>
<!-- Fim Header -->

<!-- primeiro container -->
<div class="container mt-5 text-center">
  <div class="row text-center">
    <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-3 px-3">
      <!-- imagem principal -->
      <div class="imagemprincipal">
        <img src="../../../../../webapp/resources/Imagens/Vetores/imagem%20principal.png" class="img-fluid">
      </div>
    </div>
    <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5 text-center">

      <!-- conteúdo da direita - título, subtítulo e botões-->
      <section class="conteudodireito mt-5">
        <article class="textoprincipal mt-5">
          <h1>
            Dê um toque de <font color="#B78E10">ouro</font>
            nas suas  <font color="#B78E10">finanças</font>
          </h1>
        </article>

        <article class="subtitulo">
          Acesse nossa fintech e <br>
          gerencie seu capital de <br>
          maneira rápida e dinâmica.
        </article>

        <div class="botoes">
          <a href="../../../../../webapp/resources/pages/Cadastro_Usuario.jsp">
            <button class="botao text-nowrap">Se cadastre</button>
          </a>
          <a href="../../../../../webapp/resources/pages/Login.jsp">
            <button class="botao2">Entre</button>
          </a>
        </div>
      </section>
    </div>

  </div>
</div>
<!-- fim primeiro container -->

<!-- começo segundo container - explicação sobre o nome -->
<div class="container-fluid midas">
  <div class="row">
    <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-4 lista">
      <!-- lista de explicação -->
      <ul>
        <li>Management, income, dynamic and services.
          Gestão, renda, dinâmica e serviços, itens essenciais no nosso produto.</li>

        <li>Além do significado da sigla, o rei Midas, da mitologia grega, era um personagem que tudo que
          tocasse viraria ouro,
          trazendo a riqueza e o valor ao nosso web site.</li>
      </ul>
    </div>

    <!-- Imagem Midas -->
    <div class="col-12 col-sm-12 col-md-12 col-lg-6 imagemMidas">
      <img src="../../../../../webapp/resources/Imagens/Vetores/Vetor%20Midas.png" class="img-fluid">

    </div>

  </div>
</div>
<!-- fim segundo container - explicação sobre o nome -->

<!-- começo terceiro container - funcionalidades -->
<div class="container-fluid celular">
  <div class="row text-center">
    <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5">
      <!-- vetor do celular -->
      <img src="../../../../../webapp/resources/Imagens/Vetores/Vetor%20do%20celular.png" class="img-fluid">

    </div>

    <div class="col-12 col-sm-12 col-md-12 col-lg-6 mt-5 lista2">
      <!-- lista de funcionalidades -->
      <ul>
        <li class="renda">Após o cadastro, você pode controlar seus ganhos, gastos e dívidas de maneira
          fácil e eficaz.</li>

        <li class="metas">Foque nos seus objetivos, visualize e marque como conquistados quando alcançá-los.
        </li>

        <li class="analises">Com a aba calendário, você pode visualizar o nível de satisfação diário,
          comparando ganhos e gastos.</li>

        <li class="investimentos">Controle seus investimentos e receba indicações de acordo com seu perfil
          de investidor.</li>
      </ul>
    </div>
  </div>
</div>
<!-- fim terceiro container - funcionalidades -->

<!-- começo footer -->
<div class="container-fluid mt-5 footer">
  <footer class="row text-center">
    <div class="container-fluid p-4 pb-0">
      <p class="d-flex justify-content-center align-items-center">
        <span class="me-3">Acesse o site:</span>
        <a href='../../../../../webapp/resources/pages/Dividas.jsp'>
          <button type="button" class="btn btn-rounded">
            Se cadastre!
          </button>
        </a>
      </p>
    </div>
    <div class="container-fluid py-3 final">
      © Midas Fingold 2024
    </div>
  </footer>
</div>
<!-- fim footer -->

<%@include file="../../../../../webapp/resources/pages/links_footer.jsp"%>
</body>

</html>