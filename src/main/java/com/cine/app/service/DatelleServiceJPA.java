/**
 * 
 */
package com.cine.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cine.app.model.Detalle;
import com.cine.app.repository.DetallesRepository;

/**
 * @author Stick.stivenson
 *
 */
@Service
public class DatelleServiceJPA implements IDetalleService{

	@Autowired
    private DetallesRepository detalleRepo;
	
	@Override
	public void insertar(Detalle detalle) {
		detalleRepo.save(detalle);
	}

	@Override
	public void eliminar(int idDetalle) {
		detalleRepo.deleteById(idDetalle);
	}
}
