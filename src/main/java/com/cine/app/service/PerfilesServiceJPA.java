/**
 * 
 */
package com.cine.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cine.app.model.Perfil;
import com.cine.app.repository.PerfilesRepository;

/**
 * @author Stick.stivenson
 *
 */
@Service
public class PerfilesServiceJPA implements IPerfilesService {

	@Autowired
	private PerfilesRepository perfilesRepo;

	@Override
	public void guardar(Perfil perfil) {
		perfilesRepo.save(perfil);
	}
}
