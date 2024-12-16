<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- começo footer -->
<footer class="footer">
  <div class="container-fluid container_footer ">
    <div class="row ">
      <!-- primeira coluna - logo e redes sociais  -->
      <div class="col-12 col-sm-6 col-md-6 col-lg-3 primeira_col order-1">
        <img src="${pageContext.request.contextPath}/resources/Imagens/Logo/Miniatura.png" widht="20" height="90">

        <div class="redes_sociais">
          <a href="#" class="footer-link" id="instagram">
            <i class="fa-brands fa-instagram"></i>
          </a>
          <a href="#" class="footer-link" id="whatsapp">
            <i class="fa-brands fa-whatsapp"></i>
          </a>
        </div>
      </div>
      <!-- fim primeira coluna -->

      <!-- segunda coluna - lista 1 -->
      <div class="col-12 col-sm-6 col-md-6 col-lg-3 order-2">
        <ul class="footer-lista">
          <li>
            <h3>Início</h3>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/dashboard" class="footer-link">Home</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/perfil" class="footer-link">Perfil</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/calendario" class="footer-link">Calendário</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/objetivos" class="footer-link">Objetivos</a>
          </li>
        </ul>
      </div>
      <!-- fim segunda coluna - lista 1 -->

      <!-- terceira coluna - lista 2 -->
      <div class="col-12 col-sm-6 col-md-6 col-lg-3 order-3">
        <ul class="footer-lista">
          <li>
            <h3>Finanças</h3>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/ganhos" class="footer-link">Ganhos</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/gastos" class="footer-link">Gastos</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/investimentos" class="footer-link">Investimentos</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/dividas" class="footer-link">Dívidas</a>
          </li>
        </ul>
      </div>
      <!-- fim terceira coluna - lista 2 -->

      <!-- quarta coluna - se cadastre -->
      <div class="col-12 col-sm-6 col-md-6 col-lg-3 order-4">
        <div class="footer_cadastro">
          <h3>Utilize o MIDAS</h3>
          <div class="botao2">
            <a href="${pageContext.request.contextPath}/resources/pages/Cadastro_Usuario.jsp">
              <button>Cadastre-se</button>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- fim quarta coluna - se cadastre -->

  <!-- copyright -->
  <div class="copyright container-fluid">
    &#169
    2024 Midas Fingold
  </div>
  <!-- fim copyright -->
</footer>
<!-- fim footer -->