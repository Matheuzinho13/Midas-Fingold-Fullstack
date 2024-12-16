<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="links_header.jsp"%>

    <!-- css da tela -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleDividas.css">

    <!-- css do header e do footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
    <title>Dívidas</title>
</head>

<body>
<%@include file="header.jsp"%>

<!-- começo conteúdo -->
<!-- primeiro container -->
<div class="container mt-5 text-center">
    <div class="row text-center">
        <div class="col-12 col-lg-6 order-1 mt-3">
            <!-- imagem principal das dívidas -->
            <div class="imagemprincipal mt-5">
                <img src="${pageContext.request.contextPath}/resources/Imagens/Vetores/Imagem dividas.png" class="img-fluid">
            </div>
        </div>
        <div class="col-12 col-lg-6 order-2 mt-3">
            <!-- conteúdo da esquerda - título e subtítulo -->
            <section class="conteudoesquerdo mt-5 mx-3">
                <article class="textoprincipal">
                    <h1>
                        Controle suas <br>
                        <h1 class="digitando">Dívidas</h1>
                    </h1>
                </article>

                <article class="subtitulo mt-3">
                    Registre suas dívidas e monitore cada pagamento.
                    Com um acompanhamento eficaz, você se aproxima
                    cada vez mais da tranquilidade financeira!
                </article>
            </section>
        </div>
    </div>
</div>
<!-- fim primeiro container -->

<!-- botão - adicionar divida -->
<button type="button" class="btn adicionar p-2 px-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
    <svg xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision"
         image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 495 511.658">
        <path
                d="M278.532 470.356c0 22.792-35.278 41.302-78.766 41.302-43.484 0-78.77-18.51-78.77-41.302 0-4.285 1.29-8.434 3.599-12.355 10.041 16.781 39.896 28.951 75.171 28.951 23.294 0 62.051-6.893 75.167-28.951 2.261 3.78 3.599 7.932 3.599 12.355zM85.07 469.301l-2.199 2.094c-4.435 4.215-11.475 4.141-15.803-.22l-38.574-38.978-8.034 9.239a11.31 11.31 0 01-9.126 4.582C5.062 446.018 0 440.922 0 434.69V11.331A11.316 11.316 0 0111.334 0h413.148c6.27 0 11.331 5.059 11.331 11.331v203.014a207.752 207.752 0 00-22.662-2.696V22.699H22.699v382.912a11.342 11.342 0 0112.652 1.468c.22.181.44.367.621.584l39.347 39.752 11.095-10.563a58.307 58.307 0 003.449 10.696 61.796 61.796 0 00-2.354 6.631c-1.499 5.134-2.335 10.193-2.439 15.122zm.72-258.758h264.236c1.296 0 2.358 1.081 2.358 2.357v3.272c-14.654 3.297-27.95 8.11-39.19 14.072l-.582.313H85.79a2.379 2.379 0 01-2.358-2.36V212.9a2.366 2.366 0 012.358-2.357zm0 49.507h192.245c-4.322 6.228-7.56 12.926-9.581 20.015H85.79c-1.276 0-2.358-1.062-2.358-2.358v-15.3a2.366 2.366 0 012.358-2.357zm75.667-153.072H138.91v72.313h-31.102v-72.313H85.259V82.097h76.198v24.881zm25.958 72.313h-28.988l25.191-97.194h48.054l25.192 97.194h-28.991l-3.577-15.396h-33.304l-3.577 15.396zm17.084-67.334l-7.907 27.213h21.951l-7.752-27.213h-6.292zm89.296-29.86l10.73 25.971h1.555l10.73-25.971h33.744l-21.614 46.967 21.614 50.227h-34.521l-11.663-27.994h-1.401l-11.506 27.994h-32.968l21.149-49.298-21.149-47.896h35.3zm200.657 378.958c0 27.921-43.24 50.603-96.519 50.603-53.281 0-96.525-22.682-96.525-50.603 0-5.256 1.57-10.332 4.41-15.145 12.296 20.548 48.886 35.472 92.115 35.472 28.553 0 76.02-8.457 92.11-35.472 2.761 4.638 4.409 9.722 4.409 15.145zm.548-52.683c0 27.918-43.243 50.6-96.522 50.6-53.282 0-96.525-22.682-96.525-50.6 0-5.256 1.569-10.334 4.412-15.145 12.296 20.548 48.884 35.472 92.113 35.472 28.553 0 76.02-8.457 92.11-35.472 2.761 4.638 4.412 9.722 4.412 15.145zm-61.663-131.368l-1.129 12.565-47.362-4.127c3.918 4.957 6.594 10.659 8.105 17.033l-11.393-1.01c-.785-3.354-2.521-7.094-5.149-11.173-2.682-4.125-5.908-7.032-9.827-8.816l.898-10.174 65.857 5.702zm-33.408-19.666c43.105.079 77.863 14.15 77.863 31.119 0 17.199-35.531 31.105-79.314 31.105-43.788 0-79.32-13.973-79.32-31.105 0-16.94 34.402-30.795 77.225-31.114 1.073-.005 2.583-.005 3.546-.005zm-.311-10.335c52.743.093 95.382 22.882 95.382 50.617 0 27.912-43.243 50.6-96.522 50.6-53.282 0-96.525-22.688-96.525-50.6 0-27.741 42.651-50.416 95.421-50.617h2.244zM495 353.995c0 27.913-43.243 50.597-96.522 50.597-53.282 0-96.525-22.684-96.525-50.597 0-5.095 1.403-9.959 4.085-14.524 11.898 20.828 48.753 36.071 92.44 36.071 28.587 0 76.739-8.599 92.435-36.071 2.563 4.444 4.087 9.375 4.087 14.524zm-266.791 5.609l-.912 10.256-38.651-3.382c3.187 4.059 5.389 8.703 6.62 13.914l-9.307-.825c-.641-2.735-2.044-5.795-4.201-9.123-2.196-3.368-4.824-5.736-8.022-7.193l.745-8.304 53.728 4.657zm-24.226-15.994c33.767.751 60.508 11.89 60.508 25.338 0 14.047-28.983 25.389-64.725 25.389-35.732 0-64.723-11.405-64.723-25.389 0-13.587 27.153-24.714 61.262-25.358 2.52-.048 5.216-.034 7.678.02zm-.339-8.438c41.68.96 74.888 19.137 74.888 41.254 0 22.789-35.278 41.292-78.766 41.292-43.484 0-78.77-18.503-78.77-41.292 0-22.211 33.488-40.395 75.388-41.268 2.388-.045 4.917-.039 7.26.014zm74.888 89.036c0 22.781-35.278 41.293-78.766 41.293-43.484 0-78.77-18.512-78.77-41.293 0-4.161 1.138-8.124 3.334-11.85 9.713 16.999 39.783 29.442 75.436 29.442 23.333 0 62.644-7.02 75.432-29.442 2.089 3.625 3.334 7.65 3.334 11.85z" />
    </svg>
    Registrar nova dívida
