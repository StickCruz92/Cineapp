/**
 * 
 */
package com.cine.app.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.cine.app.model.Horario;
import com.cine.app.repository.HorariosRepository;

/**
 * @author Stick.stivenson
 *
 */
@Service
public class HorariosServiceJPA implements IHorariosService{

	// Inyectamos una instancia desde nuestro Root ApplicationContext.
    @Autowired
	private HorariosRepository horariosRepo;
	
	@Override
	public List<Horario> buscarPorIdPelicula(int idPelicula, Date fecha) {
		return horariosRepo.findByPelicula_IdAndFechaOrderByHora(idPelicula,fecha);		
	}

	@Override
	public void insertar(Horario horario) {
		horariosRepo.save(horario);
	}

	@Override
	public List<Horario> buscarTodos() {
		return horariosRepo.findAll();
	}
	
	@Override
	public Page<Horario> buscarTodos(Pageable page) {
		return horariosRepo.findAll(page);
	}

	@Override
	public void eliminar(int idHorario) {
		// horariosRepo.delete(idHorario); // Spring 4.3		
		horariosRepo.deleteById(idHorario);
	}

	@Override
	public Horario buscarPorId(int idHorario) {
		Optional<Horario> optional = horariosRepo.findById(idHorario);
		if (optional.isPresent())
			return optional.get();
		return null;
	}

	@Override
	public Page<Horario> buscarTodos(int page, int size) {
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(Sort.Direction.DESC, "fecha"));
		return horariosRepo.findAll(pageable);
	}

}
