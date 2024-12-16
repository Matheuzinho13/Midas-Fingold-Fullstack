package br.com.midas.dao.impl;

import br.com.midas.dao.GastoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;
import br.com.midas.model.Gasto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OracleGastoDao implements GastoDao {

    private Connection conexao;
    private static final Logger logger = Logger.getLogger(OracleGastoDao.class.getName());

    @Override
    public void cadastrarGasto(Gasto gasto) throws DBException {
        PreparedStatement stmt = null;

        String sql = "INSERT INTO T_MSF_GASTOS (cd_usuario, vl_gasto, dt_gasto, categoria, ds_gasto) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, gasto.getCdUsuario());
            stmt.setDouble(2, gasto.getValorGasto());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataGastoFormatada = gasto.getDataGasto().format(formatter);
            stmt.setString(3, dataGastoFormatada);
            stmt.setString(4, gasto.getCategoria());
            stmt.setString(5, gasto.getDescricaoGasto());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar.");
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
    public List<Gasto> getAllGasto(int codigoUsuario){
        PreparedStatement stmt = null;
        List<Gasto> gastos = new ArrayList<>();
        ResultSet resultadoGasto = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "SELECT * FROM T_MSF_GASTOS WHERE cd_usuario = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoUsuario);
            resultadoGasto = stmt.executeQuery();

            while (resultadoGasto.next()) {
                int codigoGasto = resultadoGasto.getInt("cd_gasto");
                double valorGasto = resultadoGasto.getDouble("vl_gasto");
                // Convertendo String para LocalDate
                LocalDate dataGasto = LocalDate.parse(resultadoGasto.getString("dt_gasto"),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                String categoria = resultadoGasto.getString("categoria");
                String descricaoGasto = resultadoGasto.getString("ds_gasto");

                Gasto gasto = new Gasto(codigoGasto, codigoUsuario, valorGasto, dataGasto, categoria,
                        descricaoGasto);
                gastos.add(gasto);
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
        return gastos;
    }

    @Override
    public void atualizarGasto(Gasto gasto) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();

            String sql = "UPDATE T_MSF_GASTOS SET " +
                    "vl_gasto = ?, " +
                    "dt_gasto = ?, " +
                    "categoria = ?, " +
                    "ds_gasto = ? " +
                    "WHERE cd_gasto = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setDouble(1, gasto.getValorGasto());

            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataGastoFormatada = gasto.getDataGasto().format(formatter);
            stmt.setString(2, dataGastoFormatada);
            stmt.setString(3, gasto.getCategoria());
            stmt.setString(4, gasto.getDescricaoGasto());
            stmt.setInt(5, gasto.getCodigoGasto());

            logger.log(Level.INFO, "SQL Executado: {0} com parâmetros: {1}, {2}, {3}, {4}, {5}",
                    new Object[]{sql, gasto.getValorGasto(), dataGastoFormatada, gasto.getCategoria(), gasto.getDescricaoGasto(), gasto.getCodigoGasto()});

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated == 0) {
                logger.log(Level.WARNING, "Nenhum gasto foi atualizado. Código de gasto: {0}", gasto.getCodigoGasto());
            } else {
                logger.log(Level.INFO, "Gasto atualizado com sucesso: Código de gasto: {0}", gasto.getCodigoGasto());
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao atualizar gasto no banco de dados", e);
            throw new DBException("Erro ao atualizar.");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



    @Override
    public void removerGasto(int codigoGasto) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "DELETE FROM T_MSF_GASTOS WHERE cd_gasto = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoGasto);
            stmt.executeUpdate();
            System.out.println("Gasto removido.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao remover.");
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