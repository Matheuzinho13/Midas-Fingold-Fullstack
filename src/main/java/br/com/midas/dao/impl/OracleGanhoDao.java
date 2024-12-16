package br.com.midas.dao.impl;

import br.com.midas.dao.GanhoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;
import br.com.midas.model.Ganho;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OracleGanhoDao implements GanhoDao {

    private Connection conexao;

    @Override
    public void cadastrarGanho(Ganho ganho) throws DBException {
        PreparedStatement stmt = null;

        String sql = "INSERT INTO T_MSF_GANHOS (cd_usuario, vl_ganho, dt_ganho, ds_ganho) " +
                "VALUES (?, ?, ?, ?)";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, ganho.getCdUsuario());
            stmt.setDouble(2, ganho.getValorGanho());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataGanhoFormatada = ganho.getDataGanho().format(formatter);
            stmt.setString(3, dataGanhoFormatada);
            stmt.setString(4, ganho.getDescricaoGanho());
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
    public List<Ganho> getAllGanho(int codigoUsuario) {
        PreparedStatement stmt = null;
        List<Ganho> ganhos = new ArrayList<>();
        ResultSet resultadoGanho = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "SELECT * FROM T_MSF_GANHOS WHERE cd_usuario = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoUsuario);
            resultadoGanho = stmt.executeQuery();

            while (resultadoGanho.next()) {
                int codigoGanho = resultadoGanho.getInt("cd_ganho");
                double valorGanho = resultadoGanho.getDouble("vl_ganho");
                LocalDate dataGanho = LocalDate.parse(resultadoGanho.getString("dt_ganho"),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                String descricaoGanho = resultadoGanho.getString("ds_ganho");

                Ganho ganho = new Ganho(codigoGanho, codigoUsuario, valorGanho, dataGanho, descricaoGanho);
                ganhos.add(ganho);
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
        return ganhos;
    }


    @Override
    public void atualizarGanho(Ganho ganho) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();

            String sql = "UPDATE T_MSF_GANHOS SET " +
                    "vl_ganho = ?, " +
                    "dt_ganho = ?, " +
                    "ds_ganho = ? " +
                    "WHERE cd_ganho = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setDouble(1, ganho.getValorGanho());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataGanhoFormatada = ganho.getDataGanho().format(formatter);
            stmt.setString(2, dataGanhoFormatada);
            stmt.setString(3, ganho.getDescricaoGanho());
            stmt.setInt(4, ganho.getCodigoGanho());
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
    public void removerGanho(int codigoGanho) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "DELETE FROM T_MSF_GANHOS WHERE cd_ganho = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoGanho);
            stmt.executeUpdate();
            System.out.println("Ganho removido.");
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