package br.com.midas.controller;

import br.com.midas.dao.InvestimentoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Investimento;
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

@WebServlet("/investimentos")
public class InvestimentoServlet extends HttpServlet {

    private InvestimentoDao dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = DaoFactory.getInvestimentoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String acaoInvestimento = req.getParameter("acaoInvestimento");

        HttpSession session = req.getSession();
        int codigoUsuario = (Integer) session.getAttribute("codigoUsuario");

        switch (acaoInvestimento) {
            case "cadastrar":
                cadastrarInvestimento(req, resp, codigoUsuario);
                break;
            case "editar":
                editarInvestimento(req, resp);
                break;
            case "excluir":
                excluirInvestimento(req, resp);
                break;
        }
    }

    private void cadastrarInvestimento(HttpServletRequest req, HttpServletResponse resp, int codigoUsuario)
            throws ServletException, IOException {
        try {
            String tipoInvestimento = req.getParameter("tipoInvestimento");
            String nomeAplicacao = req.getParameter("nomeAplicacao");
            String nomeBanco = req.getParameter("nomeBanco");
            double valorAplicacao = Double.parseDouble(req.getParameter("valorAplicacao"));
            LocalDate dataInvestimento = LocalDate.parse(req.getParameter("dataInvestimento"));
            LocalDate dataVencimento = LocalDate.parse(req.getParameter("dataVencimento"));


            Investimento investimento = new Investimento(
                    0,
                    codigoUsuario,
                    tipoInvestimento,
                    nomeAplicacao,
                    nomeBanco,
                    valorAplicacao,
                    dataInvestimento,
                    dataVencimento
            );

            dao.cadastrarInvestimento(investimento);

            req.setAttribute("mensagem", "Investimento cadastrado!");
            List<Investimento> investimentos = dao.getAllInvestimento(codigoUsuario);
            req.setAttribute("investimentos", investimentos);

        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao cadastrar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        req.getRequestDispatcher("/resources/pages/investimento.jsp").forward(req, resp);
    }

    private void editarInvestimento(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int codigoInvestimento = Integer.parseInt(req.getParameter("codigoInvestimento"));
            String tipoInvestimento = req.getParameter("tipoInvestimento");
            String nomeAplicacao = req.getParameter("nomeAplicacao");
            String nomeBanco = req.getParameter("nomeBanco");
            double valorAplicacao = Double.parseDouble(req.getParameter("valorAplicacao"));
            LocalDate dataInvestimento = LocalDate.parse(req.getParameter("dataInvestimento"));
            LocalDate dataVencimento = LocalDate.parse(req.getParameter("dataVencimento"));


            Investimento investimento = new Investimento(
                    codigoInvestimento,
                    tipoInvestimento,
                    nomeAplicacao,
                    nomeBanco,
                    valorAplicacao,
                    dataInvestimento,
                    dataVencimento
            );

            dao.atualizarInvestimento(investimento);

            req.setAttribute("mensagem", "Investimento atualizado!");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        listarInvestimento(req, resp);
    }

    private void excluirInvestimento(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int codigoInvestimento = Integer.parseInt(req.getParameter("codigoExcluir"));
        try {
            dao.removerInvestimento(codigoInvestimento);
            req.setAttribute("mensagem", "Investimento removido!");
        } catch (DBException e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        }
        listarInvestimento(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        listarInvestimento(req, resp);
    }

    private void listarInvestimento(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer codigoUsuario = (Integer) session.getAttribute("codigoUsuario");
        Usuario usuarioVerificado = (Usuario) session.getAttribute("usuarioVerificado");

        if (usuarioVerificado == null) {
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<Investimento> investimentos = dao.getAllInvestimento(codigoUsuario);
        req.setAttribute("investimentos", investimentos);
        req.getRequestDispatcher("/resources/pages/investimento.jsp").forward(req, resp);
    }
}