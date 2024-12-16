<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ganhos</title>
    <%@include file="links_header.jsp"%>

    <!-- css da tela -->
    <link rel="stylesheet" href="../css/styleGanhos.css">

    <!-- css do header e do footer -->
    <link rel="stylesheet" href="../css/header_footer.css">
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
                <img src="../Imagens/Vetores/Imagem ganhos.png" class="img-fluid">
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
            <form>
                <div class="modal-body">

                    <div class="form-floating mb-3">

                        <input type="text" class="form-control" id="floatingInput" placeholder="R$00,00" required>
                        <label for="floatingInput">Valor</label>
                    </div>
                    <div class="form-floating mb-3">

                        <input type="date" class="form-control" id="floatingdata" required>
                        <label for="floatingdata" class="col-form-label">Data</label>
                    </div>
                    <div class="form-floating mb-3">

                            <textarea class="form-control" id="floatingdesc"
                                      placeholder="motivo do recebimento"></textarea>
                        <label for="floatingdesc" class="col-form-label">Breve descrição</label>
                    </div>

                </div>

                <div class="linha-modal"></div>
                <!-- botões modal -->
                <div class="modal-footer">
                    <button type="button" class="btn fechar" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn salvar">Salvar ganho</button>
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

        </tbody>
        <!-- fim conteúdo de exemplo -->
    </table>
</div>
<!-- fim tabela de ganhos -->
<%@include file="footer.jsp"%>

<!-- link javascript para funcionamento do formulário conectado na tabela -->
<script src="../js/ganhos.js"></script>

<%@include file="links_footer.jsp"%>
</body>

</html>