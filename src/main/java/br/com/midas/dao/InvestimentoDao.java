package br.com.midas.dao;
import br.com.midas.exception.DBException;
import br.com.midas.model.Investimento;

import java.util.List;

public interface InvestimentoDao {
    void cadastrarInvestimento(Investimento investimento) throws DBException;
    void atualizarInvestimento(Investimento investimento) throws DBException;
    void removerInvestimento(int codigoInvestimento) throws DBException;
    List<Investimento> getAllInvestimento(int codigoUsuario);
}