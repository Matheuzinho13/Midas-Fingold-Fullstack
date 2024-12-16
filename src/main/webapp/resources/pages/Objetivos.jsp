
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@include file="links_header.jsp"%>

    <!-- css da tela -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styleObjetivos.css">

    <!-- css do header e do footer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
    <title>Objetivos</title>
</head>

<body>
<%@include file="header.jsp"%>

<!-- começo conteúdo -->
<!-- primeiro container -->
<div class="container mt-5 text-center">
    <div class="row text-center">
        <div class="col-12 col-lg-6 order-2 mt-3">
            <!-- imagem principal dos objetivos -->
            <div class="imagemprincipal mt-5">
                <img src="${pageContext.request.contextPath}/resources/Imagens/Vetores/Imagem objetivos.png" class="img-fluid">
            </div>
        </div>
        <div class="col-12 col-lg-6 order-1 mt-5">
            <!-- conteúdo da direita - título e subtítulo -->
            <section class="conteudodireito mt-5 mx-3">
                <article class="textoprincipal">
                    <h1>
                        Estabeleça seus <br>
                        <h1 class="digitando">Objetivos</h1>
                    </h1>
                </article>

                <article class="subtitulo mt-3">
                    Trace suas metas financeiras e
                    acompanhe sua jornada para o sucesso.
                    Defina objetivos claros, conquiste cada
                    etapa e celebre suas realizações.
                </article>
            </section>
        </div>

    </div>
</div>
<!-- fim primeiro container -->
<!-- barra de progresso -->
<div class="container">
    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="50" aria-valuemin="0"
         aria-valuemax="100">
        <div class="progress-bar" style="width: 50%" id="progressBar"></div>
    </div>
    <h1 class="porcentagemObj" id="progressText">50% dos objetivos concluídos</h1>
