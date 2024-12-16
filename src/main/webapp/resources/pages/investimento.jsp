<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carteira de investimentos</title>

    <%@include file="links_header.jsp"%>

    <!-- CSS da página de investimentos -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleInvestimento.css">

    <!-- css do header e do footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
</head>
<body>
<%@include file="header.jsp"%>

<!-- começo conteúdo -->
<!-- primeiro container -->
<div class="container mt-5 text-center">
    <div class="row text-center">
        <div class="col-12 col-sm-12 col-md-12 order-2 col-lg-6 mt-3">
            <!-- imagem principal dos investimentos -->
            <div class="imagemprincipal mt-5">
                <img src="${pageContext.request.contextPath}/resources/Imagens/Vetores/Imagem investimentos.png" class="img-fluid" alt="Imagem Investimentos">
            </div>
        </div>
        <div class="col-12 col-sm-12 col-md-12 order-1 col-lg-6 mt-5">
            <!-- conteúdo da esquerda - título e subtítulo -->
            <section class="conteudoesquerdo mt-5 mx-3">
                <article class="textoprincipal">
                    <h1>
                        Faça um novo <br>
                        <h1 class="digitando">investimento</h1>
                    </h1>
                </article>

                <article class="subtitulo mt-3">
                    Faça um novo investimento e não
                    deixe seu dinheiro parado. Investir
                    é um realizador de sonhos.
                </article>
            </section>
        </div>

    </div>
</div>
<!-- fim primeiro container -->

