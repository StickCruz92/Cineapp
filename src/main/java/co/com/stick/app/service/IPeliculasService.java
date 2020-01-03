/**
 * 
 */
package co.com.stick.app.service;

import java.util.List;

import co.com.stick.app.model.Pelicula;

/**
 * @author Stick
 *
 */
public interface IPeliculasService {

	List<Pelicula> getAllMovie();
	
	Pelicula getPeliculaForId (int idPelicula);
	
	Pelicula getPeliculaForIdFecha (int idPelicula, String fecha);
	
	void InsertarPelicula(Pelicula pelicula);
	
}
