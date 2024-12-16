package br.com.midas.dao;
import br.com.midas.exception.DBException;
import br.com.midas.model.Gasto;

import java.util.List;

public interface GastoDao {
    void cadastrarGasto(Gasto gasto) throws DBException;
    void atualizarGasto(Gasto gasto) throws DBException;
    void removerGasto(int codigoGasto) throws DBException;
    List<Gasto> getAllGasto(int codigoUsuario);
}
