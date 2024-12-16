package br.com.midas.controller;

import br.com.midas.dao.DividaDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Divida;
import br.com.midas.model.Usuario;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/dividas")
public class DividaServlet extends HttpServlet {

    private DividaDao dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = DaoFactory.getDividaDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String acaoDivida = req.getParameter("acaoDivida");

        HttpSession session = req.getSession();
        int codigoUsuario = (Integer) session.getAttribute("codigoUsuario");

        switch (acaoDivida) {
            case "cadastrar":
                cadastrarDivida(req, resp, codigoUsuario);
                break;
            case "editar":
                editarDivida(req, resp);
                break;
            case "excluir":
                excluirDivida(req, resp);
                break;
            case "atualizarPagamento":
                atualizarPagamento(req, resp);
                break;
        }
    }

    private void cadastrarDivida(HttpServletRequest req, HttpServletResponse resp, int codigoUsuario)
            throws ServletException, IOException {
        try {
            double valorDivida = Double.parseDouble(req.getParameter("valorDivida"));
            LocalDate dataPagamento = LocalDate.parse(req.getParameter("dataPagamento"));
            double juros = Double.parseDouble(req.getParameter("juros"));
            LocalDate dataDivida = LocalDate.parse(req.getParameter("dataDivida"));
            Divida divida = new Divida(
                    0,
                    codigoUsuario,
                    valorDivida,
                    dataPagamento,
                    juros,
                    dataDivida
            );

            dao.cadastrarDivida(divida);

            req.setAttribute("mensagem", "Divida cadastrada!");
            List<Divida> dividas = dao.getAllDivida(codigoUsuario);
            req.setAttribute("dividas", dividas);

        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao cadastrar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        req.getRequestDispatcher("/resources/pages/Dividas.jsp").forward(req, resp);
    }

    // Novo método para atualizar o status de pagamento da dívida
    private void atualizarPagamento(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int codigoDivida = Integer.parseInt(req.getParameter("codigoPagamento"));
            String statusPagamento = req.getParameter("statusPagamento");

            String novoStatus = "F"; // Default: não paga
            if (statusPagamento.equals("T")) {
                novoStatus = "F"; // Inverte o status
            } else {
                novoStatus = "T"; // Inverte o status
            }

            // Atualizar o status de pagamento da dívida no DAO
            Divida divida = new Divida(codigoDivida, novoStatus); // Passando o novo status
            dao.atualizarStatusPagamento(divida); // Usar o método correto do DAO

            req.setAttribute("mensagem", "Status da dívida atualizado!");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar o status da dívida.");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar o status da dívida.");
        }
        listarDivida(req, resp);
    }

    private void editarDivida(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int codigoDivida = Integer.parseInt(req.getParameter("codigoDivida"));
            double valorDivida = Double.parseDouble(req.getParameter("valorDivida"));
            LocalDate dataPagamento = LocalDate.parse(req.getParameter("dataPagamento"));
            double juros = Double.parseDouble(req.getParameter("juros"));
            LocalDate dataDivida = LocalDate.parse(req.getParameter("dataDivida"));

            Divida divida = new Divida(
                    codigoDivida,
                    valorDivida,
                    dataPagamento,
                    juros,
                    dataDivida
            );

            dao.atualizarDivida(divida);

            req.setAttribute("mensagem", "Divida atualizada!");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        listarDivida(req, resp);
    }

    private void excluirDivida(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int codigoDivida = Integer.parseInt(req.getParameter("codigoExcluir"));
        try {
            dao.removerDivida(codigoDivida);
            req.setAttribute("mensagem", "Ganho removido!");
        } catch (DBException e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        }
        listarDivida(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        listarDivida(req, resp);
    }

    private void listarDivida(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obter o código do usuário da sessão
        HttpSession session = req.getSession();
        Integer codigoUsuario = (Integer) session.getAttribute("codigoUsuario");
        Usuario usuarioVerificado = (Usuario) session.getAttribute("usuarioVerificado");

        if (usuarioVerificado == null) {
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Recuperar e exibir os ganhos do usuário logado
        List<Divida> dividas = dao.getAllDivida(codigoUsuario);
        req.setAttribute("dividas", dividas);
        req.getRequestDispatcher("/resources/pages/Dividas.jsp").forward(req, resp);
    }

}