package com.cine.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cine.app.model.Pelicula;

@Repository
public interface PeliculasRepository extends JpaRepository<Pelicula, Integer> {
	
	// Listado de peliculas filtradas por estatus
	public List<Pelicula> findByEstatus_OrderByTitulo(String estatus);
	
}
