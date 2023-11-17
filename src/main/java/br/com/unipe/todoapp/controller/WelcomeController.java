package br.com.unipe.todoapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(value="/cadastra", method = RequestMethod.GET)
	public String cadastra() {
		return "cadastra";
	}

	@RequestMapping(value="/cadastratarefa", method = RequestMethod.GET)
	public ModelAndView cadastratarefa(@ModelAttribute Tarefa tarefa){
		ModelAndView view = new ModelAndView("cadastrotarefa");
		view.addObject(tarefa);
		view.addObject("usuario_id", usuario_id);
		
		return view;
		
	}
	
	@RequestMapping(value="/cadastratarefa", method = RequestMethod.POST)
	public ModelAndView cadastrartarefa(@ModelAttribute Tarefa tarefa){
		ModelAndView view = new ModelAndView("cadastrotarefa");
		tarefaDao.salvar(tarefa);
		
		view.addObject("mensagem", "Tarefa cadastrada com sucesso!");
		
		return view;
		
	}
	
	@RequestMapping(value="/cadastrausuario", method = RequestMethod.POST)
	public ModelAndView cadastrausuario(@ModelAttribute Usuario usuario){
		
		ModelAndView view = new ModelAndView("welcome");
		
		dao.salvar(usuario);
		
		view.addObject("mensagem","Usuário cadastrado com sucesso!" );
		
		return view;
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@ModelAttribute Usuario usuario) {
	    ModelAndView view = new ModelAndView();
	    
	    System.out.println("Variavel email: " + usuario.getEmail() + usuario.getSenha());

	    Long usuarioid = dao.findIdByEmailAndSenha(usuario.getEmail(), usuario.getSenha());

	    if (usuarioid != null) {
	        Usuario usuarioExistente = dao.getId(usuarioid);
	        System.out.println("Usuário encontrado: " + usuarioExistente.getEmail());
	        view.addObject("tarefas", tarefaDao.getTarefasPorUsuario(usuarioExistente));
	        view.setViewName("listartarefas");
	        usuario_id = usuarioExistente.getId();
	    } else {
	        System.out.println("Variavel usuarioid: " + usuarioid);
	        view.addObject("mensagem", "Usuário ou senha incorretos");
	        view.setViewName("welcome");
	    }

	    return view;
	}
    

	

	
}