</button>
<!-- fim botão - adicionar divida -->

<!-- modal - adicionar divida -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="exampleModalLabel">Registro de dívidas</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="linha-modal"></div>
            <!-- formulário modal -->
            <form action="${pageContext.request.contextPath}/dividas?acaoDivida=cadastrar" method="post">
                <div class="modal-body">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" name="valorDivida" placeholder="R$00,00" required>
                        <label for="floatingInput">Valor</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataPagamento" id="floatingdata" required>
                        <label for="floatingdata" class="col-form-label">Data do vencimento/pagamento</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="juros" id="jurosInput" min="0" max="100" step="0.01" value="0">
                        <label for="jurosInput">Porcentagem de juros (0-100)</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataDivida" id="floatingdata2">
                        <label for="floatingdata2" class="col-form-label">Data da dívida</label>
                    </div>
                </div>

                <div class="linha-modal"></div>
                <!-- botões modal -->
                <div class="modal-footer">
                    <button type="button" class="btn fechar" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" value="Salvar" class="btn salvar">Salvar dívida</button>
                </div>

            </form>
            <!-- fim formulário modal -->
        </div>
    </div>
</div>
<!-- fim modal - adicionar divida -->

<!-- tabela de dividas -->
<div class="container">
    <table class="table">
        <!-- colunas -->
        <thead class="text-center">
        <tr>
            <th>
                <div class="colunas">
                    Data Venc.
                </div>
            </th>
            <th>
                <div class="colunas">
                    Valor
                </div>
            </th>
            <th>
                <div class="colunas">
                    Juros
                </div>
            </th>
            <th>
                <div class="colunas">
                    Data Dívida
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
        <tbody class="text-center">
        <tr>
            <td data-label="Data Venc.">dd/mm/aaaa</td>
            <td data-label="Valor">R$00,00</td>
            <td data-label="Juros">00%</td>
            <td data-label="Data Dívida">dd/mm/aaaa</td>
            <td data-label="#" class="funções">
                <div class="botoes">
                    <button type="button" class="btn editar">
                        <i class="bi bi-pencil-square"></i> Editar
                    </button>
                    <button type="button" class="btn excluir">
                        <i class="bi bi-trash3-fill"></i> Excluir
                    </button>
                </div>
                <button>
                    <i class="bi bi-check-circle-fill" style="color:green"></i>
                </button>
            </td>
        </tr>
        <!-- fim conteúdo de exemplo -->
        <c:forEach items="${dividas}" var="divida">
            <tr>
                <td data-label="Data Venc.">
                    <fmt:parseDate value="${divida.dataPagamento}" pattern="yyyy-MM-dd" var="dataPgmtFmt"/>
                    <fmt:formatDate value="${dataPgmtFmt}" pattern="dd/MM/yyyy"/>
                </td>
                <td data-label="Valor"><fmt:formatNumber value="${divida.valorDivida}"/></td>
                <td data-label="Juros"><fmt:formatNumber value="${divida.juros}"/></td>
                <td data-label="Data Dívida">
                    <fmt:parseDate value="${divida.dataDivida}" pattern="yyyy-MM-dd" var="dataDividaFmt"/>
                    <fmt:formatDate value="${dataDividaFmt}" pattern="dd/MM/yyyy"/>
                </td>
                <td data-label="#" class="funções">
                    <div class="botoes">
                        <button type="button" class="btn editar" data-bs-toggle="modal" data-bs-target="#editarModal"
                                onclick="codigoEditarDivida.value = ${divida.codigoDivida};
                                        valorDividaEditar.value = '${divida.valorDivida}';
                                        dataPagamentoEditar.value = '${divida.dataPagamento}';
                                        jurosEditar.value = '${divida.juros}';
                                        dataDividaEditar.value = '${divida.dataDivida}';"
                        >
                            <i class="bi bi-pencil-square"></i> Editar
                        </button>
                        <button type="button" class="btn excluir" data-bs-toggle="modal"
                                data-bs-target="#excluirModal"
                                onclick="codigoExcluir.value = ${divida.codigoDivida}">
                            <i class="bi bi-trash3-fill"></i> Excluir
                        </button>
                    </div>
                    <button type="button" class="btn concluir" data-bs-toggle="modal"
                            data-bs-target="#concluirModal"
                            onclick="codigoPagamento.value = ${divida.codigoDivida};
                                    statusPagamento.value = '${divida.dsPaga}';">
                        <i class="bi bi-check-circle-fill"
                           <c:if test="${divida.dsPaga == 'T'}">style="color:green;"</c:if>
                           <c:if test="${divida.dsPaga == 'F'}">style="color:gray;"</c:if>
                        ></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- fim tabela de dividas -->

