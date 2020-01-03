/**
 * 
 */
package co.com.stick.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.com.stick.app.model.Banner;
import co.com.stick.app.service.IBannerService;
import co.com.stick.app.util.Utileria;

/**
 * @author Stick
 *
 */
@Controller
@RequestMapping("/banners")
public class BannerController {

	@Autowired
	private IBannerService serviceBanner;
	
	@GetMapping("/index")
	public String mostrarIndex(Model model) {
		List<Banner> banners = serviceBanner.ListarTodosBanner();
		model.addAttribute("banners", banners);
		return "banners/listBanners";
	}
	
	
	@GetMapping("/create")
	public String crear() {
	  return "banners/formBanner";	
	}
	
	@PostMapping("/save")
	public String guardar(Banner banner, BindingResult result, RedirectAttributes attributes, 
			@RequestParam("archivoImagen") MultipartFile multipartFile, HttpServletRequest request) {
		
		if (result.hasErrors()) {
			System.out.println("Existen errores");
			return "banners/formBanner";
		}

		if (!multipartFile.isEmpty()) {
			String nombreImagen = Utileria.guardarImagen(multipartFile, request);
			banner.setArchivo(nombreImagen);
		}

		serviceBanner.GuardarBanner(banner);
		attributes.addFlashAttribute("mesanje", "La pelicula se agrego exitosamente");		
		return "redirect:/banners/index";
	}
	
	
}
