<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <%@include file="links_header.jsp"%>

  <!-- link css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleLogin.css">

  <title>Login Midas Fingold</title>
</head>

<body>
<div class="vh-100 d-flex justify-content-center align-items-center flex-column" id="basebox">
  <div class="col-sm-8 col-md-6 col-lg-4 rounded p-4 shadow" id="loginbox">
    <div class="row" id="linhalogos">
      <div class="col form-floating d-flex justify-content-center align-items-center flex-column">
        <img src="${pageContext.request.contextPath}/resources/Imagens/Logo/FinGold branco sem fundo 1 (1).png" class="rounded float-start" id="logofingold" alt="Logo Fingold">
      </div>
      <div class="col form-floating d-flex justify-content-center align-items-center flex-column">
        <img src="${pageContext.request.contextPath}/resources/Imagens/Logo/Miniatura.png" class="rounded float-end" id="miniaturafingold"alt="Miniatura Fingold" width="40%">
      </div>
    </div>
    <h1 id="LoginFingold">Login Midas</h1>
    <c:if test="${empty user }">
    <span class="navbar-text text-danger" style="margin-right:10px">
        ${erro }
    </span>
      <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-4 ms-4 me-5">
          <label class="form-label">E-mail</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="nome@email.com">
        </div>
        <div class="mb-2 ms-4 me-5">
          <label class="form-label">Senha</label>
          <input type="password" class="form-control" id="senha" name="senha" placeholder="********">
        </div>
        <div class="mb-3 form-floating d-flex justify-content-center align-items-center flex-column">
          <button class="btn btn-secondary btn-lg w-50 btn-danger me-md-2" id="linkentrar" type="submit">Entrar</button>
        </div>
        <div class="mb-4 form-floating d-flex justify-content-center align-items-center flex-column">
          <p>Ainda não possui acesso?</p>
          <a href="${pageContext.request.contextPath}/resources/pages/Cadastro_Usuario.jsp" id="cadastrese">Cadastre-se</a>
        </div>
      </form>
    </c:if>
  </div>
</div>
<%@include file="links_footer.jsp"%>
</body>

</html>