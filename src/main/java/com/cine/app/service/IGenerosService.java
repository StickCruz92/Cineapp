package com.cine.app.service;

import java.util.List;

import com.cine.app.model.Genero;

public interface IGenerosService {

	void insertar(Genero genero);	
	List<Genero> buscarTodas();
	Genero buscarPorId(int idGenero);
	void eliminar(int idGenero);
	List<Genero> generosActivos();
	
}
