package br.com.midas.controller;

import br.com.midas.dao.GanhoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Ganho;
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

@WebServlet("/ganhos")
public class GanhoServlet extends HttpServlet {

    private GanhoDao dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = DaoFactory.getGanhoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String acaoGanho = req.getParameter("acaoGanho");

        HttpSession session = req.getSession();
        Usuario usuarioVerificado = (Usuario) session.getAttribute("usuarioVerificado");
        int codigoUsuario = usuarioVerificado.getCodigoUsuario();

        switch (acaoGanho) {
            case "cadastrar":
                cadastrarGanho(req, resp, codigoUsuario);
                break;
            case "editar":
                editarGanho(req, resp);
                break;
            case "excluir":
                excluirGanho(req, resp);
                break;
        }
    }

    private void cadastrarGanho(HttpServletRequest req, HttpServletResponse resp, int codigoUsuario)
            throws ServletException, IOException {
        try {
            double valorGanho = Double.parseDouble(req.getParameter("valorGanho"));
            LocalDate dataGanho = LocalDate.parse(req.getParameter("dataGanho"));
            String descricaoGanho = req.getParameter("descricaoGanho");

            Ganho ganho = new Ganho(
                    0,
                    codigoUsuario,
                    valorGanho,
                    dataGanho,
                    descricaoGanho
            );

            dao.cadastrarGanho(ganho);

            req.setAttribute("mensagem", "Ganho cadastrado!");
            List<Ganho> ganhos = dao.getAllGanho(codigoUsuario);
            req.setAttribute("ganhos", ganhos); // Corrija para "ganhos"

        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao cadastrar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        req.getRequestDispatcher("/resources/pages/Ganhos.jsp").forward(req, resp);
    }

    private void editarGanho(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int codigoGanho = Integer.parseInt(req.getParameter("codigoGanho"));
            double valorGanho = Double.parseDouble(req.getParameter("valorGanho"));
            LocalDate dataGanho = LocalDate.parse(req.getParameter("dataGanho"));
            String descricaoGanho = req.getParameter("descricaoGanho");

            Ganho ganho = new Ganho(
                    codigoGanho,
                    valorGanho,
                    dataGanho,
                    descricaoGanho
            );

            dao.atualizarGanho(ganho);

            req.setAttribute("mensagem", "Ganho atualizado!");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        listarGanho(req, resp);
    }

    private void excluirGanho(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int codigoGanho = Integer.parseInt(req.getParameter("codigoExcluir"));
        try {
            dao.removerGanho(codigoGanho);
            req.setAttribute("mensagem", "Ganho removido!");
        } catch (DBException e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        }
        listarGanho(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        listarGanho(req, resp);
    }

    private void listarGanho(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        List<Ganho> ganhos = dao.getAllGanho(codigoUsuario);
        req.setAttribute("ganhos", ganhos);
        req.getRequestDispatcher("/resources/pages/Ganhos.jsp").forward(req, resp);
    }

}