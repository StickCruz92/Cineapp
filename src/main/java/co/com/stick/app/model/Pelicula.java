/**
 * 
 */
package co.com.stick.app.model;

import java.util.Date;

import lombok.Data;

/**
 * @author Stick
 *
 */
@Data
public class Pelicula {

	private int id;
	private String titulo;
	private int duracion = 100;
	private String clasificacion;
	private String genero;
	private String imagen = "cinema.png";
	private Date fechaEstreno;
	private String estatus = "Activa";
	
	private Detalle detalle;
	
	public Pelicula() {
		System.out.println("Iniciando el constructor de la clace Pelicula");
	}
	
	public Pelicula(int id, String titulo, int duracion, String clasificacion, String genero, String imagen,
			Date fechaEstreno, String estatus) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.duracion = duracion;
		this.clasificacion = clasificacion;
		this.genero = genero;
		this.imagen = imagen;
		this.fechaEstreno = fechaEstreno;
		this.estatus = estatus;
	}
	

	@Override
	public String toString() {
		return "Pelicula [id=" + id + ", titulo=" + titulo + ", duracion=" + duracion + ", clasificacion="
				+ clasificacion + ", genero=" + genero + ", imagen=" + imagen + ", fechaEstreno=" + fechaEstreno
				+ ", estatus=" + estatus + ", detalle=" + detalle + "]";
	}
	
	
	
}
