package br.com.midas.model;

import java.time.LocalDate;

public class Gasto {
    private int codigoGasto;
    private int cdUsuario;
    private double valorGasto;
    private LocalDate dataGasto; // dd/mm/aaaa
    private String categoria;
    private String descricaoGasto;

    // Construtor padrão
    public Gasto() {
    }

    // Construtor com todos os atributos obrigatórios
    public Gasto(int codigoGasto, int codigoUsuario, double valorGasto, LocalDate dataGasto, String categoria, String descricaoGasto) {
        this.codigoGasto = codigoGasto;
        this.cdUsuario = codigoUsuario;
        this.valorGasto = valorGasto;
        this.dataGasto = dataGasto;
        this.categoria = categoria;
        this.descricaoGasto = descricaoGasto;
    }

    // Construtor com o código do Usuário oculto
    public Gasto(int codigoGasto,  double valorGasto, LocalDate dataGasto, String categoria, String descricaoGasto) {
        this.codigoGasto = codigoGasto;
        this.valorGasto = valorGasto;
        this.dataGasto = dataGasto;
        this.categoria = categoria;
        this.descricaoGasto = descricaoGasto;
    }

    // Métodos getters e setters
    public int getCodigoGasto() {
        return codigoGasto;
    }

    public void setCodigoGasto(int codigoGasto) {
        this.codigoGasto = codigoGasto;
    }

    public int getCdUsuario() {
        return cdUsuario;
    }

    public void setCdUsuario(int cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    public double getValorGasto() {
        return valorGasto;
    }

    public void setValorGasto(double valorGasto) {
        this.valorGasto = valorGasto;
    }

    public LocalDate getDataGasto() {
        return dataGasto;
    }

    public void setDataGasto(LocalDate dataGasto) {
        this.dataGasto = dataGasto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescricaoGasto() {
        return descricaoGasto;
    }

    public void setDescricaoGasto(String descricaoGasto) {
        this.descricaoGasto = descricaoGasto;
    }
}
