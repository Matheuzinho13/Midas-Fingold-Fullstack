package br.com.midas.controller;

import br.com.midas.dao.DashboardDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Usuario;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(DashboardServlet.class.getName());
    private DashboardDao dashboardDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            dashboardDao = DaoFactory.getDashboardDAO();
            logger.log(Level.INFO, "Dashboard DAO inicializado com sucesso.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Falha ao inicializar o Dashboard DAO.", e);
            throw new ServletException("Erro ao inicializar o Dashboard DAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuarioVerificado = (Usuario) session.getAttribute("usuarioVerificado");

        if (usuarioVerificado == null) {
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            carregarDadosDashboard(req, usuarioVerificado);
            req.getRequestDispatcher("/resources/pages/dashboard.jsp").forward(req, resp);
        } catch (DBException e) {
            logger.log(Level.SEVERE, "Erro ao carregar os dados do dashboard para o usuário: " + usuarioVerificado.getCodigoUsuario(), e);
            req.setAttribute("erro", "Erro ao carregar os dados do dashboard.");
            req.getRequestDispatcher("/resources/pages/dashboard.jsp").forward(req, resp);
        }
    }

    private void carregarDadosDashboard(HttpServletRequest req, Usuario usuario) throws DBException {
        int codigoUsuario = usuario.getCodigoUsuario();

        try {
            String nomeUsuario = dashboardDao.getNomeUsuario(codigoUsuario);
            double totalGanhos = dashboardDao.getTotalGanhos(codigoUsuario);
            double totalGastos = dashboardDao.getTotalGastos(codigoUsuario);
            double saldoAtual = totalGanhos - totalGastos;
            double totalInvestido = dashboardDao.getTotalInvestido(codigoUsuario);
            Map<String, Double> investimentosPorTipo = dashboardDao.getValorInvestidoPorTipo(codigoUsuario);
            Map<String, Object> ultimoGasto = dashboardDao.getUltimoGasto(codigoUsuario);
            List<Map<String, Object>> detalhesDividas = dashboardDao.getDetalhesDividas(codigoUsuario);
            double totalDividas = dashboardDao.getTotalDividas(codigoUsuario);

            // Buscar os objetivos do usuário para calcular a porcentagem
            List<Map<String, Object>> objetivos = dashboardDao.getDetalhesObjetivos(codigoUsuario);

            // Calcular a porcentagem de objetivos concluídos
            int objetivosConcluidos = 0;
            for (Map<String, Object> objetivo : objetivos) {
                if (objetivo.get("ds_concluido").equals("T")) {
                    objetivosConcluidos++;
                }
            }
            int porcentagemObjetivosConcluidos = 0;
            if (objetivos.size() > 0) {
                porcentagemObjetivosConcluidos = (objetivosConcluidos * 100) / objetivos.size();
            }

            req.setAttribute("nomeUsuario", nomeUsuario);
            req.setAttribute("totalGanhos", totalGanhos);
            req.setAttribute("totalGastos", totalGastos);
            req.setAttribute("saldoAtual", saldoAtual);
            req.setAttribute("ultimoGasto", ultimoGasto);
            req.setAttribute("totalInvestido", totalInvestido);
            req.setAttribute("investimentosPorTipo", investimentosPorTipo);
            req.setAttribute("detalhesDividas", detalhesDividas);
            req.setAttribute("totalDividas", totalDividas);
            req.setAttribute("porcentagemObjetivosConcluidos", porcentagemObjetivosConcluidos); // Adicione o atributo

        } catch (DBException e) {
            logger.log(Level.SEVERE, "Erro ao carregar os dados do dashboard para o usuário: " + codigoUsuario, e);
            throw new DBException("Erro ao carregar dados do dashboard para o usuário: " + codigoUsuario, e);
        }
    }
}