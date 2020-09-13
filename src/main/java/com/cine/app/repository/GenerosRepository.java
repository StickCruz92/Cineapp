/**
 * 
 */
package com.cine.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cine.app.model.Genero;
/**
 * @author Stick.stivenson
 *
 */
@Repository
public interface GenerosRepository  extends JpaRepository<Genero, Integer> {

    List<Genero> findByEstatusOrderByNombreAsc(String estatus);
	
}
