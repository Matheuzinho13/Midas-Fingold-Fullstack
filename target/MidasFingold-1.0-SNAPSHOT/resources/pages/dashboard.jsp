<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <%@include file="links_header.jsp"%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleDashboard.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
</head>
<body>
<%@include file="header.jsp"%>

<c:if test="${not empty erro}">
  <div class="alert alert-danger" role="alert">
      ${erro}
  </div>
</c:if>

<c:if test="${empty nomeUsuario || empty totalGanhos || empty totalGastos || empty totalInvestido}">
  <div class="alert alert-warning" role="alert">
    Algum dado está ausente no dashboard. Verifique o servlet para garantir que todos os valores estão sendo carregados.
  </div>
</c:if>

<section class="container topo-dash">
  <div class="topo-esquerda">
    <div class="topo-esquerda-textos">
      <h1 class="topo-h1">Seja bem-vindo,<br> ${nomeUsuario}!</h1>
      <p class="topo-p">Dê um toque de ouro nas suas finanças<br> e conquiste o sucesso que sempre sonhou!</p>
    </div>
    <div class="topo-esquerda-imagem">
      <img src="${pageContext.request.contextPath}/resources/Imagens/Vetores/Vetor Midas.png" class="img">
    </div>
  </div>
  <div class="topo-direita">
    <div class="topo-direita-botao">
      <h3 class="h3-topo-direita">Comparação</h3>
    </div>
    <div class="topo-direita-grafico">
      <img src="${pageContext.request.contextPath}/resources/Imagens/Gráficos/ganhos-gastos.svg" class="img-fluid imagem-topo-direita">
      <h4>
        Saldo Atual
        <br>
        <span>R$ ${saldoAtual}</span>
      </h4>
    </div>
  </div>
</section>

<section class="container graficos-meio">
  <div class="grafico1-meio">
    <div class="graficos-meio-botao">
      <h3 class="h3-graficos-meio">Análise: <span>ganhos</span></h3>
      <a href="${pageContext.request.contextPath}/ganhos" class="text-decoration-none">
        <button class="botao-graficos-meio">Acesse</button>
      </a>
    </div>
    <div class="meio-grafico">
      <img src="${pageContext.request.contextPath}/resources/Imagens/Gráficos/analise-de-ganhos.svg" class="img-fluid">
      <h4>
        Total de Ganhos
        <br>
        R$ ${totalGanhos}
      </h4>
    </div>
  </div>

  <div class="grafico2-meio">
    <div class="graficos-meio-botao">
      <h3 class="h3-graficos-meio">Análise: <span>gastos</span></h3>
      <a href="${pageContext.request.contextPath}/gastos" class="text-decoration-none">
        <button class="botao-graficos-meio">Acesse</button>
      </a>
    </div>
    <div class="meio-grafico">
      <img src="${pageContext.request.contextPath}/resources/Imagens/Gráficos/analise-de-gastos.svg" class="img-fluid">
      <h4>
        Total de Gastos
        <br>
        R$ ${totalGastos}
      </h4>
    </div>
  </div>

  <div class="grafico3-meio">
    <div class="graficos-meio-botao">
      <h3 class="h3-graficos-meio">Último <span>gasto</span></h3>
      <a href="${pageContext.request.contextPath}/gastos" class="text-decoration-none">
        <button class="botao-graficos-meio">Acesse</button>
      </a>
    </div>
    <div class="meio-grafico-ultimo-gasto">
      <h5>R$ ${ultimoGasto.valor}</h5>
      <h5><fmt:formatDate value="${ultimoGasto.data}" pattern="dd/MM/yyyy"/></h5>
      <h5>${ultimoGasto.descricao}</h5>
    </div>
  </div>
</section>

<section class="container graficos-inferior">
  <div class="grafico1-inferior">
    <div class="graficos-inferior-botao">
      <h3 class="h3-graficos-inferior">Objetivos</h3>
      <a href="${pageContext.request.contextPath}/objetivos" class="text-decoration-none">
        <button class="botao-graficos-meio">Acesse</button>
      </a>      </div>
    <div class="inferior-grafico-objetivos">
      <div class="progress" role="progressbar" aria-label="Example 50px high" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="height: 40px">
        <div class="progress-bar" id="progressBarObjetivos"></div> <!-- Adicione um ID -->
      </div>
      <h4 id="progressTextObjetivos">50% dos objetivos concluídos</h4> <!-- Adicione um ID -->
    </div>
  </div>

  <div class="grafico2-inferior">
    <div class="graficos-inferior-botao">
      <h3 class="h3-graficos-inferior">Investimentos</h3>
      <a href="${pageContext.request.contextPath}/investimentos" class="text-decoration-none">
        <button class="botao-graficos-meio">Acesse</button>
      </a>
    </div>
    <div>
      <div class="inferior-grafico-investimentos">
        <c:forEach var="tipoInvestimento" items="${investimentosPorTipo}">
          <h3>${tipoInvestimento.key} = R$ ${tipoInvestimento.value}</h3>
        </c:forEach>
      </div>
      <h4 class="valor-investido">Valor investido = R$ ${totalInvestido}</h4>
    </div>
  </div>

  <div class="grafico3-inferior">
    <div class="graficos-inferior-botao">
      <h3 class="h3-graficos-inferior">Dívidas</h3>
      <a href="${pageContext.request.contextPath}/dividas" class="text-decoration-none">
        <button class="botao-graficos-meio">Acesse</button>
      </a>
    </div>
    <div class="inferior-grafico-dividas">
      <c:forEach var="divida" items="${detalhesDividas}">
        <h3><fmt:formatDate value="${divida.dt_pagamento}" pattern="dd/MM/yyyy"/> - R$${divida.vl_divida}</h3>
      </c:forEach>
    </div>
    <h4 class="valor-total-dividas">Valor total das dívidas = R$ ${totalDividas}</h4>
  </div>
</section>

<%@include file="footer.jsp"%>
<%@include file="links_footer.jsp"%>
<script>
  // Obter a porcentagem de objetivos concluídos do JSP
  var porcentagemObjetivos = parseInt("${porcentagemObjetivosConcluidos}");

  // Atualizar a barra de progresso
  document.getElementById('progressBarObjetivos').style.width = porcentagemObjetivos + '%';

  // Atualizar o texto da porcentagem
  document.getElementById('progressTextObjetivos').textContent = porcentagemObjetivos + '% dos objetivos concluídos';
</script>
</body>
</html>