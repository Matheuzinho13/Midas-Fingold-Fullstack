package br.com.midas.model;

import java.time.LocalDate;

public class Investimento {
    private int codigoInvestimento;
    private int cdUsuario;
    private String tipoInvestimento;
    private String nomeAplicacao;
    private String nomeBanco;
    private double valorAplicacao;
    private LocalDate dataInvestimento; // dd/mm/aaaa
    private LocalDate dataVencimento; // dd/mm/aaaa

    // Construtor padrão
    public Investimento() {
    }

    // Construtor com todos os atributos obrigatórios
    public Investimento(int codigoInvestimento, String tipoInvestimento, String nomeAplicacao, String nomeBanco,
                        double valorAplicacao, LocalDate dataInvestimento, LocalDate dataVencimento) {
        this.codigoInvestimento = codigoInvestimento;
        this.tipoInvestimento = tipoInvestimento;
        this.nomeAplicacao = nomeAplicacao;
        this.nomeBanco = nomeBanco;
        this.valorAplicacao = valorAplicacao;
        this.dataInvestimento = dataInvestimento;
        this.dataVencimento = dataVencimento;
    }

    // Construtor com o código oculto
    public Investimento(String tipoInvestimento, String nomeAplicacao, String nomeBanco, double valorAplicacao,
                        LocalDate dataInvestimento, LocalDate dataVencimento) {
        this.tipoInvestimento = tipoInvestimento;
        this.nomeAplicacao = nomeAplicacao;
        this.nomeBanco = nomeBanco;
        this.valorAplicacao = valorAplicacao;
        this.dataInvestimento = dataInvestimento;
        this.dataVencimento = dataVencimento;
    }

    // Construtor com todos os atributos obrigatórios
    public Investimento(int codigoInvestimento, int codigoUsuario, String tipoInvestimento, String nomeAplicacao, String nomeBanco,
                        double valorAplicacao, LocalDate dataInvestimento, LocalDate dataVencimento) {
        this.codigoInvestimento = codigoInvestimento;
        this.cdUsuario = codigoUsuario;
        this.tipoInvestimento = tipoInvestimento;
        this.nomeAplicacao = nomeAplicacao;
        this.nomeBanco = nomeBanco;
        this.valorAplicacao = valorAplicacao;
        this.dataInvestimento = dataInvestimento;
        this.dataVencimento = dataVencimento;
    }

    // Métodos getters e setters
    public int getCodigoInvestimento() {
        return codigoInvestimento;
    }

    public void setCodigoInvestimento(int codigoInvestimento) {
        this.codigoInvestimento = codigoInvestimento;
    }

    public int getCdUsuario() {
        return cdUsuario;
    }

    public void setCdUsuario(int cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    public String getTipoInvestimento() {
        return tipoInvestimento;
    }

    public void setTipoInvestimento(String tipoInvestimento) {
        this.tipoInvestimento = tipoInvestimento;
    }

    public String getNomeAplicacao() {
        return nomeAplicacao;
    }

    public void setNomeAplicacao(String nomeAplicacao) {
        this.nomeAplicacao = nomeAplicacao;
    }

    public String getNomeBanco() {
        return nomeBanco;
    }

    public void setNomeBanco(String nomeBanco) {
        this.nomeBanco = nomeBanco;
    }

    public double getValorAplicacao() {
        return valorAplicacao;
    }

    public void setValorAplicacao(double valorAplicacao) {
        this.valorAplicacao = valorAplicacao;
    }

    public LocalDate getDataInvestimento() {
        return dataInvestimento;
    }

    public void setDataInvestimento(LocalDate dataInvestimento) {
        this.dataInvestimento = dataInvestimento;
    }

    public LocalDate getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(LocalDate dataVencimento) {
        this.dataVencimento = dataVencimento;
    }
}