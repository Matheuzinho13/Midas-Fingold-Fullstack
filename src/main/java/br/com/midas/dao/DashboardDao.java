package br.com.midas.dao;

import br.com.midas.exception.DBException;

import java.util.List;
import java.util.Map;

public interface DashboardDao {

    double getTotalGanhos(int codigoUsuario) throws DBException;
    double getTotalGastos(int codigoUsuario) throws DBException;
    String getNomeUsuario(int codigoUsuario) throws DBException;
    Map<String, Object> getUltimoGasto(int codigoUsuario) throws DBException;
    List<Map<String, Object>> getDetalhesObjetivos(int codigoUsuario) throws DBException;
    double getTotalInvestido(int codigoUsuario) throws DBException;
    Map<String, Double> getValorInvestidoPorTipo(int codigoUsuario) throws DBException;
    List<Map<String, Object>> getDetalhesDividas(int codigoUsuario) throws DBException;
    double getTotalDividas(int codigoUsuario) throws DBException;
}