package br.com.midas.dao;
import br.com.midas.exception.DBException;
import br.com.midas.model.Divida;

import java.util.List;

public interface DividaDao {
    void cadastrarDivida(Divida divida) throws DBException;
    void atualizarDivida(Divida divida) throws DBException;
    void removerDivida(int codigoDivida) throws DBException;
    void atualizarStatusPagamento(Divida divida) throws DBException;
    List<Divida> getAllDivida(int codigoUsuario);
}