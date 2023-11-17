package br.com.unipe.todoapp.dao;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.unipe.todoapp.model.Usuario;

@Repository
@Transactional
public class UsuarioDAO {

    @PersistenceContext
    private EntityManager entityManager;

    // Insert
    public void salvar(Usuario usuario) {
        entityManager.persist(usuario);
    }

    // Select *
    public List<Usuario> getAll() {
        String jpql = "SELECT u FROM Usuario u";
        TypedQuery<Usuario> consulta = entityManager.createQuery(jpql, Usuario.class);
        return consulta.getResultList();
    }

    // Select where
    @Transactional(readOnly=true)
    public Usuario getId(Long id) {
        return entityManager.find(Usuario.class, id);
    }
    
    @Transactional(readOnly=true)
    public Long findIdByEmailAndSenha(String email, String senha) {
        
        String jpql = "SELECT u.id FROM Usuario u WHERE u.email = :email AND u.senha = :senha";
        
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("email", email);
        query.setParameter("senha", senha);

        try {
            return query.getSingleResult();
        } catch (NoResultException e){
            return null; 
        }
    }

    // Select where
    @Transactional(readOnly=true)
    public Usuario getEmail(String email) {
    	return entityManager.find(Usuario.class, email);
    }

    // Update where
    @Transactional(readOnly=false)
    public void editar(Usuario usuario) {
        entityManager.merge(usuario);
    }

    // Delete
    @Transactional(readOnly=false)
    public void excluir(Long id) {
        Usuario usuario = getId(id);
        if (usuario != null) {
            entityManager.remove(usuario);
        }
    }
}
