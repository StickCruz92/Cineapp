package com.cine.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cine.app.model.Noticia;

public class NoticiasServiceImpl implements INoticiasService {

	// Constructor vacio. 
	public NoticiasServiceImpl() {
		
	}
	
	@Override
	public void guardar(Noticia noticia) {
		System.out.println("Guadando el objeto " + noticia + " en la base de datos.");
	}

	@Override
	public List<Noticia> buscarUltimas() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Noticia> buscarTodas() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void eliminar(int idNoticia) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Noticia buscarPorId(int idNoticia) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
