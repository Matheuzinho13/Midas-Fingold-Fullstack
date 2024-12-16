package br.com.midas.controller;

import br.com.midas.dao.GastoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Gasto;
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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/gastos")
public class GastoServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(GastoServlet.class.getName());
    private GastoDao dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = DaoFactory.getGastoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String acaoGasto = req.getParameter("acaoGasto");
        HttpSession session = req.getSession();
        int codigoUsuario = (Integer) session.getAttribute("codigoUsuario");

        logger.log(Level.INFO, "Ação do Gasto recebida: {0} para o usuário {1}", new Object[]{acaoGasto, codigoUsuario});

        switch (acaoGasto) {
            case "cadastrar":
                cadastrarGasto(req, resp, codigoUsuario);
                break;
            case "editar":
                editarGasto(req, resp);
                break;
            case "excluir":
                excluirGasto(req, resp);
                break;
            default:
                logger.log(Level.WARNING, "Ação desconhecida: {0}", acaoGasto);
                resp.sendRedirect("gastos");
        }
    }

    private void cadastrarGasto(HttpServletRequest req, HttpServletResponse resp, int codigoUsuario) throws ServletException, IOException {
        try {
            double valorGasto = Double.parseDouble(req.getParameter("valorGasto"));
            LocalDate dataGasto = LocalDate.parse(req.getParameter("dataGasto"));
            String categoria = req.getParameter("categoria");
            String descricaoGasto = req.getParameter("descricaoGasto");

            Gasto gasto = new Gasto(0, codigoUsuario, valorGasto, dataGasto, categoria, descricaoGasto);

            dao.cadastrarGasto(gasto);
            req.setAttribute("mensagem", "Gasto cadastrado!");
            logger.log(Level.INFO, "Gasto cadastrado: {0}", gasto);

            List<Gasto> gastos = dao.getAllGasto(codigoUsuario);
            req.setAttribute("gastos", gastos);
        } catch (DBException db) {
            logger.log(Level.SEVERE, "Erro ao cadastrar gasto", db);
            req.setAttribute("erro", "Erro ao cadastrar");
        } catch (Exception e) {
            logger.log(Level.WARNING, "Dados inválidos ao cadastrar gasto", e);
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        req.getRequestDispatcher("/resources/pages/Gastos.jsp").forward(req, resp);
    }

    private void editarGasto(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int codigoGasto = Integer.parseInt(req.getParameter("codigoGasto"));
            double valorGasto = Double.parseDouble(req.getParameter("valorGasto"));
            LocalDate dataGasto = LocalDate.parse(req.getParameter("dataGasto"));
            String categoria = req.getParameter("categoria");
            String descricaoGasto = req.getParameter("descricaoGasto");

            Gasto gasto = new Gasto();
            gasto.setCodigoGasto(codigoGasto);
            gasto.setValorGasto(valorGasto);
            gasto.setDataGasto(dataGasto);
            gasto.setCategoria(categoria);
            gasto.setDescricaoGasto(descricaoGasto);

            // Log para verificar o objeto Gasto antes de enviar para o DAO
            logger.log(Level.INFO, "Gasto a ser atualizado: {0}", gasto);

            dao.atualizarGasto(gasto);

            req.setAttribute("mensagem", "Gasto atualizado!");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        listarGasto(req, resp);
    }

    private void excluirGasto(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int codigoGasto = Integer.parseInt(req.getParameter("codigoExcluir"));
        try {
            dao.removerGasto(codigoGasto);
            req.setAttribute("mensagem", "Gasto removido!");
            logger.log(Level.INFO, "Gasto removido com sucesso. Código: {0}", codigoGasto);
        } catch (DBException e) {
            logger.log(Level.SEVERE, "Erro ao remover gasto", e);
            req.setAttribute("erro", "Erro ao atualizar");
        }
        listarGasto(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        listarGasto(req, resp);
    }

    private void listarGasto(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer codigoUsuario = (Integer) session.getAttribute("codigoUsuario");
        Usuario usuarioVerificado = (Usuario) session.getAttribute("usuarioVerificado");

        if (usuarioVerificado == null) {
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<Gasto> gastos = dao.getAllGasto(codigoUsuario);
        req.setAttribute("gastos", gastos);
        req.getRequestDispatcher("/resources/pages/Gastos.jsp").forward(req, resp);
    }
}