<!-- Modal de Confirmação de Pagamento -->
<div class="modal fade" id="concluirModal" tabindex="-1" aria-labelledby="concluirModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="concluirModalLabel">Confirmar Ação</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="concluirModalBody">
                Tem certeza que deseja mudar o status de pagamento?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
                <form action="${pageContext.request.contextPath}/dividas?acaoDivida=atualizarPagamento" method="post">
                    <input type="hidden" name="codigoPagamento" id="codigoPagamento">
                    <input type="hidden" name="statusPagamento" id="statusPagamento">
                    <button type="submit" class="btn btn-primary">Sim</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal - Editar Ganho -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="editarModalLabel">Editar Divida</h1>
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
            <form action="${pageContext.request.contextPath}/dividas?acaoDivida=editar" method="post">
                <input type="hidden" name="codigoDivida" id="codigoEditarDivida">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="valorDividaEditar" name="valorDivida" placeholder="R$00,00" required>
                        <label for="valorDividaEditar">Valor</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataPagamento" id="dataPagamentoEditar" required>
                        <label for="dataPagamentoEditar" class="col-form-label">Data do vencimento/pagamento</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="juros" id="jurosEditar" min="0" max="100" step="0.01" value="0">
                        <label for="jurosInput">Porcentagem de juros (0-100)</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataDivida" id="dataDividaEditar">
                        <label for="dataDividaEditar" class="col-form-label">Data da dívida</label>
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
                <h4>Você confirma a exclusão desta divida?</h4>
                <p><strong>Atenção!</strong> Esta ação é irreversível.</p>
            </div>
            <div class="modal-footer">

                <form action="${pageContext.request.contextPath}/dividas?acaoDivida=excluir" method="post">
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

<!-- link javascript para funcionamento do formulário conectado na tabela -->
<!-- <script src="../js/dividas.js"></script> -->

<%@include file="links_footer.jsp"%>
</body>

</html>