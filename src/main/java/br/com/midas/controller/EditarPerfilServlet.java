package br.com.midas.controller;

import br.com.midas.dao.UsuarioDao;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/perfil")
public class EditarPerfilServlet extends HttpServlet {

    private UsuarioDao usuarioDao;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            usuarioDao = DaoFactory.getUsuarioDAO();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int codigoUsuario = Integer.parseInt(req.getParameter("codigoUsuario"));
            String nomeCompleto = req.getParameter("nomeCompleto");
            LocalDate dataNascimento = LocalDate.parse(req.getParameter("dataNascimento"));
            char genero = req.getParameter("genero").charAt(0);
            String email = req.getParameter("email");
            String senha = req.getParameter("senha"); // Senha pode ser null caso nÃ£o tenha sido modificada

            Usuario usuario = new Usuario(codigoUsuario, nomeCompleto, dataNascimento, genero, email, senha);

            // Criptografa a senha se ela foi modificada
            if (senha != null && !senha.isEmpty()) {
                usuario.setSenha(senha);
            }

            usuarioDao.atualizarUsuario(usuario);

            req.setAttribute("mensagem", "Perfil atualizado com sucesso!");
            req.getRequestDispatcher("/resources/pages/perfil.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao atualizar perfil. Por favor, tente novamente.");
            req.getRequestDispatcher("/resources/pages/perfil.jsp").forward(req, resp);
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

        req.setAttribute("usuario", usuarioVerificado);
        req.getRequestDispatcher("/resources/pages/perfil.jsp").forward(req, resp);
    }

}