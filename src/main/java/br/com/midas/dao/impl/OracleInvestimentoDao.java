package br.com.midas.dao.impl;

import br.com.midas.dao.InvestimentoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;
import br.com.midas.model.Investimento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OracleInvestimentoDao implements InvestimentoDao {

    private Connection conexao;

    @Override
    public void cadastrarInvestimento(Investimento investimento) throws DBException {
        PreparedStatement stmt = null;

        String sql = "INSERT INTO T_MSF_INVESTIMENTOS " +
                "(cd_usuario, tipo_investimento, nm_aplicacao, nm_banco, vl_aplicacao, dt_investimento, dt_vencimento) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, investimento.getCdUsuario());
            stmt.setString(2, investimento.getTipoInvestimento());
            stmt.setString(3, investimento.getNomeAplicacao());
            stmt.setString(4, investimento.getNomeBanco());
            stmt.setDouble(5, investimento.getValorAplicacao());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataInvestimentoFormatada = investimento.getDataInvestimento().format(formatter);
            stmt.setString(6, dataInvestimentoFormatada);
            String dataVencimentoFormatada = investimento.getDataVencimento().format(formatter);
            stmt.setString(7, dataVencimentoFormatada);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar investimento.");
        } finally {
            try {
                stmt.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Investimento> getAllInvestimento(int codigoUsuario) {
        PreparedStatement stmt = null;
        List<Investimento> investimentos = new ArrayList<>();
        ResultSet resultadoInvestimento = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "SELECT * FROM T_MSF_INVESTIMENTOS WHERE cd_usuario = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoUsuario);
            resultadoInvestimento = stmt.executeQuery();

            while (resultadoInvestimento.next()) {
                int codigoInvestimento = resultadoInvestimento.getInt("CD_INVESTIMENTO");
                String tipoInvestimento = resultadoInvestimento.getString("TIPO_INVESTIMENTO");
                String nomeAplicacao = resultadoInvestimento.getString("NM_APLICACAO");
                String nomeBanco = resultadoInvestimento.getString("NM_BANCO");
                double valorAplicacao = resultadoInvestimento.getDouble("VL_APLICACAO");
                // Convertendo String para LocalDate
                LocalDate dataInvestimento = LocalDate.parse(resultadoInvestimento.getString("DT_INVESTIMENTO"),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                LocalDate dataVencimento = LocalDate.parse(resultadoInvestimento.getString("DT_VENCIMENTO"),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                Investimento investimento = new Investimento(codigoInvestimento, codigoUsuario, tipoInvestimento, nomeAplicacao,
                        nomeBanco, valorAplicacao, dataInvestimento, dataVencimento);
                investimentos.add(investimento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                stmt.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return investimentos;
    }

    @Override
    public void atualizarInvestimento(Investimento investimento) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();

            String sql = "UPDATE T_MSF_INVESTIMENTOS SET " +
                    "TIPO_INVESTIMENTO = ?, " +
                    "NM_INVESTIMENTO = ?, " +
                    "NM_INSTITUICAO = ?, " +
                    "VL_APLICACAO = ?, " +
                    "DT_INVESTIMENTO = ?, " +
                    "DT_VENCIMENTO = ? " +
                    "WHERE CD_INVESTIMENTO = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, investimento.getTipoInvestimento());
            stmt.setString(2, investimento.getNomeAplicacao());
            stmt.setString(3, investimento.getNomeBanco());
            stmt.setDouble(4, investimento.getValorAplicacao());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataInvestimentoFormatada = investimento.getDataInvestimento().format(formatter);
            stmt.setString(5, dataInvestimentoFormatada);
            String dataVencimentoFormatada = investimento.getDataVencimento().format(formatter);
            stmt.setString(6, dataVencimentoFormatada);
            stmt.setLong(7, investimento.getCodigoInvestimento());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao atualizar investimento.");
        } finally {
            try {
                stmt.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void removerInvestimento(int codigoInvestimento) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "DELETE FROM T_MSF_INVESTIMENTOS WHERE CD_INVESTIMENTO = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoInvestimento);
            stmt.executeUpdate();
            System.out.println("Investimento removido.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao remover investimento.");
        } finally {
            try {
                stmt.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void fecharConexao() throws SQLException {
        conexao.close();
    }
}