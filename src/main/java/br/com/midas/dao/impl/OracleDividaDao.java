package br.com.midas.dao.impl;

import br.com.midas.dao.DividaDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;
import br.com.midas.model.Divida;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OracleDividaDao implements DividaDao {

    private Connection conexao;

    @Override
    public void cadastrarDivida(Divida divida) throws DBException {
        PreparedStatement stmt = null;

        String sql = "INSERT INTO T_MSF_DIVIDAS (cd_usuario, vl_divida, dt_pagamento, vl_juros, dt_divida) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, divida.getCdUsuario());
            stmt.setDouble(2, divida.getValorDivida());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataPgmtFormatada = divida.getDataPagamento().format(formatter);
            stmt.setString(3, dataPgmtFormatada);
            stmt.setDouble(4, divida.getJuros());
            DateTimeFormatter formatterr = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataDividaFormatada = divida.getDataDivida().format(formatterr);
            stmt.setString(5, dataDividaFormatada);
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
    public List<Divida> getAllDivida(int codigoUsuario) {
        PreparedStatement stmt = null;
        List<Divida> dividas = new ArrayList<>();
        ResultSet resultadoDivida = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "SELECT * FROM T_MSF_DIVIDAS WHERE cd_usuario = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoUsuario);
            resultadoDivida = stmt.executeQuery();

            while (resultadoDivida.next()) {
                int codigoDivida = resultadoDivida.getInt("cd_divida");
                double valorDivida = resultadoDivida.getDouble("vl_divida");
                LocalDate dataPagamento = LocalDate.parse(resultadoDivida.getString("dt_pagamento"),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                double juros = resultadoDivida.getDouble("vl_juros");
                LocalDate dataDivida = LocalDate.parse(resultadoDivida.getString("dt_divida"),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                Divida divida = new Divida(codigoDivida, codigoUsuario, valorDivida, dataPagamento, juros, dataDivida);
                dividas.add(divida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return dividas;
    }

    @Override
    public void atualizarStatusPagamento(Divida divida) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();

            String sql = "UPDATE T_MSF_DIVIDAS SET " +
                    "ds_paga = ? " +
                    "WHERE cd_divida = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, divida.getDsPaga());
            stmt.setInt(2, divida.getCodigoDivida());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao atualizar o status de pagamento.");
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
    public void atualizarDivida(Divida divida) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();

            String sql = "UPDATE T_MSF_DIVIDAS SET " +
                    "vl_divida = ?, " +
                    "dt_pagamento = ?, " +
                    "vl_juros = ?, " +
                    "dt_divida = ? " +
                    "WHERE cd_divida = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setDouble(1, divida.getValorDivida());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataPgmtFormatada = divida.getDataPagamento().format(formatter);
            stmt.setString(2, dataPgmtFormatada);
            stmt.setDouble(3, divida.getJuros());
            DateTimeFormatter formatterr = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataDividaFormatada = divida.getDataDivida().format(formatterr);
            stmt.setString(4, dataDividaFormatada);
            stmt.setInt(5, divida.getCodigoDivida());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao atualizar.");
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
    public void removerDivida(int codigoDivida) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "DELETE FROM T_MSF_DIVIDAS WHERE cd_divida = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoDivida);
            stmt.executeUpdate();
            System.out.println("Divida removida.");
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