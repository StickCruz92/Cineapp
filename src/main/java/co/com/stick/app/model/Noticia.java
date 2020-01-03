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
public class Noticia {

	private int id;
	private String titulo;
	private Date fecha;
	private String detalle;
	private String estatus;
	
	public Noticia() {
		this.estatus ="Activa";
		this.fecha = new Date();
	}
	
	public Noticia(int id, String titulo, Date fecha, String detalle, String estatus) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.fecha = fecha;
		this.detalle = detalle;
		this.estatus = estatus;
	}
	
	@Override
	public String toString() {
		return "Noticias [id=" + id + ", titulo=" + titulo + ", fecha=" + fecha + ", detalle=" + detalle + ", estatus="
				+ estatus + "]";
	}
}
