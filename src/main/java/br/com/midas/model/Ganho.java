package br.com.midas.model;

import java.time.LocalDate;

public class Ganho {
    private int codigoGanho;
    private int cdUsuario;
    private double valorGanho;
    private LocalDate dataGanho; // dd/mm/aaa
    private String descricaoGanho;

    // Construtor padrão
    public Ganho() {
    }

    // Construtor com todos os atributos obrigatórios
    public Ganho(int codigoGanho, int codigoUsuario, double valorGanho, LocalDate dataGanho, String descricaoGanho) {
        this.codigoGanho = codigoGanho;
        this.cdUsuario = codigoUsuario;
        this.valorGanho = valorGanho;
        this.dataGanho = dataGanho;
        this.descricaoGanho = descricaoGanho;
    }

    public Ganho(int codigoGanho, double valorGanho, LocalDate dataGanho, String descricaoGanho) {
        this.codigoGanho = codigoGanho;
        this.valorGanho = valorGanho;
        this.dataGanho = dataGanho;
        this.descricaoGanho = descricaoGanho;
    }

    // Métodos getters e setters
    public int getCodigoGanho() {
        return codigoGanho;
    }

    public void setCodigoGanho(int codigoGanho) {
        this.codigoGanho = codigoGanho;
    }

    public int getCdUsuario() {
        return cdUsuario;
    }

    public void setCdUsuario(int cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    public double getValorGanho() {
        return valorGanho;
    }

    public void setValorGanho(double valorGanho) {
        this.valorGanho = valorGanho;
    }

    public LocalDate getDataGanho() {
        return dataGanho;
    }

    public void setDataGanho(LocalDate dataGanho) {
        this.dataGanho = dataGanho;
    }

    public String getDescricaoGanho() {
        return descricaoGanho;
    }

    public void setDescricaoGanho(String descricaoGanho) {
        this.descricaoGanho = descricaoGanho;
    }
}