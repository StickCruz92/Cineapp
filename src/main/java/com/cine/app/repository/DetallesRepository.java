package com.cine.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cine.app.model.Detalle;

@Repository
public interface DetallesRepository extends JpaRepository<Detalle, Integer> {

}
