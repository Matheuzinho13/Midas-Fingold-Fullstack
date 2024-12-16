package br.com.midas.model;

import java.time.LocalDate;

public class Divida {
    private int codigoDivida;
    private int cdUsuario;
    private double valorDivida;
    private LocalDate dataPagamento; // dd/mm/aaaa
    private boolean paga;
    private double juros;
    private LocalDate dataDivida; // dd/mm/aaaa
    private String dsPaga; // Atributo para o status de pagamento da dívida

    // Construtor padrão
    public Divida() {
    }

    // Construtor com todos os atributos obrigatórios
    public Divida(int codigoDivida, int codigoUsuario, double valorDivida, LocalDate dataPagamento, boolean paga, double juros,
                  LocalDate dataDivida) {
        this.codigoDivida = codigoDivida;
        this.cdUsuario = codigoUsuario;
        this.valorDivida = valorDivida;
        this.dataPagamento = dataPagamento;
        this.paga = paga;
        this.juros = juros;
        this.dataDivida = dataDivida;
    }

    public Divida(int codigoDivida, int codigoUsuario, double valorDivida, LocalDate dataPagamento, double juros,
                  LocalDate dataDivida) {
        this.codigoDivida = codigoDivida;
        this.cdUsuario = codigoUsuario;
        this.valorDivida = valorDivida;
        this.dataPagamento = dataPagamento;
        this.juros = juros;
        this.dataDivida = dataDivida;
    }

    public Divida(int codigoDivida, double valorDivida, LocalDate dataPagamento, double juros,
                  LocalDate dataDivida) {
        this.codigoDivida = codigoDivida;
        this.valorDivida = valorDivida;
        this.dataPagamento = dataPagamento;
        this.juros = juros;
        this.dataDivida = dataDivida;
    }

    // Construtor com o código oculto
    public Divida(double valorDivida, LocalDate dataPagamento, boolean paga, double juros, LocalDate dataDivida) {
        this.valorDivida = valorDivida;
        this.dataPagamento = dataPagamento;
        this.paga = paga;
        this.juros = juros;
        this.dataDivida = dataDivida;
    }

    // Novo construtor que recebe apenas o codigoDivida e dsPaga
    public Divida(int codigoDivida, String dsPaga) {
        this.codigoDivida = codigoDivida;
        this.dsPaga = dsPaga;
    }

    // Métodos getters e setters
    public int getCodigoDivida() {
        return codigoDivida;
    }

    public void setCodigoDivida(int codigoDivida) {
        this.codigoDivida = codigoDivida;
    }

    public int getCdUsuario() {
        return cdUsuario;
    }

    public void setCdUsuario(int cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    public double getValorDivida() {
        return valorDivida;
    }

    public void setValorDivida(double valorDivida) {
        this.valorDivida = valorDivida;
    }

    public LocalDate getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(LocalDate dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public boolean isPaga() {
        return paga;
    }

    public void setPaga(boolean paga) {
        this.paga = paga;
    }

    public double getJuros() {
        return juros;
    }

    public void setJuros(double juros) {
        this.juros = juros;
    }

    public LocalDate getDataDivida() {
        return dataDivida;
    }

    public void setDataDivida(LocalDate dataDivida) {
        this.dataDivida = dataDivida;
    }

    public String getDsPaga() {
        return dsPaga;
    }

    public void setDsPaga(String dsPaga) {
        this.dsPaga = dsPaga;
    }
}