/**
 * 
 */
package com.cine.app.service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cine.app.model.Genero;
import com.cine.app.model.Horario;
import com.cine.app.model.Pelicula;
import com.cine.app.repository.GenerosRepository;
import com.cine.app.repository.HorariosRepository;
import com.cine.app.repository.PeliculasRepository;

/**
 * @author Stick.stivenson
 *
 */
@Service
public class PeliculasServiceJPA implements IPeliculasService{

	// Inyectamos una instancia desde nuestro Root ApplicationContext.
    @Autowired	
	private HorariosRepository horariosRepo;
	
    // Inyectamos una instancia desde nuestro Root ApplicationContext.
    @Autowired
	private PeliculasRepository peliculasRepo;
    
    // Inyectamos una instancia desde nuestro Root ApplicationContext.
    @Autowired
	private GenerosRepository generosRepo;
	
	@Override
	public void insertar(Pelicula pelicula) {
		peliculasRepo.save(pelicula);
	}

	@Override
	public List<Pelicula> buscarTodas() {
		return peliculasRepo.findAll();
	}

	@Override
	public Pelicula buscarPorId(int idPelicula) {
		Optional<Pelicula> optional = peliculasRepo.findById(idPelicula);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public void eliminar(int idPelicula) {
		peliculasRepo.deleteById(idPelicula);
	}

	@Override
	public Page<Pelicula> buscarTodas(Pageable page) 
	{
		return peliculasRepo.findAll(page);
	}
	
	@Override
	public List<Pelicula> buscarPorFecha(Date fecha) {		
		List<Pelicula> peliculas = null;
		// Buscamos en la tabla de horarios, [agrupando por idPelicula]
		List<Horario> horarios = horariosRepo.findByFecha(fecha);
		peliculas = new LinkedList<>();

		// Formamos la lista final de Peliculas que regresaremos.
		for (Horario h : horarios) {
			// Solo nos interesa de cada registro de horario, el registro de pelicula.
			peliculas.add(h.getPelicula());
		}		
		return peliculas;
	}
	
	@Override
	public List<Pelicula> buscarActivas() {
		List<Pelicula> peliculas = null;
		peliculas = peliculasRepo.findByEstatus_OrderByTitulo("Activa");
		return peliculas;
	}
	
	@Override
	public List<String> buscarGeneros() {
		    List<Genero> Listgeneros = generosRepo.findAll();
		    if (Listgeneros.size() > 0) {
				List<String> generos = new LinkedList<>();
			    for (Genero genero : Listgeneros) {
			    	generos.add(genero.getNombre());
				}
				return generos;
		    }
			return null;
	}

	@Override
	public List<Genero> buscarTodosGeneros() {
		return generosRepo.findAll();
	}

}
