    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ganhos</title>
        <%@include file="links_header.jsp"%>

        <!-- css da tela -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleGanhos.css">

        <!-- css do header e do footer -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
    </head>

    <body>
    <%@include file="header.jsp"%>

    <!-- começo conteúdo -->
    <!-- primeiro container -->
    <div class="container mt-5 text-center">
        <div class="row text-center">
            <div class="col-12 col-lg-6 order-2  mt-3">
                <!-- imagem principal dos ganhos -->
                <div class="imagemprincipal mt-5">
                    <img src="${pageContext.request.contextPath}/resources/Imagens/Vetores/Imagem ganhos.png" class="img-fluid">
                </div>
            </div>
            <div class="col-12 col-lg-6 order-1 mt-5">
                <!-- conteúdo da direita - título e subtítulo -->
                <section class="conteudodireito mt-5 mx-3">
                    <article class="textoprincipal">
                        <h1>
                            Registre seus <br>
                            <h1 class="digitando">Ganhos</h1>
                        </h1>
                    </article>

                    <article class="subtitulo mt-3">
                        Registre seus ganhos financeiros e
                        mantenha um controle preciso de
                        suas entradas de dinheiro.
                    </article>
                </section>
            </div>

        </div>
    </div>
    <!-- fim primeiro container -->

    <!-- botão - adicionar ganho -->
    <button type="button" class="btn adicionar p-1 px-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 84.95">
            <defs>
                <style>
                    .cls-1 {
                        fill-rule: evenodd;
                    }
                </style>
            </defs>
            <title>money-back</title>
            <path class="cls-1"
                  d="M14.36,14.26V69.94H61.08c.05-.14.11-.28.17-.42l.09-.22,3.3-8H32.25c0-5.2-3.75-8.87-8.27-8.83v-22a8.2,8.2,0,0,0,8-8.28H92.88c0,5.21,3.76,8.87,8.3,8.84v6.77c.53-.37,1-.76,1.54-1.15a25.21,25.21,0,0,0,8.09-10.48l-.08-11.92ZM70.18,72.89,82.64,42.77l4.82,10.5c15.24-3,29.39-12.89,33.19-26.36,8,21.25-6.86,39.71-23.59,47.32L102,85,70.18,72.89ZM73.67,36A12.69,12.69,0,1,0,68,53.33l5.72-13.82a9.38,9.38,0,0,1,.83-1.57,11.87,11.87,0,0,0-.83-2ZM0,0V51.87l6.63,0V14.09A6.12,6.12,0,0,1,13.2,7.87H91.31L91.25,0Z" />
        </svg> Adicionar novo ganho
    </button>
    <!-- fim botão - adicionar ganho -->

    <!-- modal - adicionar ganho -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="exampleModalLabel">Carteira de receitas</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="linha-modal"></div>
                <!-- formulário modal -->
                <form action="${pageContext.request.contextPath}/ganhos?acaoGanho=cadastrar" method="post">
                    <div class="modal-body">

                        <div class="form-floating mb-3">

                            <input type="text" class="form-control" id="floatingInput" name="valorGanho" placeholder="R$00,00" required>
                            <label for="floatingInput">Valor</label>
                        </div>
                        <div class="form-floating mb-3">

                            <input type="date" class="form-control" name="dataGanho" id="floatingdata" required>
                            <label for="floatingdata" class="col-form-label">Data</label>
                        </div>
                        <div class="form-floating mb-3">

                                <textarea class="form-control" id="floatingdesc" name="descricaoGanho"
                                          placeholder="motivo do recebimento"></textarea>
                            <label for="floatingdesc" class="col-form-label">Breve descrição</label>
                        </div>

                    </div>

                    <div class="linha-modal"></div>
                    <!-- botões modal -->
                    <div class="modal-footer">
                        <button type="button" class="btn fechar" data-bs-dismiss="modal">Fechar</button>
                        <button type="submit" value="Salvar" class="btn salvar">Salvar ganho</button>
                    </div>
                </form>
                <!-- fim formulário modal -->
            </div>
        </div>
    </div>
    <!-- fim modal - adicionar ganho -->

    <!-- tabela de ganhos -->
    <div class="container">
        <table class="table">
            <!-- colunas -->
            <thead class="text-center">
            <tr>
                <th>
                    <div class="colunas">
                        Data
                    </div>
                </th>
                <th>
                    <div class="colunas">
                        Valor
                    </div>
                </th>
                <th>
                    <div class="colunas">
                        Descrição
                    </div>
                </th>
                <th>
                    <div class="colunas">
                        #
                    </div>
                </th>
            </tr>
            </thead>
            <!-- fim colunas -->

            <!-- conteúdo de exemplo -->
            <tbody class="text-center body">
            <tr>
                <td data-label="Data">dd/mm/aaaa</td>
                <td data-label="Valor">R$00,00</td>
                <td data-label="Descrição">Breve descrição sobre o ganho</td>
                <td data-label="#" class="funções">
                    <button type="button" class="btn editar">
                        <i class="bi bi-pencil-square"></i> Editar
                    </button>
                    <button type="button" class="btn excluir">
                        <i class="bi bi-trash3-fill"></i> Excluir
                    </button>
                </td>
            </tr>

            <c:forEach items="${ganhos}" var="ganho">
                <tr>
                    <td data-label="Data">
                        <fmt:parseDate value="${ganho.dataGanho}" pattern="yyyy-MM-dd" var="dataGanhoFmt"/>
                        <fmt:formatDate value="${dataGanhoFmt}" pattern="dd/MM/yyyy"/>
                    </td>
                    <td data-label="Valor"><fmt:formatNumber value="${ganho.valorGanho}"/></td>
                    <td data-label="Descrição">${ganho.descricaoGanho}</td>
                    <td data-label="#" class="funções">
                        <button type="button" class="btn editar" data-bs-toggle="modal" data-bs-target="#editarModal"
                                onclick="codigoEditarGanho.value = '${ganho.codigoGanho}';
                                        valorGanhoEditar.value = '${ganho.valorGanho}';
                                        dataGanhoEditar.value = '${ganho.dataGanho}';
                                        descricaoGanhoEditar.value = '${ganho.descricaoGanho}';">
                            <i class="bi bi-pencil-square"></i> Editar
                        </button>
                        <button type="button" class="btn excluir" data-bs-toggle="modal"
                                data-bs-target="#excluirModal"
                                onclick="codigoExcluir.value = ${ganho.codigoGanho}">
                            <i class="bi bi-trash3-fill"></i> Excluir
                        </button>

                    </td>
                </tr>
            </c:forEach>

            </tbody>
            <!-- fim conteúdo de exemplo -->
        </table>
    </div>
    <!-- fim tabela de ganhos -->

    <!-- Modal - Editar Ganho -->
    <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="editarModalLabel">Editar Ganho</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="linha-modal"></div>
                <c:choose>
                    <c:when test="${not empty mensagem}">
                        <div class="alert alert-success ms-2 me-2 m-auto mt-2">
                                ${mensagem}
                        </div>
                    </c:when>
                    <c:when test="${not empty erro}">
                        <div class="alert alert-danger ms-2 me-2 m-auto mt-2">
                                ${erro}
                        </div>
                    </c:when>
                </c:choose>
                <form action="${pageContext.request.contextPath}/ganhos?acaoGanho=editar" method="post">
                    <input type="hidden" name="codigoGanho" id="codigoEditarGanho">
                    <div class="modal-body">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="valorGanho" id="valorGanhoEditar" placeholder="R$00,00" required>
                            <label for="valorGanhoEditar">Valor</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" name="dataGanho" id="dataGanhoEditar" required>
                            <label for="dataGanhoEditar" class="col-form-label">Data</label>
                        </div>
                        <div class="form-floating mb-3">
                        <textarea class="form-control" name="descricaoGanho" id="descricaoGanhoEditar"
                                  placeholder="motivo do recebimento"></textarea>
                            <label for="descricaoGanhoEditar" class="col-form-label">Breve descrição</label>
                        </div>
                    </div>

                    <div class="linha-modal"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn fechar" data-bs-dismiss="modal">Fechar</button>
                        <button type="submit" value="Salvar" class="btn salvar">Salvar alterações</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal excluir -->
    <div
            class="modal fade"
            id="excluirModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1
                            class="modal-title fs-5"
                            id="exampleModalLabel2">
                        Confirmar Exclusão
                    </h1>
                    <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <h4>Você confirma a exclusão deste ganho?</h4>
                    <p><strong>Atenção!</strong> Esta ação é irreversível.</p>
                </div>
                <div class="modal-footer">

                    <form action="${pageContext.request.contextPath}/ganhos?acaoGanho=excluir" method="post">
                        <input
                                type="hidden"
                                name="acao"
                                value="excluir">
                        <input
                                type="hidden"
                                name="codigoExcluir"
                                id="codigoExcluir">
                        <button
                                type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal">
                            Não
                        </button>
                        <button
                                type="submit"
                                class="btn btn-danger">
                            Sim
                        </button>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <!-- fim modal-->
    <%@include file="footer.jsp"%>

    <%@include file="links_footer.jsp"%>
    </body>

    </html>