/**
 * 
 */
package com.cine.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cine.app.model.Banner;
import com.cine.app.model.Genero;
import com.cine.app.repository.GenerosRepository;

/**
 * @author Stick.stivenson
 *
 */
@Service
public class GenerosServiceJPA implements IGenerosService{

	@Autowired
	private GenerosRepository generosRepo;
	
	@Override
	public void insertar(Genero genero) {
		generosRepo.save(genero);
	}

	@Override
	public List<Genero> buscarTodas() {
		return generosRepo.findAll();
	}

	@Override
	public Genero buscarPorId(int idGenero) {
		 Optional<Genero> optional = generosRepo.findById(idGenero);
		 if (optional.isPresent()) {
			 return optional.get();
		 }
		 return null;
	}

	@Override
	public void eliminar(int idGenero) {
		generosRepo.deleteById(idGenero);
	}


	@Override
	public List<Genero> generosActivos() {
		return generosRepo.findByEstatusOrderByNombreAsc("Activo");
	}

}
