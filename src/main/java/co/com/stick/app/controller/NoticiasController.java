/**
 * 
 */
package co.com.stick.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.com.stick.app.model.Noticia;
import co.com.stick.app.service.INoticiasService;

/**
 * @author Stick
 *
 */
@Controller
@RequestMapping("/noticias")
public class NoticiasController {
	
	@Autowired
	private INoticiasService serviceNoticias;
	
	@GetMapping(value = "/create")
	public String crear() {
		return "noticias/formNoticia";
	}
	
	@PostMapping(value = "/save")
	public String guardar(Noticia noticia) {
		
		serviceNoticias.guardar(noticia);
		
		System.out.println(noticia);
		
		return "noticias/formNoticia";
	}

}
