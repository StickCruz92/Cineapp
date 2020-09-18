/**
 * 
 */
package com.cine.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cine.app.model.Usuario;

/**
 * @author Stick.stivenson
 *
 */
@Repository
public interface UsuariosRepository extends JpaRepository<Usuario, Integer> {
	public List<Usuario> findByActivo(int activa);

}
