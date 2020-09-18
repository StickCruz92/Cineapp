package com.cine.app.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cine.app.model.Banner;
import com.cine.app.model.Horario;
import com.cine.app.model.Noticia;
import com.cine.app.model.Pelicula;
import com.cine.app.service.IBannersService;
import com.cine.app.service.IGenerosService;
import com.cine.app.service.IHorariosService;
import com.cine.app.service.INoticiasService;
import com.cine.app.service.IPeliculasService;
import com.cine.app.util.Utileria;

@Controller
public class HomeController {
	
	@Autowired
	private IBannersService serviceBanners;
	
	@Autowired
	private IPeliculasService servicePeliculas;
	
	@Autowired
	private IHorariosService serviceHorarios;
	
	//@Autowired
	//private IGenerosService serviceGeneros;
	
	// Inyectamos una instancia desde nuestro Root ApplicationContext
	@Autowired
	private INoticiasService serviceNoticias;
		
	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String buscar(@RequestParam("fecha") String fecha, Model model){
		try {	
		Date fechaSinHora = dateFormat.parse(dateFormat.format(fecha));
		List<String> listaFechas = Utileria.getNextDays(4);
		List<Pelicula> peliculas  = servicePeliculas.buscarPorFecha(fechaSinHora);
		//List<PeliculaView> peliculas = servicePeliculas.buscarTodas();
		model.addAttribute("fechas", listaFechas);
		model.addAttribute("fechaBusqueda", fecha);
		model.addAttribute("peliculas", peliculas);
		model.addAttribute("generos", servicePeliculas.buscarTodosGeneros());
		model.addAttribute("banners", serviceBanners.buscarActivos()); 
				
		return "home";
		} catch (ParseException e) {
			System.out.println("Error: HomeController.buscar" + e.getMessage());
		}
		return "home";
	}
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mostrarPrincipal(Model model) {

		List<String> listaFechas = Utileria.getNextDays(4);
		
		List<Pelicula> peliculas = servicePeliculas.buscarActivas();
		model.addAttribute("fechas", listaFechas);
		model.addAttribute("fechaBusqueda", dateFormat.format(new Date()));
		model.addAttribute("peliculas", peliculas);
		model.addAttribute("generos", servicePeliculas.buscarTodosGeneros());
		model.addAttribute("banners", serviceBanners.buscarActivos());

		return "home";
	}

	@RequestMapping(value = "/detail/{id}/{fecha}",method=RequestMethod.GET)		
	public String mostrarDetalle(Model model,@PathVariable("id") int idPelicula, @PathVariable("fecha") Date fecha) {
		List<Horario> horarios = serviceHorarios.buscarPorIdPelicula(idPelicula, fecha);
		model.addAttribute("horarios", horarios);
		model.addAttribute("fechaBusqueda", dateFormat.format(fecha));
		model.addAttribute("pelicula", servicePeliculas.buscarPorId(idPelicula));
		model.addAttribute("generos", servicePeliculas.buscarTodosGeneros());
		// TODO - Buscar en la base de datos los horarios.		
		
		return "detalle";
	}

	/**
	 * Metodo que muestra la vista de la pagina de Acerca
	 * @return
	 */
	@RequestMapping(value = "/about")
	public String mostrarAcerca() {			
		return "acerca";
	}
	
	@RequestMapping(value = "formLogin", method = RequestMethod.GET)
	public String mostrarLogin() {
		return "formLogin";
	}
	
	@ModelAttribute("noticias")
	public List<Noticia> getNoticias(){
		return serviceNoticias.buscarUltimas();
	}
	
	@ModelAttribute("banners")
	public List<Banner> getBanners(){
		return serviceBanners.buscarActivos();
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
