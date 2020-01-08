/**
 * 
 */
package co.com.stick.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.com.stick.app.model.Pelicula;
import co.com.stick.app.service.IPeliculasService;
import co.com.stick.app.util.Utileria;

/**
 * @author Stick
 *
 */
@Controller
@RequestMapping(value = "/peliculas")
public class PeliculasController {

	@Autowired
	private IPeliculasService servicePelicula;

	@GetMapping(value = "/index")
	public String mostrarIndex(Model model) {
		List<Pelicula> lista = servicePelicula.getAllMovie();
		model.addAttribute("peliculas", lista);
		return "peliculas/listPeliculas";
	}

	@GetMapping(value = "/create")
	public String crear(@ModelAttribute Pelicula pelicula, Model model) {
		model.addAttribute("generos", servicePelicula.buscarGenero());
		return "peliculas/fromPelicula";
	}

	@PostMapping(value = "/save")
	public String guardar(@ModelAttribute Pelicula pelicula, BindingResult result, RedirectAttributes attributes,
			@RequestParam("archivoImagen") MultipartFile multipartFile, HttpServletRequest request) {

		if (result.hasErrors()) {
			System.out.println("Existen errores");
			return "peliculas/fromPelicula";
		}

		if (!multipartFile.isEmpty()) {
			String nombreImagen = Utileria.guardarImagen(multipartFile, request);
			pelicula.setImagen(nombreImagen);
		}

		servicePelicula.InsertarPelicula(pelicula);
		// return "peliculas/fromPelicula";
		attributes.addFlashAttribute("mesanje", "La pelicula se agrego exitosamente");
		return "redirect:/peliculas/index";

	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));

	}

}