</div>
<!-- fim barra de progresso -->
<!-- botão - adicionar objetivo -->
<button type="button" class="btn adicionar p-1 px-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
    <?xml version="1.0" encoding="utf-8"?><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                                               xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="122.88px" height="119.853px"
                                               viewBox="0 0 122.88 119.853" enable-background="new 0 0 122.88 119.853" xml:space="preserve">
            <g>
                <path
                        d="M59.927,0h0.009v0.002c5.902,0.001,11.606,0.855,16.99,2.446c0.861,0.254,1.73,0.534,2.605,0.836 c4.428,1.532,8.614,3.565,12.491,6.029c0.273,0.173,0.354,0.535,0.182,0.808c-0.018,0.027-0.039,0.054-0.06,0.078l-4.288,5.498 c-0.19,0.244-0.536,0.296-0.788,0.125l-0.01-0.006c-1.09-0.673-2.216-1.31-3.372-1.909c-1.165-0.602-2.349-1.16-3.55-1.669 l-0.002-0.001v0.001c-6.206-2.633-13.035-4.09-20.208-4.09h-0.006V8.146c-7.146,0-13.958,1.451-20.152,4.071 c-1.012,0.428-2.005,0.886-2.975,1.371c-5.007,2.504-9.555,5.801-13.48,9.726l-0.004,0.004l-0.027,0.025 c-1.302,1.304-2.535,2.677-3.692,4.113c-1.164,1.445-2.255,2.956-3.262,4.524c-5.177,8.06-8.181,17.652-8.181,27.946v0.006H8.145 c0,7.146,1.451,13.958,4.071,20.152c0.428,1.013,0.886,2.005,1.371,2.975c2.504,5.006,5.801,9.555,9.727,13.48l0.004,0.004 l0.022,0.023c1.304,1.303,2.679,2.537,4.116,3.695c1.445,1.165,2.956,2.255,4.525,3.262c8.06,5.177,17.653,8.181,27.946,8.181 h0.006v0.003c7.148-0.001,13.958-1.451,20.152-4.071c1.013-0.428,2.005-0.886,2.975-1.371c5.007-2.504,9.556-5.801,13.48-9.726 l0.005-0.005l0.03-0.029c1.3-1.303,2.532-2.674,3.688-4.108c1.165-1.445,2.255-2.957,3.262-4.525 c5.178-8.06,8.181-17.652,8.181-27.945v-0.01h0.003c-0.001-4.319-0.532-8.521-1.533-12.537c-0.166-0.669-0.341-1.318-0.523-1.946 c-0.962-3.307-2.247-6.479-3.814-9.478c-0.136-0.259-0.058-0.573,0.172-0.741l5.541-4.381c0.252-0.2,0.619-0.157,0.818,0.096 c0.018,0.022,0.033,0.046,0.046,0.07L112.418,31l0.004,0.008l0.006,0.012l0.001,0c0.661,1.198,1.285,2.425,1.866,3.676 c0.582,1.252,1.121,2.525,1.615,3.814c2.547,6.652,3.943,13.874,3.943,21.418v0.006h-0.002c-0.001,8.271-1.679,16.154-4.711,23.321 c-0.491,1.163-1.021,2.312-1.588,3.443c-2.903,5.805-6.717,11.069-11.251,15.604l-0.004,0.004l-0.022,0.02 c-1.512,1.511-3.105,2.94-4.771,4.283c-1.673,1.349-3.421,2.609-5.234,3.774c-9.33,5.992-20.433,9.471-32.344,9.471h-0.006v-0.002 c-8.271-0.001-16.154-1.679-23.321-4.711c-1.163-0.491-2.312-1.022-3.444-1.589c-5.804-2.902-11.069-6.717-15.604-11.25 l-0.004-0.005l-0.028-0.029c-1.508-1.51-2.935-3.1-4.275-4.763c-1.348-1.673-2.609-3.421-3.773-5.234 C3.479,82.939,0,71.837,0,59.927V59.92h0.002c0.001-8.271,1.679-16.153,4.71-23.321c0.492-1.163,1.022-2.311,1.589-3.444 c2.902-5.804,6.717-11.068,11.25-15.603l0.004-0.004l0.026-0.023c1.51-1.509,3.103-2.938,4.766-4.279 c1.674-1.348,3.421-2.609,5.235-3.773C36.915,3.478,48.017,0,59.927,0L59.927,0z M93.067,16.299l16.77-16.024l1.117,10.807 l11.926,1.491l-17.958,17.401l-8.738,0.75L61.316,63.154l-3.213-2.767l33.027-34.5L93.067,16.299L93.067,16.299z M59.927,40.958 h0.015v0.002c1.128,0.001,2.226,0.098,3.283,0.284c0.123,0.022,0.297,0.055,0.517,0.1h0.003l0,0c0.88,0.18,1.742,0.423,2.579,0.723 c0.304,0.108,0.462,0.442,0.353,0.746c-0.021,0.06-0.053,0.114-0.09,0.162l0.001,0.001l-4.681,6.004 c-0.131,0.169-0.339,0.244-0.538,0.218V49.2l-0.027-0.004v0.001l-0.208-0.025l-0.018-0.003l-0.18-0.019l-0.015-0.002 c-0.312-0.027-0.643-0.042-0.994-0.042h-0.006v-0.003c-1.491,0.001-2.915,0.305-4.209,0.853c-0.214,0.091-0.422,0.187-0.621,0.286 c-1.042,0.521-1.992,1.21-2.815,2.033l-0.004,0.004l-0.027,0.024c-0.264,0.266-0.514,0.547-0.75,0.84 c-0.243,0.301-0.471,0.618-0.682,0.946c-1.08,1.682-1.706,3.687-1.706,5.837v0.006h-0.003c0.001,1.493,0.305,2.916,0.853,4.209 c0.091,0.215,0.187,0.423,0.286,0.621c0.521,1.043,1.211,1.992,2.033,2.814l0.004,0.005l0.024,0.025 c0.266,0.264,0.547,0.516,0.84,0.751c0.301,0.243,0.618,0.472,0.946,0.683c1.683,1.079,3.688,1.706,5.837,1.706h0.006v0.002 c1.493,0,2.917-0.304,4.209-0.852c0.215-0.091,0.422-0.187,0.621-0.286c1.043-0.522,1.992-1.211,2.814-2.034l0.005-0.005 l0.02-0.019c0.146-0.147,0.288-0.296,0.419-0.443s0.268-0.312,0.408-0.49c0.678-0.86,1.229-1.824,1.621-2.861 c0.045-0.121,0.126-0.219,0.227-0.284l7.564-5.982c0.253-0.2,0.619-0.157,0.819,0.096c0.07,0.089,0.109,0.192,0.121,0.297h0.003 l0.005,0.045l0.002,0.031l0.024,0.25v0.007h0.002l0.022,0.272v0.005c0.035,0.48,0.055,0.957,0.055,1.431v0.006h-0.003 c-0.001,2.617-0.532,5.111-1.491,7.379c-0.154,0.365-0.323,0.729-0.503,1.09c-0.921,1.839-2.127,3.506-3.56,4.938l-0.004,0.004 l-0.032,0.027c-0.472,0.47-0.968,0.917-1.485,1.334c-0.53,0.426-1.084,0.826-1.656,1.193c-2.954,1.896-6.466,2.997-10.234,2.997 h-0.006v-0.003c-2.617-0.001-5.111-0.532-7.378-1.491c-0.365-0.154-0.73-0.323-1.09-0.503c-1.839-0.921-3.506-2.127-4.938-3.559 l-0.004-0.004l-0.033-0.036c-0.468-0.471-0.912-0.966-1.328-1.482c-0.427-0.53-0.826-1.083-1.194-1.656 c-1.896-2.953-2.997-6.466-2.997-10.233V59.92h0.002c0.001-2.616,0.533-5.11,1.491-7.377c0.155-0.365,0.323-0.729,0.503-1.09 c0.919-1.836,2.125-3.502,3.559-4.936l0.001-0.001l-0.001-0.001l0.004-0.004c0.475-0.474,0.982-0.929,1.518-1.361 c0.53-0.427,1.083-0.826,1.656-1.194C52.647,42.059,56.161,40.958,59.927,40.958L59.927,40.958z M60.92,49.148 c-0.307-0.038-0.531-0.31-0.512-0.618L60.92,49.148L60.92,49.148z M59.927,20.31h0.01v0.002c3.544,0.001,6.977,0.467,10.238,1.338 c0.531,0.142,1.059,0.295,1.582,0.459c2.685,0.838,5.251,1.958,7.661,3.323c0.28,0.159,0.379,0.516,0.22,0.796 c-0.015,0.024-0.03,0.049-0.048,0.071l-0.003,0.003l-4.344,5.572c-0.182,0.232-0.505,0.29-0.753,0.147l-0.014-0.007 c-0.588-0.307-1.201-0.604-1.838-0.884c-0.641-0.283-1.285-0.543-1.931-0.779c-3.359-1.226-6.991-1.895-10.781-1.895h-0.006v-0.002 c-4.343,0-8.482,0.883-12.247,2.475c-0.594,0.252-1.198,0.531-1.808,0.835l-0.046,0.021c-3.023,1.519-5.771,3.514-8.146,5.888 l-0.004,0.004L37.646,37.7c-0.787,0.789-1.534,1.623-2.235,2.493c-0.707,0.878-1.37,1.797-1.982,2.75 c-3.145,4.898-4.97,10.728-4.97,16.983v0.006h-0.002c0,4.343,0.883,8.483,2.475,12.247c0.26,0.616,0.539,1.22,0.833,1.808 c1.521,3.041,3.525,5.805,5.911,8.191l0.004,0.004c0.802,0.803,1.643,1.559,2.515,2.261c0.878,0.707,1.797,1.37,2.75,1.982 c4.898,3.146,10.729,4.97,16.983,4.97h0.006v0.002c4.343,0,8.483-0.882,12.248-2.474c0.616-0.261,1.22-0.539,1.808-0.834 c3.041-1.521,5.805-3.524,8.191-5.911l0.004-0.004c0.803-0.803,1.559-1.643,2.261-2.515c0.707-0.879,1.37-1.797,1.982-2.751 c3.147-4.899,4.972-10.729,4.972-16.982h-0.002v-0.015h0.002c0-1.941-0.178-3.845-0.516-5.691c-0.051-0.276-0.111-0.578-0.18-0.899 c-0.327-1.535-0.766-3.024-1.303-4.456c-0.096-0.257,0-0.539,0.217-0.687l5.663-4.478c0.253-0.2,0.619-0.157,0.818,0.096 c0.03,0.039,0.054,0.078,0.073,0.12l0.001,0l0.004,0.01l0.004,0.008l0.001-0.001c0.295,0.669,0.579,1.365,0.85,2.086 c0.267,0.712,0.513,1.427,0.734,2.143c1.155,3.719,1.778,7.67,1.778,11.763v0.006h-0.003c0,5.467-1.109,10.678-3.113,15.415 c-0.324,0.767-0.676,1.527-1.051,2.277c-1.919,3.838-4.44,7.318-7.437,10.314l-0.005,0.004l-0.022,0.021 c-0.998,0.995-2.048,1.939-3.146,2.824c-1.106,0.892-2.262,1.725-3.46,2.494c-6.17,3.962-13.509,6.261-21.381,6.261h-0.006V99.54 c-5.467-0.001-10.678-1.109-15.416-3.113c-0.767-0.325-1.527-0.676-2.277-1.051c-3.837-1.92-7.318-4.44-10.315-7.437l-0.004-0.004 l-0.028-0.03c-0.993-0.995-1.934-2.043-2.816-3.139c-0.892-1.106-1.725-2.262-2.495-3.46c-3.962-6.169-6.261-13.509-6.261-21.38 V59.92h0.002c0.001-5.467,1.111-10.678,3.115-15.416c0.324-0.767,0.675-1.527,1.05-2.277c1.918-3.835,4.439-7.314,7.436-10.312 l0.001-0.001l-0.001-0.001l0.004-0.004l0.026-0.024c0.996-0.995,2.046-1.937,3.142-2.82c1.107-0.892,2.262-1.725,3.46-2.494 C44.715,22.609,52.056,20.31,59.927,20.31L59.927,20.31z" />
            </g>
        </svg> Adicionar nova meta
