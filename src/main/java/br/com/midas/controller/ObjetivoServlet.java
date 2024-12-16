package br.com.midas.controller;

import br.com.midas.dao.ObjetivoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Objetivo;
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
import java.util.Arrays;
import java.util.List;

@WebServlet("/objetivos")
public class ObjetivoServlet extends HttpServlet {

    private ObjetivoDao dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = DaoFactory.getObjetivoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String acao = req.getParameter("acao");

        HttpSession session = req.getSession();
        int codigoUsuario = (Integer) session.getAttribute("codigoUsuario");

        switch (acao) {
            case "cadastrar":
                cadastrar(req, resp, codigoUsuario);
                break;
            case "editar":
                editar(req, resp);
                break;
            case "excluir":
                excluir(req, resp);
                break;
            case "concluir":
                concluirObjetivo(req, resp);
                break;
        }
    }

    private void concluirObjetivo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int codigoObjetivo = Integer.parseInt(req.getParameter("codigoConclusao"));
            String statusConclusao = req.getParameter("statusConclusao");

            String novoStatus = "F"; // Default: não concluído
            if (statusConclusao.equals("T")) {
                novoStatus = "F"; // Inverte o status
            } else {
                novoStatus = "T"; // Inverte o status
            }

            // Atualizar o status do objetivo no DAO
            Objetivo objetivo = new Objetivo(codigoObjetivo, novoStatus); // Passando o novo status
            dao.atualizarStatus(objetivo); // Usar o método correto do DAO

            req.setAttribute("mensagem", "Objetivo atualizado!");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar o status do objetivo.");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar o status do objetivo.");
        }
        listar(req, resp);
    }

    private void cadastrar(HttpServletRequest req, HttpServletResponse resp, int codigoUsuario)
            throws ServletException, IOException {
        try {
            String nomeObjetivo = req.getParameter("nomeObjetivo");
            double valorObjetivo = Double.parseDouble(req.getParameter("valorObjetivo"));
            LocalDate dataObjetivo = LocalDate.parse(req.getParameter("dataObjetivo"));
            String descricaoObjetivo = req.getParameter("descricaoObjetivo");

            // Não precisa do codigoObjetivo aqui!
            // String[] concluidos = req.getParameterValues("concluido_" + codigoObjetivo);
            String dsConcluido = "F"; // Default: não concluído

            Objetivo objetivo = new Objetivo(
                    0, // Código do objetivo será gerado automaticamente
                    codigoUsuario,
                    nomeObjetivo,
                    valorObjetivo,
                    dataObjetivo,
                    descricaoObjetivo,
                    dsConcluido
            );

            dao.cadastrar(objetivo);

            req.setAttribute("mensagem", "Objetivo cadastrado!");
            List<Objetivo> objetivos = dao.getAll(codigoUsuario);
            req.setAttribute("objetivos", objetivos);

        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao cadastrar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        req.getRequestDispatcher("/resources/pages/Objetivos.jsp").forward(req, resp);
    }

    private void editar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int codigoObjetivo = Integer.parseInt(req.getParameter("codigo"));
            String nomeObjetivo = req.getParameter("nomeObjetivo");
            double valorObjetivo = Double.parseDouble(req.getParameter("valorObjetivo"));
            LocalDate dataObjetivo = LocalDate.parse(req.getParameter("dataObjetivo"));
            String descricaoObjetivo = req.getParameter("descricaoObjetivo");

            // Obter o status do checkbox
            String[] concluidos = req.getParameterValues("concluido_" + codigoObjetivo);
            String dsConcluido = "F"; // Default: não concluído
            if (concluidos != null && Arrays.asList(concluidos).contains(String.valueOf(codigoObjetivo))) {
                dsConcluido = "T"; // Concluído
            }

            Objetivo objetivo = new Objetivo(
                    codigoObjetivo,
                    nomeObjetivo,
                    valorObjetivo,
                    dataObjetivo,
                    descricaoObjetivo,
                    dsConcluido
            );

            dao.editarObjetivo(objetivo); // Usar o método correto do DAO

            req.setAttribute("mensagem", "Objetivo atualizado!");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Por favor, valide os dados");
        }
        listar(req, resp);
    }

    private void excluir(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int codigoObjetivo = Integer.parseInt(req.getParameter("codigoExcluir"));
        try {
            dao.remover(codigoObjetivo);
            req.setAttribute("mensagem", "Produto removido!");
        } catch (DBException e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar");
        }
        listar(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        listar(req, resp);
    }

    private void listar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer codigoUsuario = (Integer) session.getAttribute("codigoUsuario");
        Usuario usuarioVerificado = (Usuario) session.getAttribute("usuarioVerificado");

        if (usuarioVerificado == null) {
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<Objetivo> objetivos = dao.getAll(codigoUsuario);
        req.setAttribute("objetivos", objetivos);

        // Calcular a porcentagem de objetivos concluídos
        int objetivosConcluidos = 0;
        for (Objetivo objetivo : objetivos) {
            if (objetivo.getDsConcluido().equals("T")) {
                objetivosConcluidos++;
            }
        }
        int porcentagemObjetivos = 0;
        if (objetivos.size() > 0) {
            porcentagemObjetivos = (objetivosConcluidos * 100) / objetivos.size();
        }
        req.setAttribute("porcentagemObjetivos", porcentagemObjetivos);

        req.getRequestDispatcher("/resources/pages/Objetivos.jsp").forward(req, resp);
    }
}