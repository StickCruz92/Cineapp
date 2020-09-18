/**
 * 
 */
package com.cine.app.service;

import java.util.List;

import com.cine.app.model.Usuario;

/**
 * @author Stick.stivenson
 *
 */
public interface IUsuariosService {
	void guardar(Usuario usuario);
	List<Usuario> buscarTodas();
	Usuario buscarPorId(int idUsuario);
	void desactivarUsuario(int idUsuario);
    List<Usuario> buscarActivas();	
}
