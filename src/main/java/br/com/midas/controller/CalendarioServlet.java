package br.com.midas.controller;

import br.com.midas.dao.CalendarioDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Evento;
import br.com.midas.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/calendario")
public class CalendarioServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(CalendarioServlet.class.getName());
    private CalendarioDao calendarioDao;

    @Override
    public void init() throws ServletException {
        calendarioDao = DaoFactory.getCalendarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int codigoUsuario = (Integer) session.getAttribute("codigoUsuario");
        Usuario usuarioVerificado = (Usuario) session.getAttribute("usuarioVerificado");

        if (usuarioVerificado == null) {
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int anoAtual = LocalDate.now().getYear();
        int mesAtual = LocalDate.now().getMonthValue();

        // Define ano e mês padrão
        int ano = anoAtual;
        int mes = mesAtual;

        // Pega parâmetros de ano e mês, se disponíveis
        if (req.getParameter("ano") != null) {
            ano = Integer.parseInt(req.getParameter("ano"));
        }
        if (req.getParameter("mes") != null) {
            mes = Integer.parseInt(req.getParameter("mes"));
        }

        try {
            // Busca todos os eventos do mês e ano especificados para o usuário
            List<Evento> eventos = calendarioDao.getEventosPorMesEAno(codigoUsuario, ano, mes);

            // Agrupa os eventos por dia
            Map<Integer, List<Evento>> eventosPorDia = new HashMap<>();
            for (Evento evento : eventos) {
                int dia = evento.getData().getDayOfMonth();
                eventosPorDia.computeIfAbsent(dia, k -> new ArrayList<>()).add(evento);
            }

            // Cria uma lista para representar os dias do mês
            List<Map<String, Object>> diasDoMes = new ArrayList<>();
            int totalDias = LocalDate.of(ano, mes, 1).lengthOfMonth();
            for (int dia = 1; dia <= totalDias; dia++) {
                Map<String, Object> diaData = new HashMap<>();
                diaData.put("numero", dia);
                diaData.put("eventos", eventosPorDia.getOrDefault(dia, new ArrayList<>()));
                diasDoMes.add(diaData);
            }

            // Resgata ano do primeiro evento registrado pelo usuário
            int anoPrimeiroEvento = calendarioDao.getAnoPrimeiroEvento(codigoUsuario);
            logger.log(Level.INFO, "Ano do primeiro evento: " + anoPrimeiroEvento);

            // Atribui atributos para a JSP
            req.setAttribute("diasDoMes", diasDoMes);
            req.setAttribute("ano", ano);
            req.setAttribute("mes", mes);
            req.setAttribute("anoPrimeiroEvento", anoPrimeiroEvento);
            req.setAttribute("anoAtual", anoAtual);

            logger.log(Level.INFO, "Eventos para o mês {0}/{1} carregados com sucesso.", new Object[]{mes, ano});
            req.getRequestDispatcher("/resources/pages/calendario.jsp").forward(req, resp);
        } catch (DBException e) {
            logger.log(Level.SEVERE, "Erro ao carregar eventos para o mês {0}/{1}.", new Object[]{mes, ano});
            req.setAttribute("erro", "Erro ao carregar eventos do calendário.");
            req.getRequestDispatcher("/resources/pages/calendario.jsp").forward(req, resp);
        }
    }
}
