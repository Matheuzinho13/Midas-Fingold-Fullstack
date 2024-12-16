<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>

    <%@include file="links_header.jsp"%>

    <!-- link css perfil -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylePerfil.css">

    <!-- link css header e footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">

</head>
<body>
<%@include file="header.jsp"%>

<section class="container boas-vindas">
    <div class="boas-vindas-textos">
        <h1>Olá, ${usuario.nomeCompleto}!</h1>
        <p>Seja bem-vindo ao seu perfil pessoal.</p>
    </div>
    <div class="boas-vindas-imagem">
        <img src="${pageContext.request.contextPath}/resources/Imagens/Vetores/perfil-usuario.svg" class="img-fluid">
    </div>
</section>

<div class="container">
    <h3 class="h3-info-cadastro">Informações de cadastro</h3>
</div>
<section class="container info-cadastro">
    <div class="informacoes">
        <!-- nome completo -->
        <div class="mb-3">
            <label for="nomeCompleto" class="form-label label-nome-completo">Nome completo</label>
            <input type="text" class="form-control placeholder-nome-completo" id="nomeCompleto" placeholder="Ex: Ana Silva" disabled>
        </div>
        <!-- email -->
        <div class="mb-3">
            <label for="emailCadastro" class="form-label label-email">Email</label>
            <input type="email" class="form-control placeholder-email" id="emailCadastro" placeholder="Ex: anasilva04@gmail.com" disabled>
        </div>
    </div>
    <div class="informacoes">
        <div class="mb-3">
            <!-- data de nascimento -->
            <label for="data-nasc-cadastro" class="form-label label-data-nasc">Data de nascimento</label>
            <input type="date" class="form-control data-nasc" id="data-nasc-cadastro" disabled>
        </div>
        <!-- senha -->
        <label for="senhaCadastro" class="form-label label-senha">Senha</label>
        <input type="password" id="senhaCadastro" class="form-control senha" aria-describedby="passwordHelpBlock" disabled>
    </div>
    <div class="informacoes">
        <select class="form-select genero" aria-label="Default select example" id="generoCadastro" disabled>
            <option selected disabled>Gênero</option>
            <option value="M">Masculino</option>
            <option value="F">Feminino</option>
        </select>
        <!-- modal -->
        <button type="button" class="btn botao-editar-informacoes" data-bs-toggle="modal" data-bs-target="#exampleModal">Editar informações <i class="fa-regular fa-pen-to-square icon-editar-informacoes"></i></button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">Editar informações de cadastro</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <form id="modalForm" action="${pageContext.request.contextPath}/perfil" method="post">
                            <input type="hidden" name="codigoUsuario" value="${codigoUsuario}">
                            <div class="mb-3">
                                <label for="nomeCompletoModal" class="form-label label-nome-completo">Nome completo</label>
                                <input type="text" class="form-control placeholder-nome-completo" id="nomeCompletoModal" name="nomeCompleto" value="${nomeCompleto}" required>
                            </div>
                            <div class="mb-3">
                                <label for="emailModal" class="form-label label-email">Email</label>
                                <input type="email" class="form-control placeholder-email" id="emailModal" name="email" value="${email}" required>
                            </div>
                            <div class="mb-3">
                                <label for="data-nasc-modal" class="form-label label-data-nasc">Data de nascimento</label>
                                <input type="date" class="form-control data-nasc" id="data-nasc-modal" name="dataNascimento" value="${dataNascimento}" required>
                            </div>
                            <div class="mb-3">
                                <label for="senhaModal" class="form-label label-senha">Senha</label>
                                <input type="password" id="senhaModal" class="form-control senha" name="senha" aria-describedby="passwordHelpBlock">
                            </div>
                            <label for="generoModal" class="form-label label-genero">Gênero</label>
                            <select class="form-select genero" aria-label="Default select example" id="generoModal" name="genero" required>
                                <option value="M" ${genero == 'M' ? 'selected' : ''}>Masculino</option>
                                <option value="F" ${genero == 'F' ? 'selected' : ''}>Feminino</option>
                            </select>
                            <button type="submit" class="btn btn-primary botao-modal">Salvar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>


<%@include file="links_footer.jsp"%>

</body>
</html>