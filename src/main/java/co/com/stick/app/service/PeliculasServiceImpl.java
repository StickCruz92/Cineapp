/**
 * 
 */
package co.com.stick.app.service;

import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;

import co.com.stick.app.model.Pelicula;

/**
 * @author Stick
 *
 */
@Service
public class PeliculasServiceImpl implements IPeliculasService{

	private List<Pelicula> listaPelicula = null;
	
	public PeliculasServiceImpl() {
		
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		
		try {

			listaPelicula = new LinkedList<>();

			Pelicula peli1 = new Pelicula();
			peli1.setId(1);
			peli1.setTitulo("Power Ranger");
			peli1.setDuracion(120);
			peli1.setClasificacion("B");
			peli1.setGenero("Aventura");
			peli1.setFechaEstreno(format.parse("31-12-2019"));
			peli1.setImagen("powerrangers.png");

			Pelicula peli2 = new Pelicula();
			peli2.setId(2);
			peli2.setTitulo("X-MEN Apocalisis");
			peli2.setDuracion(130);
			peli2.setClasificacion("B");
			peli2.setGenero("Ciencia ficción");
			peli2.setFechaEstreno(format.parse("31-12-2019"));
			peli2.setImagen("xmen.png");

			Pelicula peli3 = new Pelicula();
			peli3.setId(3);
			peli3.setTitulo("La maquina del tiempo");
			peli3.setDuracion(140);
			peli3.setClasificacion("B");
			peli3.setGenero("Drama");
			peli3.setFechaEstreno(format.parse("01-01-2020"));
			peli3.setImagen("lamaquina.png");
			peli3.setEstatus("Inactiva");

			Pelicula peli4 = new Pelicula();
			peli4.setId(4);
			peli4.setTitulo("Dragon Ball Super Broly");
			peli4.setDuracion(135);
			peli4.setClasificacion("B");
			peli4.setGenero("Animación");
			peli4.setFechaEstreno(format.parse("02-01-2020"));
			peli4.setImagen("dragon.png");

			Pelicula peli5 = new Pelicula();
			peli5.setId(5);
			peli5.setTitulo("Deadpool 2");
			peli5.setDuracion(140);
			peli5.setClasificacion("C");
			peli5.setGenero("Ciencia ficción");
			peli5.setFechaEstreno(format.parse("03-01-2020"));
			peli5.setImagen("deadpool.png");

			listaPelicula.add(peli1);
			listaPelicula.add(peli2);
			listaPelicula.add(peli3);
			listaPelicula.add(peli4);
			listaPelicula.add(peli5);

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			// TODO: handle exception
		} 
	}
	
	@Override
	public List<Pelicula> getAllMovie() {
		return listaPelicula;
	}

	@Override
	public Pelicula getPeliculaForId(int idPelicula) {
		return  listaPelicula.stream().
				filter(movie ->  movie.getId() == idPelicula).findAny()
                .orElse(null);
	}

	@Override
	public Pelicula getPeliculaForIdFecha(int idPelicula, String fecha) {
		SimpleDateFormat dateFormate = new SimpleDateFormat("dd-MM-yyyy");
		return listaPelicula.stream().
				filter(movie -> dateFormate.format(movie.getFechaEstreno()).equals(fecha) 
						&& movie.getId() == idPelicula).findAny()
                .orElse(null);
	}

	@Override
	public void InsertarPelicula(Pelicula pelicula) {
		listaPelicula.add(pelicula);
	}

	@Override
	public List<String> buscarGenero() {
		
		List<String> genero = new LinkedList<>();
		genero.add("Accion");
		genero.add("Aventura");
		genero.add("Clasica");
		genero.add("Comedia Romantica");
		genero.add("Drama");
		genero.add("Terror");
		genero.add("Infantil");
		genero.add("Acción y Avnetura");
		genero.add("Romantica");
		genero.add("Ciencia Ficción");
		genero.add("Comedia");
		genero.add("Horror");
		genero.add("Animación");
		genero.add("Suspenso");
		
		return genero;
	}

}
