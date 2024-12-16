package br.com.midas.dao;
import br.com.midas.exception.DBException;
import br.com.midas.model.Objetivo;

import java.util.List;

public interface ObjetivoDao {
    void cadastrar(Objetivo objetivo) throws DBException;
    void remover(int codigoObjetivo) throws DBException;
    void atualizarStatus(Objetivo objetivo) throws DBException;
    void editarObjetivo(Objetivo objetivo) throws DBException;
    List<Objetivo> getAll(int codigoUsuario);
}