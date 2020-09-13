package pruebasrelaciones;

import java.util.List;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cine.app.model.Pelicula;
import com.cine.app.repository.PeliculasRepository;

public class AppFindAll {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
		//Recuperar todas las entidades de tipo PeliculaView
		PeliculasRepository repo = context.getBean("peliculasRepository", PeliculasRepository.class);
		List<Pelicula> lista= repo.findAll();
		
		for (Pelicula p : lista) {
			System.out.println(p);
		}
				
		context.close();

	}

}
