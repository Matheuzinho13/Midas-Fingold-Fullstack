
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="links_header.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleCadastro_Usuario.css">
    <title>Informações de Cadastro</title>
</head>

<body>
<div class="vh-100 d-flex justify-content-center align-items-center flex-column" id="basebox">
    <div class="d-flex justify-content-center align-items-center row">
        <div class="col-sm-8 col-md-6 col-lg-4 p-4 mt-auto shadow rounded" id="cadastrobox">
            <form action="${pageContext.request.contextPath}/usuarios?acao=cadastrar" id="formcadastro" method="post">
                <h1 id="infocadastro">Informações de Cadastro</h1>
                <div class="mb-4">
                    <label class="form-label"> Nome completo*</label>
                    <input type="text" class="form-control" id="nomecompleto" name="nomeCompleto" placeholder="" required>
                </div>
                <div class="mb-4">
                    <label class="form-label">Data de nascimento*</label>
                    <input type="date" class="form-control" id="dtnasc" name="dataNascimento" placeholder="" required>
                </div>
                <div class="mb-4">
                    <label for="genero" class="form-label">Gênero</label>
                    <select class="form-select" id="genero" name="genero" required>
                        <option selected disabled>Selecione seu gênero</option>
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                        <option value="O">Outro</option>
                        <option value="N">Prefiro não informar</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label class="form-label">E-mail*</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="nome@email.com" required>
                </div>
                <div class="mb-4">
                    <label class="form-label">Senha (+ de 6 caracteres)*</label>
                    <input type="password" class="form-control" id="senha" name="senha" placeholder="********" required>
                </div>
                <div class="mb-4">
                    <label class="form-label">Repita a senha*</label>
                    <input type="password" class="form-control" id="senha2" name="senha2" placeholder="********" required>
                </div>
                <div class="form-floating d-flex justify-content-center align-items-center flex-column">
                    <button type="submit" class="btn btn-secondary btn-lg w-50 btn-danger mt-4 mb-4" id="linkcontinuar">Continuar</button>
                </div>
            </form>
        </div>
        <div class="col-sm-8 col-md-6 col-lg-3 p-4 mt-auto" id="logobox">
            <div class="row d-flex align-items-bottom" id="linhalogos">
                <div class="col form-floating d-flex justify-content-center align-items-center flex-column">
                    <img src="${pageContext.request.contextPath}/resources/Imagens/Logo/FinGold branco sem fundo 1 (1).png" class="rounded float-start" id="logofingold" alt="Logo Fingold">
                </div>
                <div class="col form-floating d-flex justify-content-center align-items-center flex-column">
                    <img src="${pageContext.request.contextPath}/resources/Imagens/Logo/Miniatura.png" class="rounded float-end" id="miniaturafingold" alt="Miniatura Fingold" width="40%">
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="links_footer.jsp"%>
</body>
</html>
