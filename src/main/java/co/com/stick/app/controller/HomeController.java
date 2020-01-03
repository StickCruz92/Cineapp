package co.com.stick.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.com.stick.app.model.Pelicula;
import co.com.stick.app.service.IBannerService;
import co.com.stick.app.service.IPeliculasService;
import co.com.stick.app.util.Utileria;

@Controller
public class HomeController {

	@Autowired
	private IPeliculasService iPeliculasService;
	
	@Autowired
	private IBannerService serviceBanners;
	
	private SimpleDateFormat dateFormate = new SimpleDateFormat("dd-MM-yyyy");

	@GetMapping(value = "/home")
	private String goHome() {
		return "home";
	}
	
	
	@PostMapping(value = "/search")
	private String buscar(Model model, @RequestParam("fecha") String fecha) {
		List<String> listaFecha = Utileria.getNextDays(4);

		List<Pelicula> peliculas = iPeliculasService.getAllMovie().stream().
				filter(movie -> dateFormate.format(movie.getFechaEstreno()).
				equals(fecha)).collect(Collectors.toList());	
		model.addAttribute("peliculas", peliculas);
		model.addAttribute("fechas", listaFecha);
		model.addAttribute("fechaBusqueda",fecha);
		model.addAttribute("banners", serviceBanners.ListarTodosBanner()); // Ejercicio : Solucion
		
		return "home";
	}

	@GetMapping(value = "/")
	private String mostrarPrincipal(Model model) {

		List<String> listaFecha = Utileria.getNextDays(4);
		List<Pelicula> peliculas = iPeliculasService.getAllMovie();
		model.addAttribute("peliculas", peliculas);
		model.addAttribute("fechas", listaFecha);
		model.addAttribute("fechaBusqueda", dateFormate.format(new Date()));
		model.addAttribute("banners", serviceBanners.ListarTodosBanner()); // Ejercicio : Solucion

		return "home";
	}


	@GetMapping(value = "/detail")
	public String mostrarDetalle(Model model, @RequestParam("idMovie") int idPelicula, @RequestParam("fecha") String fecha) {

		model.addAttribute("pelicula", iPeliculasService.getPeliculaForId(idPelicula));

		return "detalle";
	}

}
