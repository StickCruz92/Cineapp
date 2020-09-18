/**
 * 
 */
package com.cine.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cine.app.model.Usuario;
import com.cine.app.repository.UsuariosRepository;

/**
 * @author Stick.stivenson
 *
 **/
@Service
public class UsuariosServiceJPA implements IUsuariosService {

	@Autowired
	private UsuariosRepository usuariosRepo;
	
	@Override
	public void guardar(Usuario usuario) {
		usuariosRepo.save(usuario);
	}

	@Override
	public List<Usuario> buscarTodas() {
		return usuariosRepo.findAll();
	}

	@Override
	public Usuario buscarPorId(int idUsuario) {
		Optional<Usuario> optional = usuariosRepo.findById(idUsuario);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public void desactivarUsuario(int idUsuario) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Usuario> buscarActivas() {
		List<Usuario> usuarios = null;
		usuarios = usuariosRepo.findByActivo(1);
	  return usuarios;
	}
}
