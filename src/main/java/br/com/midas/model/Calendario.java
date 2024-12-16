package br.com.midas.model;

public class Calendario {
    private Long codigoCalendario;
    private String indicadorDia;

    // Construtor padrão
    public Calendario() {
    }

    // Construtor com todos os atributos obrigatórios
    public Calendario(Long codigoCalendario, String indicadorDia) {
        this.codigoCalendario = codigoCalendario;
        this.indicadorDia = indicadorDia;
    }

    // Construtor com o código oculto
    public Calendario(String indicadorDia) {
        this.indicadorDia = indicadorDia;
    }

    // Métodos getters e setters
    public Long getCodigoCalendario() {
        return codigoCalendario;
    }

    public void setCodigoCalendario(Long codigoCalendario) {
        this.codigoCalendario = codigoCalendario;
    }

    public String getIndicadorDia() {
        return indicadorDia;
    }

    public void setIndicadorDia(String indicadorDia) {
        this.indicadorDia = indicadorDia;
    }
}