<!-- botão - adicionar investimento -->
<button type="button" class="btn adicionar p-2 px-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
    <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 105.05 122.88"><defs><style>.cls-1{fill-rule:evenodd;}</style></defs><title>money-saving</title><path class="cls-1" d="M68.11,51.49a18.57,18.57,0,0,1,3.74-1.91A40.38,40.38,0,0,1,79.39,49c3.64-.09,7.27.23,7.63,1a4,4,0,0,1,.41,2.1,4.73,4.73,0,0,1-.68,2A13.94,13.94,0,0,1,82.44,58c-1.66,1.14-3.18,2.19-2.93,3,0,.07.18.2.42.4a15.56,15.56,0,0,0,1.44,1,22.17,22.17,0,0,1,5.37,4.44,27.81,27.81,0,0,1,3.8,5.89c.34.67.67,1.37,1,2.09s.66,1.54,1,2.33l.06.25a6.8,6.8,0,0,0,.74,2.39c.15.25.3.37.44.37h1.76l.69,0c1.64-.12,2.56-.18,3.51,2.28a16.84,16.84,0,0,1,.79,6.43,23.5,23.5,0,0,1-1.25,6.91,4.8,4.8,0,0,1-1.61,2.79,5.61,5.61,0,0,1-3.25,1.19h-2c-.83,0-1.56,0-2.1,0s-.62-.09-.69-.05,0,.05-.11.23a19.77,19.77,0,0,1-2,2.42c-.82.85-1.78,1.79-2.7,2.66s-1.7,1.56-2.4,2.15l-.43.36a7.37,7.37,0,0,0-1.2,1.07,7.57,7.57,0,0,0,.67,1.88c.2.48.32.76.36.87.47,1.15.94,2.26,1.36,3.23.71,1.64,1.5,3.38,1.75,4l0,.06c.58,1.47.45,2.59-.36,3.39a4,4,0,0,1-3.24.83H74.33a4.79,4.79,0,0,1-2.74-.63,7.16,7.16,0,0,1-2.24-2.11l-.06-.11a18.13,18.13,0,0,1-.8-1.64c-.67-1.51-1.51-3.38-2.19-3.11a42.35,42.35,0,0,1-14.19,3.08,49.66,49.66,0,0,1-16.17-2.41c-1.73-.24-2.08.49-2.64,1.65-.16.33-.32.68-.55,1.12h0c-.14.28-.19.4-.24.5-.8,1.71-1.57,3.36-4,3.85l-.26,0-8.91-.07h-.09a3.54,3.54,0,0,1-1.45-.39,2.65,2.65,0,0,1-1.14-1.11c-.79-1.45-.26-2.54.28-3.65h0l.21-.43h0l3.13-6.85.06-.12a2.09,2.09,0,0,0,.38-1.39,2,2,0,0,0-.77-1h0c-.62-.44-1.23-.9-1.81-1.36s-1.17-1-1.73-1.49a32.21,32.21,0,0,1-5-5.84A30.67,30.67,0,0,1,8,92.41a25.73,25.73,0,0,1-1.36-5.67c0-.44-.09-.89-.12-1.34a11.22,11.22,0,0,1-5.9-7.13c-1-3.33-.87-7.47.61-12.08l2.5.8a18,18,0,0,0-.59,10.52A8.86,8.86,0,0,0,6.59,82.4c0-.39.08-.79.13-1.18A28.77,28.77,0,0,1,11.38,69.4,36.27,36.27,0,0,1,23.73,58l.2.14L39.64,68a47.29,47.29,0,0,0-8.16,2,3.74,3.74,0,0,0,2.44,7.07A40,40,0,0,1,47.23,75,47.49,47.49,0,0,1,61,77.19,3.75,3.75,0,0,0,63.18,70a59.27,59.27,0,0,0-6.1-1.55l11-17ZM104.17,4.61H95.29a.89.89,0,0,0-.88.87V27.05a.88.88,0,0,0,.88.87h8.88a.88.88,0,0,0,.88-.87V5.48a.88.88,0,0,0-.88-.87Zm-12,3.85a1.68,1.68,0,0,0-.28-1.05c-.57-.77-2-.54-2.85-.54a12.58,12.58,0,0,1-2.73-.22,31.09,31.09,0,0,1-3.89-1.29c-4.83-1.73-8.94-2.8-14-5a3.88,3.88,0,0,0-3.25,0A84.62,84.62,0,0,0,51.59,6.73a5.43,5.43,0,0,0-1.16.84,5.16,5.16,0,0,0-.87,1.17c-2.79,4-5.18,8.16-7.47,12.27-.77,1.44-1.09,2.81-.56,3.67,2.15,3.54,6-1.49,10.2-4.84,1.76-1.41,4.15-2.66,6.2-4.09,2.64-1.1,3.87-2.15,6.7-2.74,4.34-.38,4.7,5.85-1,6.08-3.87.15-11.85,3.66-14.09,6.9-2.09,3-.94,6,3.32,5.87l3.56-.66c5.66-1.07,5.5-1.28,11.41-.18,3.17.58,6.49,1.2,9.75.59,2-.37,3-1.17,4.81-2.52a16.37,16.37,0,0,1,2.83-2A10.82,10.82,0,0,1,87.8,26c1.36-.32,3.27.14,4.06-1a2.23,2.23,0,0,0,.33-1.17V8.46ZM47.89,36.32a6.29,6.29,0,1,0,7.48.57c-.62.13-1.17.26-1.52.32h0a6.4,6.4,0,0,1-.88.09,11.14,11.14,0,0,1-5.08-1Zm-6.63-4.9L27.08,53.25l23.39,14.8L70.63,37c-1.33-.18-2.57-.41-3.79-.63l-.78-.15-14.49,22a4.09,4.09,0,0,0-5.64,1.26l-9.24-5.86A4.09,4.09,0,0,0,35.43,48l9.31-14.13a8.22,8.22,0,0,1-1.2-2.2,5.83,5.83,0,0,1-2.28-.2Zm36.11,44a4.27,4.27,0,1,1-3,1.25,4.17,4.17,0,0,1,3-1.25Z"/></svg>
    Adicionar novo investimento
</button>
<!-- fim botão - adicionar investimento -->

