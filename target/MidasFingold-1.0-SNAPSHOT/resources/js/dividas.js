// recupera o tbody
const tbody = document.querySelector('tbody');

// Variável contadora para os checkboxes
let contadorCheckbox = 1;

// pega o formulário quando clica no submit
document.querySelector('form').addEventListener('submit', function (e) {
    // cancela o evento padrão de submit
    e.preventDefault();

    // busca os campos do formulário e define os data-labels, utilizando na responsividade da tabela
    const campos = [
        { campo: document.querySelector('#floatingdata'), label: 'Data Venc.' },
        { campo: document.querySelector('#floatingInput'), label: 'Valor' },
        { campo: document.querySelector('#customRange3'), label: 'Juros' },
        { campo: document.querySelector('#floatingdesc'), label: 'Descrição' },
        { campo: document.querySelector('#floatingdata2'), label: 'Data Dívida' }
    ];

    // criar a tr/linha para cada formulário enviado
    const tr = document.createElement('tr');

    // criar a td para cada campo enviado
    campos.forEach(item => {
        const td = document.createElement('td');

        // recuperar o valor do campo e mandar pra td
        td.textContent = item.campo.value;

        // atribuir o data-label correspondente
        td.setAttribute('data-label', item.label);

        // atribuir td a tr
        tr.appendChild(td);
    });

    // criar a td para os botões de edição e exclusão
    const tdFuncoes = document.createElement('td');
    tdFuncoes.classList.add('funções');
    // associação do data-label para cada td criada, utilizando na responsividade da tabela
    tdFuncoes.setAttribute('data-label', '#');
    tdFuncoes.innerHTML = `
        <td data-label="#" class="funções">
            <div class="botoes">
                <button type="button" class="btn editar">
                    <i class="bi bi-pencil-square"></i> Editar
                </button>
                <button type="button" class="btn excluir">
                    <i class="bi bi-trash3-fill"></i> Excluir
                </button>
            </div>
            <div class="form-check">
                <h4 class="dsPaga">Dívida paga</h4>
                <input class="form-check-input" type="checkbox" id="customCheckbox${contadorCheckbox}">
                <label class="form-check-label" for="customCheckbox${contadorCheckbox}"></label>
            </div>
        </td>
    `;

    // atribuir tdFuncoes a tr
    tr.appendChild(tdFuncoes);

    // inserir tr no tbody
    tbody.appendChild(tr);

    // Aumenta o contador para o próximo checkbox
    contadorCheckbox++;

    // limpar formulário
    this.reset();
});


function updateValue(value) {
    document.getElementById('rangeValue').innerText = value;
}
