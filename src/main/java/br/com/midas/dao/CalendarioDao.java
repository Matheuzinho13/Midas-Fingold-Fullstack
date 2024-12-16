package br.com.midas.dao;

import br.com.midas.exception.DBException;
import br.com.midas.model.Evento;

import java.util.List;

public interface CalendarioDao {
    List<Evento> getEventosPorMesEAno(int userId, int ano, int mes) throws DBException;
    int getAnoPrimeiroEvento(int userId) throws DBException;
}