<!-- modal - adicionar investimento -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="exampleModalLabel">Carteira de Investimentos</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="linha-modal"></div>
            <!-- formulário modal -->

            <form action="${pageContext.request.contextPath}/investimentos?acaoInvestimento=cadastrar" method="post">
                <div class="modal-body">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="nomeAplicacao" id="floatingNomeAplicacao" placeholder="ex.: CDB" required>
                        <label for="floatingNomeAplicacao">Nome da Aplicação</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-select" name="tipoInvestimento" id="floatingselect" required>
                            <option selected disabled>Selecione uma categoria</option>
                            <option value="Renda fixa">Renda fixa</option>
                            <option value="Ações">Ações</option>
                            <option value="Fundos imobiliários">Fundos imobiliários</option>
                            <option value="Fundos de investimento">Fundos de investimento</option>
                            <option value="Criptoativos">Criptoativos</option>
                            <option value="Câmbio">Câmbio</option>
                            <option value="Commodities">Commodities</option>
                            <option value="Previdência privada">Previdência privada</option>
                            <option value="Outros">Outros</option>
                        </select>
                        <label for="floatingselect" class="col-form-label">Categorias</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="valorAplicacao" id="floatingInput" placeholder="R$00,00" required>
                        <label for="floatingInput">Valor</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="nomeBanco" id="floatingNomeBanco" placeholder="ex.: Itaú" required>
                        <label for="floatingNomeBanco">Nome do Banco</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataInvestimento" id="floatingDataInves" required>
                        <label for="floatingDataInves" class="col-form-label">Data</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataVencimento" id="floatingDataVenc">
                        <label for="floatingDataVenc" class="col-form-label">Data</label>
                    </div>

                </div>

                <div class="linha-modal"></div>
                <!-- botões modal -->
                <div class="modal-footer">
                    <button type="button" class="btn fechar" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn salvar">Salvar investimento</button>
                </div>

            </form>
            <!-- fim formulário modal -->
        </div>
    </div>
</div>
<!-- fim modal - adicionar investimento -->

<!-- tabela de investimentos -->
<div class="container">
    <table class="table">
        <!-- colunas -->
        <thead class="text-center">
        <tr>
            <th>
                <div class="colunas">
                    Nome
                </div>
            </th>
            <th>
                <div class="colunas">
                    Categoria
                </div>
            </th>
            <th>
                <div class="colunas">
                    Valor
                </div>
            </th>
            <th>
                <div class="colunas">
                    Banco
                </div>
            </th>
            <th>
                <div class="colunas">
                    Data do Investimento
                </div>
            </th>
            <th>
                <div class="colunas">
                    Data do Vencimento
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
            <td data-label="Nome">Nome da Aplicação</td>
            <td data-label="Categoria">Categoria do investimento</td>
            <td data-label="Valor">R$00,00</td>
            <td data-label="Banco">Nome do banco</td>
            <td data-label="Data do Investimento">dd/mm/aaaa</td>
            <td data-label="Data do Vencimento">dd/mm/aaaa</td>
            <td data-label="#" class="funções">
                <button type="button" class="btn editar">
                    <i class="bi bi-pencil-square"></i> Editar
                </button>
                <button type="button" class="btn excluir">
                    <i class="bi bi-trash3-fill"></i> Excluir
                </button>
            </td>
        </tr>

        <c:forEach items="${investimentos}" var="investimento">
            <tr>
                <td data-label="Nome">${investimento.nomeAplicacao}</td>
                <td data-label="Categoria">${investimento.tipoInvestimento}</td>
                <td data-label="Valor"> <fmt:formatNumber value="${investimento.valorAplicacao}"/></td>
                <td data-label="Banco">${investimento.nomeBanco}</td>
                <td data-label="Data do Investimento">
                    <fmt:parseDate value="${investimento.dataInvestimento}" pattern="yyyy-MM-dd" var="dataInvestimentoFmt"/>
                    <fmt:formatDate value="${dataInvestimentoFmt}" pattern="dd/MM/yyyy"/>
                </td>
                <td data-label="Data do Vencimento">
                    <c:if test="${not empty investimento.dataVencimento}">
                        <fmt:parseDate value="${investimento.dataVencimento}" pattern="yyyy-MM-dd" var="dataVencimentoFmt"/>
                        <fmt:formatDate value="${dataVencimentoFmt}" pattern="dd/MM/yyyy"/>
                    </c:if>
                </td>
                <td data-label="#" class="funções">
                    <button type="button" class="btn editar" data-bs-toggle="modal" data-bs-target="#editarModal"
                            onclick="codigoEditar.value = '${investimento.codigoInvestimento}';
                                    nomeAplicacaoEditar.value = '${investimento.nomeAplicacao}';
                                    tipoInvestimentoEditar.value = '${investimento.tipoInvestimento}';
                                    valorAplicacaoEditar.value = '${investimento.valorAplicacao}';
                                    nomeBancoEditar.value = '${investimento.nomeBanco}';
                                    dataInvestimentoEditar.value = '${investimento.dataInvestimento}';
                                    dataVencimentoEditar.value = '${investimento.dataVencimento}';">
                        <i class="bi bi-pencil-square"></i> Editar
                    </button>
                    <button type="button" class="btn excluir" data-bs-toggle="modal"
                            data-bs-target="#excluirModal"
                            onclick="codigoExcluir.value = ${investimento.codigoInvestimento}">
                        <i class="bi bi-trash3-fill"></i> Excluir
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <!-- fim conteúdo de exemplo -->
    </table>
