package com.cine.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cine.app.model.Banner;

/** Marcamos esta clase como un Bean de tipo Repository en nuestro Root ApplicationContext.
	Nota: La anotacion @Repository es opcional ya que al extender la interfaz JpaRepository Spring 
	crea una instancia en nuestro Root ApplicationContext.
 * @param <Banner>
*/
@Repository
public interface BannersRepository extends JpaRepository<Banner, Integer> {

    List<Banner> findByEstatusOrderByIdDesc(String estatus);
}