</button>
<!-- fim botão - adicionar objetivo -->

<!-- modal - adicionar objetivo -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="exampleModalLabel">Planejador de Objetivos</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="linha-modal"></div>
            <!-- formulário modal -->

            <form action="${pageContext.request.contextPath}/objetivos?acao=cadastrar" method="post">
                <div class="modal-body">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="nomeObjetivo" id="floatingNome" placeholder="ex.: casa própria"
                               required>
                        <label for="floatingNome">Nome</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="valorObjetivo" id="floatingInput" placeholder="R$00,00" required>
                        <label for="floatingInput">Valor</label>
                    </div>
                    <div class="form-floating mb-3">

                        <input type="date" class="form-control" name="dataObjetivo" id="floatingdata" required>
                        <label for="floatingdata" class="col-form-label">Data</label>
                    </div>
                    <div class="form-floating mb-3">

                            <textarea class="form-control" name="descricaoObjetivo" id="floatingdesc"
                                      placeholder="motivo do objetivo"></textarea>
                        <label for="floatingdesc" class="col-form-label">Breve descrição</label>
                    </div>

                </div>

                <div class="linha-modal"></div>
                <!-- botões modal -->
                <div class="modal-footer">
                    <button type="button" class="btn fechar" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" value="Salvar" class="btn salvar">Salvar objetivo</button>
                </div>
            </form>
            <!-- fim formulário modal -->
        </div>
    </div>
