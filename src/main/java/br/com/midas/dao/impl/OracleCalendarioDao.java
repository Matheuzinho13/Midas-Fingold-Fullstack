package br.com.midas.dao.impl;

import br.com.midas.dao.CalendarioDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;
import br.com.midas.model.Evento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OracleCalendarioDao implements CalendarioDao {

    private static final Logger logger = Logger.getLogger(OracleCalendarioDao.class.getName());

    private Connection getConnection() throws SQLException {
        return ConnectionFactory.getInstance().getConnection();
    }

    @Override
    public List<Evento> getEventosPorMesEAno(int userId, int ano, int mes) throws DBException {
        List<Evento> eventos = new ArrayList<>();
        String sql = "SELECT * FROM (" +
                "    SELECT 'Dívida' AS TIPO, VL_DIVIDA AS VALOR, DT_PAGAMENTO AS DATA FROM T_MSF_DIVIDAS WHERE CD_USUARIO = ? AND EXTRACT(YEAR FROM DT_PAGAMENTO) = ? AND EXTRACT(MONTH FROM DT_PAGAMENTO) = ? " +
                "    UNION ALL " +
                "    SELECT 'Ganho', VL_GANHO, DT_GANHO FROM T_MSF_GANHOS WHERE CD_USUARIO = ? AND EXTRACT(YEAR FROM DT_GANHO) = ? AND EXTRACT(MONTH FROM DT_GANHO) = ? " +
                "    UNION ALL " +
                "    SELECT 'Gasto', VL_GASTO, DT_GASTO FROM T_MSF_GASTOS WHERE CD_USUARIO = ? AND EXTRACT(YEAR FROM DT_GASTO) = ? AND EXTRACT(MONTH FROM DT_GASTO) = ? " +
                "    UNION ALL " +
                "    SELECT 'Investimento', VL_APLICACAO, DT_INVESTIMENTO FROM T_MSF_INVESTIMENTOS WHERE CD_USUARIO = ? AND EXTRACT(YEAR FROM DT_INVESTIMENTO) = ? AND EXTRACT(MONTH FROM DT_INVESTIMENTO) = ? " +
                "    UNION ALL " +
                "    SELECT 'Objetivo', VL_OBJETIVO, DT_OBJETIVO FROM T_MSF_OBJETIVOS WHERE CD_USUARIO = ? AND EXTRACT(YEAR FROM DT_OBJETIVO) = ? AND EXTRACT(MONTH FROM DT_OBJETIVO) = ? " +
                ") ORDER BY DATA";

        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {

            int index = 1;
            for (int i = 0; i < 5; i++) {
                stmt.setInt(index++, userId);
                stmt.setInt(index++, ano);
                stmt.setInt(index++, mes);
            }

            logger.log(Level.INFO, "Executando query para obter eventos do mês {0} e ano {1} para o usuário {2}. SQL: {3}", new Object[]{mes, ano, userId, sql});

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String tipo = rs.getString("TIPO");
                    double valor = rs.getDouble("VALOR");
                    java.sql.Date data = rs.getDate("DATA");

                    Evento evento = new Evento(tipo, valor, data.toLocalDate());
                    eventos.add(evento);
                    logger.log(Level.INFO, "Evento adicionado: {0}", evento);
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao obter eventos para o mês {0} e ano {1} para o usuário {2}.", new Object[]{mes, ano, userId});
            throw new DBException("Erro ao obter eventos do calendário.", e);
        }

        logger.log(Level.INFO, "Total de eventos encontrados: {0}", eventos.size());
        return eventos;
    }

    @Override
    public int getAnoPrimeiroEvento(int userId) throws DBException {
        String sql = "SELECT MIN(EXTRACT(YEAR FROM DT_EVENTO)) AS ano_min FROM (" +
                "SELECT DT_PAGAMENTO AS DT_EVENTO FROM T_MSF_DIVIDAS WHERE CD_USUARIO = ? UNION ALL " +
                "SELECT DT_GANHO FROM T_MSF_GANHOS WHERE CD_USUARIO = ? UNION ALL " +
                "SELECT DT_GASTO FROM T_MSF_GASTOS WHERE CD_USUARIO = ? UNION ALL " +
                "SELECT DT_INVESTIMENTO FROM T_MSF_INVESTIMENTOS WHERE CD_USUARIO = ? UNION ALL " +
                "SELECT DT_OBJETIVO FROM T_MSF_OBJETIVOS WHERE CD_USUARIO = ?)";

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            for (int i = 1; i <= 5; i++) {
                stmt.setInt(i, userId);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("ano_min");
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao buscar o ano do primeiro evento para o usuário {0}.", userId);
            throw new DBException("Erro ao buscar o ano do primeiro evento.");
        }

        return LocalDate.now().getYear();
    }
}
