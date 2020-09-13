/**
 * 
 */
package com.cine.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cine.app.model.Genero;
import com.cine.app.service.IGenerosService;

/**
 * @author Stick.stivenson
 *
 */
@Controller
@RequestMapping("/generos")
public class GenerosController {

	@Autowired
	private IGenerosService serviceGeneros;
	
	@GetMapping("/index")
	public String mostrarIndex(Model model) {
		List<Genero> lista = serviceGeneros.buscarTodas();
		model.addAttribute("generos", lista);
		return "generos/listGenero";
	}
	
	@GetMapping("/create")
	public String crear(@ModelAttribute Genero genero, Model model) {
		return "generos/formGenero";
	}
	
	@PostMapping(value = "/save")
	public String guardar(@ModelAttribute Genero genero, BindingResult result, Model model, RedirectAttributes attributes) {				
		
		if (result.hasErrors()){
			List<Genero> listaGeneros = serviceGeneros.buscarTodas();
			model.addAttribute("generos", listaGeneros);
			return "generos/formGenero";
		}
		
		serviceGeneros.insertar(genero);
		attributes.addFlashAttribute("msg", "El genero de fue guardado!");
		return "redirect:/generos/index";
		//return "redirect:/horarios/indexPaginate";
	}
	
	@GetMapping(value = "/edit/{id}")
	public String editar(@PathVariable("id") int idGenero, Model model) {
		Genero genero = serviceGeneros.buscarPorId(idGenero);
		model.addAttribute("genero", genero);
		return "generos/formGenero";
	}
	
	@GetMapping(value = "/delete/{id}")
	public String eliminar(@PathVariable("id") int idGenero, RedirectAttributes attributes) {
		serviceGeneros.eliminar(idGenero);
	
		attributes.addFlashAttribute("mensaje", "El genero se elimino exitosamente");
		return "redirect:/generos/index";
	}
	
}
