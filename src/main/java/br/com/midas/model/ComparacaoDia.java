package br.com.midas.model;

import java.time.LocalDate;

public class ComparacaoDia {
    private Long codigoComparacao;
    private LocalDate dataComparacao; // dd/mm/aaa
    private double somaGanhos;
    private double somaGastos;
    private double saldoDia;

    // Construtor padrão
    public ComparacaoDia() {
    }

    // Construtor com todos os atributos obrigatórios
    public ComparacaoDia(Long codigoComparacao, LocalDate dataComparacao, double somaGanhos,
            double somaGastos, double saldoDia) {
        this.codigoComparacao = codigoComparacao;
        this.dataComparacao = dataComparacao;
        this.somaGanhos = somaGanhos;
        this.somaGastos = somaGastos;
        this.saldoDia = saldoDia;
    }

    // Construtor com o código oculto
    public ComparacaoDia(LocalDate dataComparacao, double somaGanhos, double somaGastos, double saldoDia) {
        this.dataComparacao = dataComparacao;
        this.somaGanhos = somaGanhos;
        this.somaGastos = somaGastos;
        this.saldoDia = saldoDia;
    }

    // Métodos getters e setters
    public Long getCodigoComparacao() {
        return codigoComparacao;
    }

    public void setCodigoComparacao(Long codigoComparacao) {
        this.codigoComparacao = codigoComparacao;
    }

    public LocalDate getDataComparacao() {
        return dataComparacao;
    }

    public void setDataComparacao(LocalDate dataComparacao) {
        this.dataComparacao = dataComparacao;
    }

    public double getSomaGanhos() {
        return somaGanhos;
    }

    public void setSomaGanhos(double somaGanhos) {
        this.somaGanhos = somaGanhos;
    }

    public double getSomaGastos() {
        return somaGastos;
    }

    public void setSomaGastos(double somaGastos) {
        this.somaGastos = somaGastos;
    }

    public double getSaldoDia() {
        return saldoDia;
    }

    public void setSaldoDia(double saldoDia) {
        this.saldoDia = saldoDia;
    }
}