</div>

<!-- Modal - Editar Investimento -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="editarModalLabel">Editar Investimento</h1>
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
            <form action="${pageContext.request.contextPath}/investimentos?acaoInvestimento=editar" method="post">
                <input type="hidden" name="codigoInvestimento" id="codigoEditar">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="nomeAplicacao" id="nomeAplicacaoEditar" placeholder="ex.: CDB"
                               required>
                        <label for="nomeAplicacaoEditar">Nome da Aplicação</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-select" id="tipoInvestimentoEditar" name="tipoInvestimento" required>
                            <option selected disabled>Selecione uma categoria</option>
                            <option value="Renda fixa">Renda fixa</option>
                            <option value="Ações">Ações</option>
                            <option value="Fundos imobiliários">Fundos imobiliários</option>
                            <option value="Fundos de investimento">Fundos de investimento</option>
                            <option value="Criptoativos">Criptoativos</option>
                            <option value="Câmbio">Câmbio</option>
                            <option value="Commodities">Commodities</option>
                            <option value="Previdência privada">Previdência privada</option>
                            <option value="Outros">Outros</option>
                        </select>
                        <label for="tipoInvestimentoEditar" class="col-form-label">Categorias</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="valorAplicacao" id="valorAplicacaoEditar" placeholder="R$00,00" required>
                        <label for="valorAplicacaoEditar">Valor</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="nomeBanco" id="nomeBancoEditar" placeholder="ex.: Itaú" required>
                        <label for="nomeBancoEditar">Nome do Banco</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataInvestimento" id="dataInvestimentoEditar" required>
                        <label for="dataInvestimentoEditar" class="col-form-label">Data do Investimento</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataVencimento" id="dataVencimentoEditar">
                        <label for="dataVencimentoEditar" class="col-form-label">Data de Vencimento</label>
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
                <h4>Você confirma a exclusão deste investimento?</h4>
                <p><strong>Atenção!</strong> Esta ação é irreversível.</p>
            </div>
            <div class="modal-footer">

                <form action="${pageContext.request.contextPath}/investimentos?acaoInvestimento=excluir" method="post">
                    <input
                            type="hidden"
                            name="acao"
                            value="excluirInvestimento">
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