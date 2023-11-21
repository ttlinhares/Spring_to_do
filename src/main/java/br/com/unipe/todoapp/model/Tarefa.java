package br.com.unipe.todoapp.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Tarefa implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 100)
    private String descricao;
    
    @Column(nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime dataConclusao;
    
    @Column(nullable = true)
    private Boolean concluido;

    @ManyToOne	
    @JoinColumn(name = "usuarios_id")
    private Usuario usuario;


	public Tarefa(Long id, String descricao, LocalDateTime dataConclusao, Boolean concluido, Usuario usuario) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.dataConclusao = dataConclusao;
		this.concluido = concluido;
		this.usuario = usuario;
	}

	public Tarefa() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public LocalDateTime getDataConclusao() {
		return dataConclusao;
	}

	public void setDataConclusao(LocalDateTime dataConclusao) {
		this.dataConclusao = dataConclusao;
	}

	public Boolean getConcluido() {
		return concluido;
	}

	public void setConcluido(Boolean concluido) {
		this.concluido = concluido;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
    