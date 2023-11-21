package br.com.unipe.todoapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.unipe.todoapp.dao.TarefaDAO;
import br.com.unipe.todoapp.dao.UsuarioDAO;
import br.com.unipe.todoapp.model.Tarefa;
import br.com.unipe.todoapp.model.Usuario;

@Controller
public class WelcomeController {
	@Autowired
	private TarefaDAO tarefaDao;

	@Autowired
	private UsuarioDAO dao;
	Long usuario_id;

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView welcome(@ModelAttribute Usuario usuario) {
		ModelAndView view = new ModelAndView("welcome");

		view.addObject(usuario);

		return view;
	}

	// GET CADASTRAR USUARIO
	@RequestMapping(value = "/cadastra", method = RequestMethod.GET)
	public ModelAndView cadastra(@ModelAttribute Usuario usuario) {
		ModelAndView view = new ModelAndView("cadastra");

		view.addObject(usuario);

		return view;
	}

	@RequestMapping(value = "/cadastratarefa", method = RequestMethod.GET)
	public ModelAndView cadastratarefa(@ModelAttribute Tarefa tarefa) {
		ModelAndView view = new ModelAndView("cadastrotarefa");
		view.addObject(tarefa);

		return view;

	}

	// CADASTRAR TAREFA
	@RequestMapping(value = "/cadastratarefa", method = RequestMethod.POST)
	public ModelAndView cadastrartarefa(@ModelAttribute Tarefa tarefa) {
		ModelAndView view = new ModelAndView("cadastrotarefa");
		
		
		Usuario usuario = dao.getId(usuario_id);
		
		System.out.println("O USUARIO ANTES DE CADASTRAR TAREFA É"+usuario.toString());
		tarefa.setUsuario(usuario);
		System.out.println("O USUARIO APOS CADASTRAR "+ tarefa.getUsuario().toString());
		tarefaDao.salvar(tarefa);
		
		view.setViewName("listartarefas");
	
		view.addObject("tarefas", tarefaDao.getTarefasPorUsuario(usuario));
		view.addObject("mensagem", "Tarefa cadastrada com sucesso!");
		

		return view;

	}

	// CADASTRAR USUÁRIO
	@RequestMapping(value = "/cadastrausuario", method = RequestMethod.POST)
	public ModelAndView cadastrausuario(@ModelAttribute Usuario usuario) {

		ModelAndView view = new ModelAndView("cadastra");
		view.addObject(usuario);

		Long user = dao.findIdByEmail(usuario.getEmail());		
		
		if (user != null) {
			view.addObject("mensagem", "Usuário já cadastrado!");
			view.addObject("usuario", new Usuario());
		}else {
			dao.salvar(usuario);
			view.addObject("mensagem", "Usuário cadastrado com sucesso!");
			view.setViewName("welcome");
			view.addObject("usuario", new Usuario());
		}

		return view;

	}

	// LOGIN
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute Usuario usuario) {
		ModelAndView view = new ModelAndView();
		Usuario user = new Usuario();

		view.addObject(user);

		System.out.println("Variavel email: " + usuario.getEmail() + usuario.getSenha());

		usuario_id = dao.findIdByEmailAndSenha(usuario.getEmail(), usuario.getSenha());

		if (usuario_id != null) {
			Usuario usuarioExistente = dao.getId(usuario_id);
			System.out.println("Usuário encontrado: " + usuarioExistente.getEmail());
			view.addObject("tarefas", tarefaDao.getTarefasPorUsuario(usuarioExistente));
			view.setViewName("listartarefas");
			usuario_id = usuarioExistente.getId();
		} else {
			System.out.println("Variavel usuarioid: " + usuario_id);
			view.addObject("mensagem", "Usuário ou senha incorretos");
			view.setViewName("welcome");
		}

		return view;
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView welcomelogout(@ModelAttribute Usuario usuario) {
		ModelAndView view = new ModelAndView("welcome");

		view.addObject(usuario);

		return view;
	}

}
