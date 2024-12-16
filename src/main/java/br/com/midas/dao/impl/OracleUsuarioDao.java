package br.com.midas.dao.impl;

import br.com.midas.dao.UsuarioDao;
import br.com.midas.exception.DBException;
import br.com.midas.factory.ConnectionFactory;
import br.com.midas.model.Usuario;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OracleUsuarioDao implements UsuarioDao {

    private static final Logger logger = Logger.getLogger(OracleUsuarioDao.class.getName());
    private Connection conexao;

    @Override
    public void cadastrarUsuario(Usuario usuario) throws DBException {
        PreparedStatement stmt = null;
        String sql = "INSERT INTO T_MSF_USUARIO (nm_usuario, dt_nascimento, genero, email, senha) VALUES (?, ?, ?, ?, ?)";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);

            stmt.setString(1, usuario.getNomeCompleto());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataNascFormatada = usuario.getDataNascimento().format(formatter);
            stmt.setString(2, dataNascFormatada);
            stmt.setString(3, String.valueOf(usuario.getGenero()));
            stmt.setString(4, usuario.getEmail());
            stmt.setString(5, usuario.getSenha());

            stmt.executeUpdate();
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao cadastrar usuário.", e);
            throw new DBException("Erro ao cadastrar usuário.");
        } finally {
            try {
                Objects.requireNonNull(stmt).close();
                conexao.close();
            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Erro ao fechar recursos no método cadastrar.", e);
            }
        }
    }

    @Override
    public void atualizarUsuario(Usuario usuario) throws DBException {
        PreparedStatement stmt = null;
        String sql = "UPDATE T_MSF_USUARIO SET nm_usuario = ?, dt_nascimento = ?, genero = ?, email = ?, senha = ? WHERE cd_usuario = ?";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);

            stmt.setString(1, usuario.getNomeCompleto());
            stmt.setDate(2, Date.valueOf(usuario.getDataNascimento()));
            stmt.setString(3, String.valueOf(usuario.getGenero()));
            stmt.setString(4, usuario.getEmail());
            stmt.setString(5, usuario.getSenha());
            stmt.setInt(6, usuario.getCodigoUsuario());

            stmt.executeUpdate();
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao atualizar usuário.", e);
            throw new DBException("Erro ao atualizar usuário.");
        } finally {
            try {
                Objects.requireNonNull(stmt).close();
                conexao.close();
            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Erro ao fechar recursos no método atualizar.", e);
            }
        }
    }

    @Override
    public Usuario validarUsuario(Usuario usuario) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM T_MSF_USUARIO WHERE EMAIL = ? AND SENHA = ?";

        try {
            conexao = ConnectionFactory.getInstance().getConnection();
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            rs = stmt.executeQuery();

            // Verifica se existe um resultado e cria o objeto Usuario com os dados do banco
            if (rs.next()) {
                int codigoUsuario = rs.getInt("cd_usuario");
                String nomeCompleto = rs.getString("nm_usuario");
                LocalDate dataNascimento = rs.getDate("dt_nascimento").toLocalDate();
                char genero = rs.getString("genero").charAt(0);
                String email = rs.getString("email");
                String senha = rs.getString("senha");

                return new Usuario(codigoUsuario, nomeCompleto, dataNascimento, genero, email, senha);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erro ao validar usuário.", e);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (rs != null) rs.close();
                if (conexao != null) conexao.close();
            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Erro ao fechar recursos no método validarUsuario.", e);
            }
        }
        return null;
    }
}