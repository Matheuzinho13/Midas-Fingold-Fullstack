<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gastos</title>

    <%@include file="links_header.jsp"%>

    <!-- css da tela -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleGastos.css">

    <!-- css do header e do footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
</head>

<body>
<%@include file="header.jsp"%>

<!-- começo conteúdo -->
<!-- primeiro container -->
<div class="container mt-5 text-center">
    <div class="row text-center">
        <div class="col-12 col-lg-6 order-1 mt-3">
            <!-- imagem principal dos gastos -->
            <div class="imagemprincipal mt-5">
                <img src="${pageContext.request.contextPath}/resources/Imagens/Vetores/Imagem Gastos.png" class="img-fluid">
            </div>
        </div>
        <div class="col-12 col-lg-6 order-2 mt-5">
            <!-- conteúdo da esquerda - título e subtítulo -->
            <section class="conteudoesquerdo mt-5 mx-3">
                <article class="textoprincipal">
                    <h1>
                        Registre seus <br>
                        <h1 class="digitando">Gastos</h1>
                    </h1>
                </article>

                <article class="subtitulo mt-3">
                    Faça o registro dos seus gastos e
                    mantenha um acompanhamento
                    das suas despesas financeiras.
                </article>
            </section>
        </div>

    </div>
</div>
<!-- fim primeiro container -->

<!-- botão - adicionar gasto -->
<button type="button" class="btn adicionar p-2 px-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
    <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 58.81">
        <defs>
            <style>
                .cls-1 {
                    fill-rule: evenodd;
                }
            </style>
        </defs>
        <title>send-money</title>
        <path class="cls-1"
              d="M12.08,12V58.81H93.46L93.33,42a31.77,31.77,0,0,0-8.25,1.12v1.5a6.9,6.9,0,0,0-6.74,7H27.12c0-4.37-3.16-7.46-7-7.43V25.63a6.9,6.9,0,0,0,6.75-7H71.53c.45-.32.88-.63,1.27-1A43.64,43.64,0,0,1,81.24,12Zm110.8,12.76-20.46,20.3.1-10.2c-12.8-2.77-27.26.49-35,10.17C69,25,87.09,15,102.7,14.5l.09-10.41,20.09,20.66ZM62,30.26a10.67,10.67,0,1,0-4.47,14.41A10.67,10.67,0,0,0,62,30.26ZM0,0V43.61l5.57,0V11.85A5.15,5.15,0,0,1,11.1,6.62H76.78l0-6.62Z" />
    </svg>
    Adicionar novo gasto
</button>
<!-- fim botão - adicionar gasto -->

<!-- modal - adicionar gasto -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="exampleModalLabel">Carteira de despesas</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="linha-modal"></div>
            <!-- formulário modal -->
            <form action="${pageContext.request.contextPath}/gastos?acaoGasto=cadastrar" method="post">
                <div class="modal-body">

                    <div class="form-floating mb-3">

                        <input type="text" class="form-control" name="valorGasto" id="floatingInput" placeholder="R$00,00" required>
                        <label for="floatingInput">Valor</label>
                    </div>
                    <div class="form-floating mb-3">

                        <input type="date" class="form-control" name="dataGasto" id="floatingdata" required>
                        <label for="floatingdata" class="col-form-label">Data</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-select" name="categoria" id="floatingselect" required>
                            <option selected disabled>Selecione uma categoria</option>
                            <option value="Aluguel">Aluguel</option>
                            <option value="Alimentação">Alimentação</option>
                            <option value="Academia">Academia</option>
                            <option value="Contas">Contas</option>
                            <option value="Educação">Educação</option>
                            <option value="Lazer">Lazer</option>
                            <option value="Saúde">Saúde</option>
                            <option value="Transporte">Transporte</option>
                            <option value="Outros">Outros</option>
                        </select>
                        <label for="floatingselect" class="col-form-label">Categorias</label>
                    </div>

                    <div class="form-floating mb-3">
                            <textarea class="form-control" name="descricaoGasto" id="floatingdesc"
                                      placeholder="motivo do gasto"></textarea>
                        <label for="floatingdesc" class="col-form-label">Breve descrição</label>
                    </div>
                </div>

                <div class="linha-modal"></div>
                <!-- botões modal -->
                <div class="modal-footer">
                    <button type="button" class="btn fechar" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" value="Salvar" class="btn salvar">Salvar gasto</button>
                </div>

            </form>
            <!-- fim formulário modal -->
        </div>
    </div>
