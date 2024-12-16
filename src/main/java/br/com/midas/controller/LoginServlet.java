package br.com.midas.controller;

import br.com.midas.bo.EmailBo;
import br.com.midas.dao.UsuarioDao;
import br.com.midas.exception.EmailException;
import br.com.midas.factory.DaoFactory;
import br.com.midas.model.Usuario;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
    private UsuarioDao usuarioDao;
    private EmailBo emailBo;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            this.usuarioDao = DaoFactory.getUsuarioDAO();
            this.emailBo = new EmailBo();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        realizarLogin(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        redirecionarParaLogin(request, response);
    }

    private void realizarLogin(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario(email, senha);
        Usuario usuarioVerificado = usuarioDao.validarUsuario(usuario);

        if (usuarioVerificado != null) {
            autenticarUsuario(request, response, usuarioVerificado);
        } else {
            falhaAutenticacao(request, response, email);
        }
    }

    private void autenticarUsuario(HttpServletRequest request, HttpServletResponse response, Usuario usuarioVerificado) {
        try {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioVerificado", usuarioVerificado);
            session.setAttribute("codigoUsuario", usuarioVerificado.getCodigoUsuario());

            logger.log(Level.INFO, "Login realizado com sucesso");

            response.sendRedirect(request.getContextPath() + "/dashboard");
            enviarNotificacaoLogin(usuarioVerificado.getEmail());
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Erro ao redirecionar para o dashboard após login bem-sucedido", e);
        }
    }

    private void falhaAutenticacao(HttpServletRequest request, HttpServletResponse response, String email) {
        logger.log(Level.WARNING, "Tentativa de login falhou para o e-mail: {0}", email);
        request.setAttribute("erro", "Usuário ou senha inválidos");

        try {
            request.getRequestDispatcher("/resources/pages/login.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            logger.log(Level.SEVERE, "Erro ao redirecionar para a página de login após falha na autenticação", e);
        }
    }

    private void enviarNotificacaoLogin(String email) {
        String mensagem = "Um login foi realizado na plataforma em " + LocalDate.now();
        try {
            emailBo.enviarEmail(email, "Login Realizado", mensagem);
        } catch (EmailException e) {
            logger.log(Level.WARNING, "Falha ao enviar e-mail de notificação de login", e);
        }
    }

    private void redirecionarParaLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect(request.getContextPath() + "/login");
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Erro ao redirecionar para a página de login", e);
        }
    }
}
