package br.com.midas.dao.impl;

import br.com.midas.dao.DashboardDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OracleDashboardDao implements DashboardDao {

    private static final Logger logger = Logger.getLogger(OracleDashboardDao.class.getName());

    private Connection getConnection() throws SQLException {
        return ConnectionFactory.getInstance().getConnection();
    }

    @Override
    public double getTotalGanhos(int codigoUsuario) throws DBException {
        return executarConsultaSoma("SELECT SUM(vl_ganho) AS total FROM T_MSF_GANHOS WHERE cd_usuario = ?", codigoUsuario);
    }

    @Override
    public double getTotalGastos(int codigoUsuario) throws DBException {
        return executarConsultaSoma("SELECT SUM(vl_gasto) AS total FROM T_MSF_GASTOS WHERE cd_usuario = ?", codigoUsuario);
    }

    @Override
    public String getNomeUsuario(int codigoUsuario) throws DBException {
        String sql = "SELECT NM_USUARIO FROM T_MSF_USUARIO WHERE CD_USUARIO = ?";
        return executarConsultaSimplesString(sql, codigoUsuario);
    }

    @Override
    public double getTotalInvestido(int codigoUsuario) throws DBException {
        String sql = "SELECT NVL(SUM(VL_APLICACAO), 0) AS total FROM T_MSF_INVESTIMENTOS WHERE CD_USUARIO = ?";
        return executarConsultaSimplesDouble(sql, codigoUsuario, "total");
    }

    @Override
    public Map<String, Double> getValorInvestidoPorTipo(int codigoUsuario) throws DBException {
        String sql = "SELECT tipo_investimento, NVL(SUM(vl_aplicacao), 0) AS total_por_tipo FROM T_MSF_INVESTIMENTOS WHERE cd_usuario = ? GROUP BY tipo_investimento";
        return executarConsultaInvestimentoPorTipo(sql, codigoUsuario);
    }

    @Override
    public Map<String, Object> getUltimoGasto(int codigoUsuario) throws DBException {
        String sql = "SELECT vl_gasto, dt_gasto, ds_gasto FROM T_MSF_GASTOS WHERE cd_usuario = ? ORDER BY dt_gasto DESC FETCH FIRST 1 ROWS ONLY";
        return executarConsultaUltimoGasto(sql, codigoUsuario);
    }

    @Override
    public List<Map<String, Object>> getDetalhesDividas(int codigoUsuario) throws DBException {
        String sql = "SELECT dt_pagamento, vl_divida FROM T_MSF_DIVIDAS WHERE cd_usuario = ?";
        return executarConsultaListaDetalhes(sql, codigoUsuario);
    }

    @Override
    public double getTotalDividas(int codigoUsuario) throws DBException {
        String sql = "SELECT NVL(SUM(vl_divida), 0) AS total FROM T_MSF_DIVIDAS WHERE cd_usuario = ?";
        return executarConsultaSoma(sql, codigoUsuario);
    }

    private double executarConsultaSimplesDouble(String sql, int codigoUsuario, String coluna) throws DBException {
        try (Connection conexao = getConnection();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setInt(1, codigoUsuario);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() ? rs.getDouble(coluna) : 0;
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao executar consulta para obter valor em double. SQL: " + sql, e);
            throw new DBException("Erro ao buscar valor.");
        }
    }

    private List<Map<String, Object>> executarConsultaListaDetalhes(String sql, int codigoUsuario) throws DBException {
        List<Map<String, Object>> detalhesList = new ArrayList<>();
        try (Connection conexao = getConnection();
             PreparedStatement stmt = prepararStatement(conexao, sql, codigoUsuario);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> detalhes = new HashMap<>();
                detalhes.put("dt_pagamento", rs.getDate("dt_pagamento"));
                detalhes.put("vl_divida", rs.getDouble("vl_divida"));
                detalhesList.add(detalhes);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao executar a consulta de detalhes para o usuário: " + codigoUsuario, e);
            throw new DBException("Erro ao buscar detalhes de dívidas.");
        }
        return detalhesList;
    }

    private double executarConsultaSoma(String sql, int codigoUsuario) throws DBException {
        try (Connection conexao = getConnection();
             PreparedStatement stmt = prepararStatement(conexao, sql, codigoUsuario);
             ResultSet resultado = stmt.executeQuery()) {

            return resultado.next() ? resultado.getDouble("total") : 0;
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao executar a consulta de soma. SQL: " + sql, e);
            throw new DBException("Erro ao executar a consulta de soma.");
        }
    }

    private String executarConsultaSimplesString(String sql, int codigoUsuario) throws DBException {
        try (Connection conexao = getConnection();
             PreparedStatement stmt = prepararStatement(conexao, sql, codigoUsuario);
             ResultSet rs = stmt.executeQuery()) {

            return rs.next() ? rs.getString("NM_USUARIO") : null;
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao buscar nome do usuário. SQL: " + sql, e);
            throw new DBException("Erro ao buscar nome do usuário.");
        }
    }

    public List<Map<String, Object>> getDetalhesObjetivos(int codigoUsuario) throws DBException {
        String sql = "SELECT * FROM T_MSF_OBJETIVOS WHERE cd_usuario = ?";
        return executarConsultaListaDetalhesObjetivos(sql, codigoUsuario);
    }

    private List<Map<String, Object>> executarConsultaListaDetalhesObjetivos(String sql, int codigoUsuario) throws DBException {
        List<Map<String, Object>> objetivosList = new ArrayList<>();
        try (Connection conexao = getConnection();
             PreparedStatement stmt = prepararStatement(conexao, sql, codigoUsuario);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> objetivo = new HashMap<>();
                objetivo.put("cd_objetivo", rs.getInt("cd_objetivo"));
                objetivo.put("nm_objetivo", rs.getString("nm_objetivo"));
                objetivo.put("vl_objetivo", rs.getDouble("vl_objetivo"));
                objetivo.put("dt_objetivo", rs.getDate("dt_objetivo"));
                objetivo.put("ds_objetivo", rs.getString("ds_objetivo"));
                objetivo.put("ds_concluido", rs.getString("ds_concluido"));
                objetivosList.add(objetivo);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao executar a consulta de detalhes de objetivos para o usuário: " + codigoUsuario, e);
            throw new DBException("Erro ao buscar detalhes de objetivos.");
        }
        return objetivosList;
    }

    private Map<String, Double> executarConsultaInvestimentoPorTipo(String sql, int codigoUsuario) throws DBException {
        Map<String, Double> investimentosPorTipo = new HashMap<>();
        try (Connection conexao = getConnection();
             PreparedStatement stmt = prepararStatement(conexao, sql, codigoUsuario);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                investimentosPorTipo.put(rs.getString("tipo_investimento"), rs.getDouble("total_por_tipo"));
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao buscar valor investido por tipo. SQL: " + sql, e);
            throw new DBException("Erro ao buscar valor investido por tipo.");
        }
        return investimentosPorTipo;
    }

    private Map<String, Object> executarConsultaUltimoGasto(String sql, int codigoUsuario) throws DBException {
        Map<String, Object> ultimoGasto = new HashMap<>();
        try (Connection conexao = getConnection();
             PreparedStatement stmt = prepararStatement(conexao, sql, codigoUsuario);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                ultimoGasto.put("valor", rs.getDouble("vl_gasto"));
                ultimoGasto.put("data", rs.getDate("dt_gasto"));
                ultimoGasto.put("descricao", rs.getString("ds_gasto"));
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao buscar último gasto. SQL: " + sql, e);
            throw new DBException("Erro ao buscar último gasto.");
        }
        return ultimoGasto;
    }

    private PreparedStatement prepararStatement(Connection conexao, String sql, int codigoUsuario) throws SQLException {
        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, codigoUsuario);
        return stmt;
    }
}