package br.com.midas.model;

import br.com.midas.util.CriptografiaUtils;

import java.time.LocalDate;

public class Usuario {
    private int codigoUsuario;
    private String nomeCompleto;
    private LocalDate dataNascimento; // dd/mm/aaaa
    private char genero;
    private String email;
    private String senha;

    // Construtor padrão
    public Usuario() {
    }

    // Construtor com todos os atributos obrigatórios
    public Usuario(
            int codigoUsuario,
            String nomeCompleto,
            LocalDate dataNascimento,
            char genero,
            String email,
            String senha
    ) {
        this.codigoUsuario = codigoUsuario;
        this.nomeCompleto = nomeCompleto;
        this.dataNascimento = dataNascimento;
        this.genero = genero;
        this.email = email;
        this.senha = senha;
    }

    // Sem Senha
    public Usuario(
            int codigoUsuario,
            String nomeCompleto,
            LocalDate dataNascimento,
            char genero,
            String email
    ) {
        this.codigoUsuario = codigoUsuario;
        this.nomeCompleto = nomeCompleto;
        this.dataNascimento = dataNascimento;
        this.genero = genero;
        this.email = email;
    }

    // Construtor com o código oculto
    public Usuario(
            String nomeCompleto,
            LocalDate dataNascimento,
            char genero,
            String email,
            String senha
    ) {
        this.nomeCompleto = nomeCompleto;
        this.dataNascimento = dataNascimento;
        this.genero = genero;
        this.email = email;
        this.senha = senha;
    }

    public Usuario(String email, String senha) {
        super();
        this.email = email;
        setSenha(senha);
    }
    // Métodos getters e setters
    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public char getGenero() {
        return genero;
    }

    public void setGenero(char genero) {
        this.genero = genero;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        try {
            this.senha = CriptografiaUtils.criptografar(senha);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}