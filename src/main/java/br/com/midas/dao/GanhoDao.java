package br.com.midas.dao;
import br.com.midas.exception.DBException;
import br.com.midas.model.Ganho;

import java.util.List;

public interface GanhoDao {
    void cadastrarGanho(Ganho ganho) throws DBException;
    void atualizarGanho(Ganho ganho) throws DBException;
    void removerGanho(int codigoGanho) throws DBException;
    List<Ganho> getAllGanho(int codigoUsuario);
}