</div>
<!-- fim modal - adicionar objetivo -->

<!-- tabela de objetivos -->
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
            <td data-label="Nome">Nome para a sua meta</td>
            <td data-label="Data">dd/mm/aaaa</td>
            <td data-label="Valor">R$00,00</td>
            <td data-label="Descrição">Breve descrição sobre o objetivo</td>
            <td data-label="#" class="funções">
                <button type="button" class="btn editar">
                    <i class="bi bi-pencil-square"></i> Editar
                </button>
                <button type="button" class="btn excluir">
                    <i class="bi bi-trash3-fill"></i> Excluir
                </button>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="customCheckbox">
                    <label class="form-check-label" for="customCheckbox"></label>
                </div>
            </td>
        </tr>

        <c:forEach items="${objetivos}" var="objetivo">
            <tr>
                <td data-label="Nome">${objetivo.nomeObjetivo}</td>
                <td data-label="Data">
                    <fmt:parseDate value="${objetivo.dataObjetivo}" pattern="yyyy-MM-dd" var="dataObjetivoFmt"/>
                    <fmt:formatDate value="${dataObjetivoFmt}" pattern="dd/MM/yyyy"/>
                </td>
                <td data-label="Valor"> <fmt:formatNumber value="${objetivo.valorObjetivo}"/></td>
                <td data-label="Descrição">${objetivo.descricaoObjetivo}</td>
                <td data-label="#" class="funções">
                    <button type="button" class="btn editar" data-bs-toggle="modal" data-bs-target="#editarModal"
                            onclick="codigoEditar.value = ${objetivo.codigoObjetivo};
                                    nomeObjetivoEditar.value = '${objetivo.nomeObjetivo}';
                                    valorObjetivoEditar.value = '${objetivo.valorObjetivo}';
                                    dataObjetivoEditar.value = '${objetivo.dataObjetivo}';
                                    descricaoObjetivoEditar.value = '${objetivo.descricaoObjetivo}';
                                    statusObjetivoEditar.checked = ${objetivo.dsConcluido == 'T'};">
                        <i class="bi bi-pencil-square"></i> Editar
                    </button>
                    <button type="button" class="btn excluir" data-bs-toggle="modal"
                            data-bs-target="#excluirModal"
                            onclick="codigoExcluir.value = ${objetivo.codigoObjetivo}">
                        <i class="bi bi-trash3-fill"></i> Excluir
                    </button>
                    <button type="button" class="btn concluir" data-bs-toggle="modal"
                            data-bs-target="#concluirModal"
                            onclick="codigoConclusao.value = ${objetivo.codigoObjetivo};
                                    statusConclusao.value = '${objetivo.dsConcluido}';">
                        <i class="bi bi-check-circle-fill"
                           <c:if test="${objetivo.dsConcluido == 'T'}">style="color:green;"</c:if>
                           <c:if test="${objetivo.dsConcluido == 'F'}">style="color:gray;"</c:if>
                        ></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <!-- fim conteúdo de exemplo -->
    </table>
