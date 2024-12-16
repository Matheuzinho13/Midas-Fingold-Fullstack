package br.com.midas.dao.impl;

import br.com.midas.dao.ObjetivoDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;
import br.com.midas.model.Objetivo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class OracleObjetivoDao implements ObjetivoDao {

    private Connection conexao;

    @Override
    public void cadastrar(Objetivo objetivo) throws DBException {
        PreparedStatement stmt = null;

        String sql = "INSERT INTO T_MSF_OBJETIVOS " +
                "(cd_usuario, nm_objetivo, vl_objetivo, dt_objetivo, ds_objetivo) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, objetivo.getCdUsuario());
            stmt.setString(2, objetivo.getNomeObjetivo());
            stmt.setDouble(3, objetivo.getValorObjetivo());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataObjetivoFormatada = objetivo.getDataObjetivo().format(formatter);
            stmt.setString(4, dataObjetivoFormatada);
            stmt.setString(5, objetivo.getDescricaoObjetivo());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastradar.");
        } finally {
            try {
                Objects.requireNonNull(stmt).close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Objetivo> getAll(int codigoUsuario){
        PreparedStatement stmt = null;
        List<Objetivo> objetivos = new ArrayList<>();
        ResultSet resultado;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "SELECT * FROM T_MSF_OBJETIVOS WHERE cd_usuario = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoUsuario);
            resultado = stmt.executeQuery();

            while (resultado.next()) {
                int codigoObjetivo = resultado.getInt("cd_objetivo");
                String nomeObjetivo = resultado.getString("nm_objetivo");
                double valorObjetivo = resultado.getDouble("vl_objetivo");
                // Convertendo String para LocalDate
                LocalDate dataObjetivo = LocalDate.parse(resultado.getString("dt_objetivo"),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                String descricaoObjetivo = resultado.getString("ds_objetivo");
                String dsConcluido = resultado.getString("ds_concluido"); // Recuperando o status de conclusão

                Objetivo objetivo = new Objetivo(codigoObjetivo, codigoUsuario, nomeObjetivo, valorObjetivo, dataObjetivo,
                        descricaoObjetivo, dsConcluido); // Passando o status para o construtor
                objetivos.add(objetivo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                Objects.requireNonNull(stmt).close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return objetivos;
    }

    // Novo método para atualizar o status do objetivo
    public void atualizarStatus(Objetivo objetivo) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();

            String sql = "UPDATE T_MSF_OBJETIVOS SET " +
                    "ds_concluido = ? " +
                    "WHERE cd_objetivo = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, objetivo.getDsConcluido());
            stmt.setInt(2, objetivo.getCodigoObjetivo());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao atualizar o status.");
        } finally {
            try {
                stmt.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Novo método para editar os outros atributos do objetivo
    public void editarObjetivo(Objetivo objetivo) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();

            String sql = "UPDATE T_MSF_OBJETIVOS SET " +
                    "nm_objetivo = ?, " +
                    "vl_objetivo = ?, " +
                    "dt_objetivo = ?, " +
                    "ds_objetivo = ? " +
                    "WHERE cd_objetivo = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, objetivo.getNomeObjetivo());
            stmt.setDouble(2, objetivo.getValorObjetivo());
            // Convertendo LocalDate para String no formato dd/MM/yyyy
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataObjetivoFormatada = objetivo.getDataObjetivo().format(formatter);
            stmt.setString(3, dataObjetivoFormatada);
            stmt.setString(4, objetivo.getDescricaoObjetivo());
            stmt.setInt(5, objetivo.getCodigoObjetivo());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao editar o objetivo.");
        } finally {
            try {
                Objects.requireNonNull(stmt).close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public void remover(int codigoObjetivo) throws DBException {
        PreparedStatement stmt = null;

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            String sql = "DELETE FROM T_MSF_OBJETIVOS WHERE cd_objetivo = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigoObjetivo);
            stmt.executeUpdate();
            System.out.println("Objetivo removido.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao remover.");
        } finally {
            try {
                Objects.requireNonNull(stmt).close();
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