</div>
<!-- fim modal - adicionar gasto -->

<!-- tabela de gastos -->
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
                    Categoria
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
        <tbody class="text-center">
        <tr>
            <td data-label="Data">dd/mm/aaaa</td>
            <td data-label="Valor">R$00,00</td>
            <td data-label="Categoria">Categoria do gasto</td>
            <td data-label="Descrição">Breve descrição sobre o gasto</td>
            <td data-label="#" class="funções">
                <button type="button" class="btn editar">
                    <i class="bi bi-pencil-square"></i> Editar
                </button>
                <button type="button" class="btn excluir">
                    <i class="bi bi-trash3-fill"></i> Excluir
                </button>

            </td>
        </tr>
        <c:forEach items="${gastos}" var="gasto">
            <tr>
                <td data-label="Data">
                    <fmt:parseDate value="${gasto.dataGasto}" pattern="yyyy-MM-dd" var="dataGastoFmt"/>
                    <fmt:formatDate value="${dataGastoFmt}" pattern="dd/MM/yyyy"/>
                </td>
                <td data-label="Valor"><fmt:formatNumber value="${gasto.valorGasto}"/></td>
                <td data-label="Categoria">${gasto.categoria}</td>
                <td data-label="Descrição">${gasto.descricaoGasto}</td>
                <td data-label="#" class="funções">
                    <button type="button" class="btn editar" data-bs-toggle="modal" data-bs-target="#editarModal"
                            onclick="codigoGastoEditar.value = '${gasto.codigoGasto}';
                                    valorGastoEditar.value = '${gasto.valorGasto}';
                                    dataGastoEditar.value = '${gasto.dataGasto}';
                                    categoriaEditar.value = '${gasto.categoria}';
                                    descricaoGastoEditar.value = '${gasto.descricaoGasto}';">
                        <i class="bi bi-pencil-square"></i> Editar
                    </button>
                    <button type="button" class="btn excluir" data-bs-toggle="modal"
                            data-bs-target="#excluirModal"
                            onclick="codigoExcluir.value = ${gasto.codigoGasto}">
                        <i class="bi bi-trash3-fill"></i> Excluir
                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
        <!-- fim conteúdo de exemplo -->
    </table>
</div>
<!-- fim tabela de gastos -->

<!-- Modal - Editar Gasto -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="editarModalLabel">Editar Gasto</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="linha-modal"></div>
            <form action="${pageContext.request.contextPath}/gastos?acaoGasto=editar" method="post">
                <input type="hidden" name="codigoGasto" id="codigoGastoEditar">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="valorGasto" id="valorGastoEditar" placeholder="R$00,00" required>
                        <label for="valorGastoEditar">Valor</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataGasto" id="dataGastoEditar" required>
                        <label for="dataGastoEditar" class="col-form-label">Data</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-select" name="categoria" id="categoriaEditar" required>
                            <option selected disabled>Selecione uma categoria</option>
                            <option value="Aluguel">Aluguel</option>
                            <option value="Alimentação">Alimentação</option>
                            <option value="Academia">Academia</option>
                            <option value="Contas">Contas</option>
                            <option value="Educação">Educação</option>
                            <option value="Lazer">Lazer</option>
                            <option value="Saúde">Saúde</option>
                            <option value="Transporte">Transporte</option>
                            <option value="Outros">Outros</option>
                        </select>
                        <label for="categoriaEditar" class="col-form-label">Categorias</label>
                    </div>

                    <div class="form-floating mb-3">
                        <textarea class="form-control" name="descricaoGasto" id="descricaoGastoEditar"
                                  placeholder="motivo do gasto"></textarea>
                        <label for="descricaoGastoEditar" class="col-form-label">Breve descrição</label>
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
                <h4>Você confirma a exclusão deste gasto?</h4>
                <p><strong>Atenção!</strong> Esta ação é irreversível.</p>
            </div>
            <div class="modal-footer">

                <form action="${pageContext.request.contextPath}/gastos?acaoGasto=excluir" method="post">
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