</div>
<!-- fim tabela de objetivos -->

<!-- Modal de Confirmação de Conclusão/Não Conclusão -->
<div class="modal fade" id="concluirModal" tabindex="-1" aria-labelledby="concluirModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="concluirModalLabel">Confirmar Ação</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="concluirModalBody">
                Tem certeza que deseja mudar o status de conclusão?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
                <form action="${pageContext.request.contextPath}/objetivos?acao=concluir" method="post">
                    <input type="hidden" name="codigoConclusao" id="codigoConclusao">
                    <input type="hidden" name="statusConclusao" id="statusConclusao">
                    <button type="submit" class="btn btn-primary">Sim</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Edição de Objetivo -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="editarModalLabel">Editar Objetivo</h1>
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
            <form action="${pageContext.request.contextPath}/objetivos?acao=editar" method="post">
                <input type="hidden" name="codigo" id="codigoEditar">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="nomeObjetivo" id="nomeObjetivoEditar" placeholder="ex.: casa própria"
                               required>
                        <label for="nomeObjetivoEditar">Nome</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="valorObjetivo" id="valorObjetivoEditar" placeholder="R$00,00" required>
                        <label for="valorObjetivoEditar">Valor</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="dataObjetivo" id="dataObjetivoEditar" required>
                        <label for="dataObjetivoEditar" class="col-form-label">Data</label>
                    </div>
                    <div class="form-floating mb-3">
                        <textarea class="form-control" name="descricaoObjetivo" id="descricaoObjetivoEditar"
                                  placeholder="motivo do objetivo"></textarea>
                        <label for="descricaoObjetivoEditar" class="col-form-label">Breve descrição</label>
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
                <h4>Você confirma a exclusão deste objetivo?</h4>
                <p><strong>Atenção!</strong> Esta ação é irreversível.</p>
            </div>
            <div class="modal-footer">

                <form action="${pageContext.request.contextPath}/objetivos" method="post">
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
<!-- <script src="../js/objetivos.js"></script> -->

<%@include file="links_footer.jsp"%>

<script>
    // Obter a porcentagem de objetivos concluídos do JSP
    var porcentagem = parseInt("${porcentagemObjetivos}");

    // Atualizar a barra de progresso
    document.getElementById('progressBar').style.width = porcentagem + '%';

    // Atualizar o texto da porcentagem
    document.getElementById('progressText').textContent = porcentagem + '% dos objetivos concluídos';
</script>
</body>

</html>