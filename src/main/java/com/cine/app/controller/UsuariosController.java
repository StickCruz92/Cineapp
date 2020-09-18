/**
 * 
 */
package com.cine.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cine.app.model.Perfil;
import com.cine.app.model.Usuario;
import com.cine.app.service.IPerfilesService;
import com.cine.app.service.IUsuariosService;

/**
 * @author Stick.stivenson
 *
 */
@Controller
@RequestMapping("/usuarios")
public class UsuariosController {

	@Autowired
	private IUsuariosService serviceUsuarios;
	
	@Autowired
	private IPerfilesService servicePerfiles;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("/index")
	public String mostrarindex(Model model) {
		List<Usuario> list = serviceUsuarios.buscarTodas();
		model.addAttribute("usuarios", list);
	   return "usuarios/listUsuarios";
	}
	
	@GetMapping("/create")
	public String crear(@ModelAttribute Usuario usuario) {
		return "usuarios/formUsuario";
	}
	
	@PostMapping("/save")
	public String Guardar(@ModelAttribute Usuario usuario, @RequestParam("perfil") String perfil) {
		System.out.println("usuario" + usuario);
		System.out.println("perfil " + perfil);
		
		if (usuario.getId() > 0) 
		{
			serviceUsuarios.guardar(usuario);
			
		} else {
			
			String tmpPass = usuario.getPwd();
			String encriptado = encoder.encode(tmpPass);
			usuario.setPwd(encriptado);
			usuario.setActivo(1);
			serviceUsuarios.guardar(usuario);
			
			Perfil perfilTemp = new Perfil();
			perfilTemp.setCuenta(usuario.getCuenta());
			perfilTemp.setPerfil(perfil);
			servicePerfiles.guardar(perfilTemp);
			
		}
	
		return "redirect:/usuarios/index";
	}
	
	@GetMapping(value = "/edit/{id}")
	public String editar(@PathVariable("id") int idUsuario, Model model) {
		Usuario usuario = serviceUsuarios.buscarPorId(idUsuario);
		model.addAttribute("usuario", usuario);
		return "usuarios/formUsuario";
	}
	
	@GetMapping("/demo-bcrypt")
	public String pruebaBCrypt() {
		String password="mari123";
		String encriptado=encoder.encode(password);
		System.out.println("Password encriptado " + encriptado);
		return "usuarios/demo";
	}
	
}
