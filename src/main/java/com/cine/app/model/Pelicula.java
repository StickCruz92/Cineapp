package com.cine.app.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Peliculas")
public class Pelicula {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) // auto_increment MySQL
	private int id;
	private String titulo;
	private int duracion;
	private String clasificacion;
	private String imagen = "cinema.png"; // imagen por default	
	private Date fechaEstreno;	
	private String estatus="Activa";
	
	//@Transient // ignorar este atributo durante la persistencia
	@OneToOne
	@JoinColumn(name="idDetalle")
	private Detalle detalle;
	
	//@OneToMany(mappedBy="pelicula",fetch=FetchType.EAGER)
	//private List<Horario> horarios;
	
	private int idGenero;
	
	public Pelicula() {
		//System.out.println("Constructor PeliculaView");
	}
	
	public Detalle getDetalle() {
		return detalle;
	}
	
	public void setDetalle(Detalle detalle) {
		this.detalle = detalle;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}
	public String getClasificacion() {
		return clasificacion;
	}
	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public Date getFechaEstreno() {
		return fechaEstreno;
	}
	public void setFechaEstreno(Date fechaEstreno) {
		this.fechaEstreno = fechaEstreno;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public int getIdGenero() {
		return idGenero;
	}

	public void setIdGenero(int idGenero) {
		this.idGenero = idGenero;
	}

	@Override
	public String toString() {
		return "Pelicula [id=" + id + ", titulo=" + titulo + ", duracion=" + duracion + ", clasificacion="
				+ clasificacion + ", imagen=" + imagen + ", fechaEstreno=" + fechaEstreno + ", estatus=" + estatus
				+ ", detalle=" + detalle + ", idGenero=" + idGenero + "]";
	}


}
