package br.com.midas.factory;

import br.com.midas.dao.*;
import br.com.midas.dao.impl.*;

public class DaoFactory {
    public static UsuarioDao getUsuarioDAO() {
        return new OracleUsuarioDao();
    }
    public static ObjetivoDao getObjetivoDAO() {
        return new OracleObjetivoDao();
    }
    public static GanhoDao getGanhoDAO() {
        return new OracleGanhoDao();
    }
    public static DashboardDao getDashboardDAO() {
        return new OracleDashboardDao();
    }
    public static GastoDao getGastoDAO() {
        return new OracleGastoDao();
    }
    public static InvestimentoDao getInvestimentoDAO() {
        return new OracleInvestimentoDao();
    }
    public static DividaDao getDividaDAO() {
        return new OracleDividaDao();
    }
    public static CalendarioDao getCalendarioDAO() {
        return new OracleCalendarioDao();
    }
}