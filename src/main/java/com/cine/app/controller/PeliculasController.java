package com.cine.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cine.app.model.Pelicula;
import com.cine.app.service.IDetalleService;
import com.cine.app.service.IGenerosService;
import com.cine.app.service.IPeliculasService;
import com.cine.app.util.Utileria;

@Controller
@RequestMapping("/peliculas")
public class PeliculasController {
	
	@Autowired
	private IPeliculasService servicePeliculas;
	
	@Autowired
	private IDetalleService serviceDetalles;
	
	@Autowired
	private IGenerosService serviceGeneros;

	@GetMapping("/index")
	public String mostrarIndex(Model model) {
		List<Pelicula> lista = servicePeliculas.buscarTodas();
		model.addAttribute("peliculas", lista);
		model.addAttribute("generos", serviceGeneros.generosActivos());
		return "peliculas/listPeliculas";
	}
	
	@GetMapping("/create")
	public String crear(@ModelAttribute Pelicula pelicula, Model model) {
		//model.addAttribute("generos", servicePeliculas.buscarGeneros());
		model.addAttribute("generos", serviceGeneros.generosActivos());
		return "peliculas/formPelicula";
	}
	
	@PostMapping("/save")
	public String guardar(@ModelAttribute Pelicula pelicula, BindingResult result, RedirectAttributes attributes,
			@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request) {
		
		if (result.hasErrors()) {
			//System.out.println("Existieron errores");
			return "peliculas/formPelicula";
		}
		
		System.out.println("HOLA GENERACION " + pelicula );
		
		System.out.println("HOLA GENERACION " + pelicula.getIdGenero());
		
		if (!multiPart.isEmpty()) {
			String nombreImagen = Utileria.guardarImagen(multiPart,request);
			pelicula.setImagen(nombreImagen);
		}
		
		serviceDetalles.insertar(pelicula.getDetalle());
		servicePeliculas.insertar(pelicula);	
    	attributes.addFlashAttribute("mensaje", "El registro fue guardado");		
		return "redirect:/peliculas/index";
	}	
	
	@GetMapping(value = "/edit/{id}")
	public String editar(@PathVariable("id") int idPelicula, Model model) {
		Pelicula pelicula = servicePeliculas.buscarPorId(idPelicula);
		model.addAttribute("generos", serviceGeneros.generosActivos());
		model.addAttribute("pelicula", pelicula);
		return "peliculas/formPelicula";
	}
	
	@GetMapping(value = "/delete/{id}")
	public String eliminar(@PathVariable("id") int idPelicula, RedirectAttributes attributes) {
		Pelicula pelicula = servicePeliculas.buscarPorId(idPelicula);
		
		// primero eliminar la pelicula
		servicePeliculas.eliminar(idPelicula);
		
		// despues de eliminar la pelicula eliminar el detalle
		serviceDetalles.eliminar(pelicula.getDetalle().getId());
		attributes.addFlashAttribute("mensaje", "La pelicula fue eliminada");
		return "redirect:/peliculas/index";
	}
	
	/**
	 * Metodo que muestra la lista de peliculas con paginacion
	 * @param model
	 * @param page
	 * @return
	 */
	@GetMapping(value = "/indexPaginate")
	public String mostrarIndexPaginado(Model model, Pageable page) 
	{
		Page<Pelicula> lista = servicePeliculas.buscarTodas(page);
		model.addAttribute("peliculas", lista);
		return "peliculas/listPeliculas";
	}

	/**
	 * Agregamos al Model la lista de Generos: De esta forma nos evitamos agregarlos en los metodos
	 * crear y editar. 
	 * @return
	 */
	@ModelAttribute("generos")
	public List<String> getGeneros(){
		return servicePeliculas.buscarGeneros();
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
