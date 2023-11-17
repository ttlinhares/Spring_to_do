package br.com.unipe.todoapp.dao;

import br.com.unipe.todoapp.model.Tarefa;
import br.com.unipe.todoapp.model.Usuario;

import java.util.List;
import javax.persistence.*;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class TarefaDAO {

    @PersistenceContext
    private EntityManager entityManager;
    
    @Transactional(readOnly=false)
    public void salvar(Tarefa tarefa) {
        entityManager.persist(tarefa);
    }
    
    @Transactional(readOnly=true)
    public List<Tarefa> getAll() {
        String jpql = "SELECT t FROM Tarefa t";
        TypedQuery<Tarefa> consulta = entityManager.createQuery(jpql, Tarefa.class);
        return consulta.getResultList();
    }
    @Transactional(readOnly=true)
    public List<Tarefa> getTarefasPorUsuario(Usuario usuario) {
        TypedQuery<Tarefa> query = entityManager.createQuery(
            "SELECT t FROM Tarefa t WHERE t.usuario = :usuario", Tarefa.class);
        query.setParameter("usuario", usuario);
        return query.getResultList();
    }
    
    @Transactional(readOnly=true)
    public Tarefa getId(Long id) {
        return entityManager.find(Tarefa.class, id);
    }
    @Transactional(readOnly=false)
    public void editar(Tarefa tarefa) {
        entityManager.merge(tarefa);
    }
    @Transactional(readOnly=false)
    public void excluir(Long id) {
        Tarefa tarefa = getId(id);
        if (tarefa != null) {
            entityManager.remove(tarefa);
        }
    }
}
