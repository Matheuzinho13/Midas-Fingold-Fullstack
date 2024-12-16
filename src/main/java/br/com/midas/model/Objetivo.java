package br.com.midas.model;

import java.time.LocalDate;

public class Objetivo {
    private int codigoObjetivo;
    private int cdUsuario;
    private String nomeObjetivo;
    private double valorObjetivo;
    private LocalDate dataObjetivo;
    private String descricaoObjetivo;
    private String dsConcluido; // Atributo para o status de conclusão

    // Construtor padrão
    public Objetivo() {
    }

    // Construtor com todos os atributos obrigatórios
    public Objetivo(int codigoObjetivo, String nomeObjetivo, double valorObjetivo, LocalDate dataObjetivo,
                    String descricaoObjetivo, String dsConcluido) {
        this.codigoObjetivo = codigoObjetivo;
        this.nomeObjetivo = nomeObjetivo;
        this.valorObjetivo = valorObjetivo;
        this.dataObjetivo = dataObjetivo;
        this.descricaoObjetivo = descricaoObjetivo;
        this.dsConcluido = dsConcluido; // Adicionando o status de conclusão
    }

    // Construtor com o código oculto
    public Objetivo(String nomeObjetivo, double valorObjetivo, LocalDate dataObjetivo, String descricaoObjetivo, String dsConcluido) {
        this.nomeObjetivo = nomeObjetivo;
        this.valorObjetivo = valorObjetivo;
        this.dataObjetivo = dataObjetivo;
        this.descricaoObjetivo = descricaoObjetivo;
        this.dsConcluido = dsConcluido; // Adicionando o status de conclusão
    }

    public Objetivo(int codigoObjetivo, int codigoUsuario, String nomeObjetivo, double valorObjetivo, LocalDate dataObjetivo, String descricaoObjetivo, String dsConcluido) {
        this.codigoObjetivo = codigoObjetivo;
        this.cdUsuario = codigoUsuario;
        this.nomeObjetivo = nomeObjetivo;
        this.valorObjetivo = valorObjetivo;
        this.dataObjetivo = dataObjetivo;
        this.descricaoObjetivo = descricaoObjetivo;
        this.dsConcluido = dsConcluido; // Adicionando o status de conclusão
    }

    // Construtor que recebe apenas codigoObjetivo e dsConcluido
    public Objetivo(int codigoObjetivo, String dsConcluido) {
        this.codigoObjetivo = codigoObjetivo;
        this.dsConcluido = dsConcluido;
    }

    // Métodos getters e setters
    public int getCodigoObjetivo() {
        return codigoObjetivo;
    }

    public void setCodigoObjetivo(int codigoObjetivo) {
        this.codigoObjetivo = codigoObjetivo;
    }

    public int getCdUsuario() {
        return cdUsuario;
    }

    public void setCdUsuario(int cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    public String getNomeObjetivo() {
        return nomeObjetivo;
    }

    public void setNomeObjetivo(String nomeObjetivo) {
        this.nomeObjetivo = nomeObjetivo;
    }

    public double getValorObjetivo() {
        return valorObjetivo;
    }

    public void setValorObjetivo(double valorObjetivo) {
        this.valorObjetivo = valorObjetivo;
    }

    public LocalDate getDataObjetivo() {
        return dataObjetivo;
    }

    public void setDataObjetivo(LocalDate dataObjetivo) {
        this.dataObjetivo = dataObjetivo;
    }

    public String getDescricaoObjetivo() {
        return descricaoObjetivo;
    }

    public void setDescricaoObjetivo(String descricaoObjetivo) {
        this.descricaoObjetivo = descricaoObjetivo;
    }

    public String getDsConcluido() {
        return dsConcluido;
    }

    public void setDsConcluido(String dsConcluido) {
        this.dsConcluido = dsConcluido;
    }
}