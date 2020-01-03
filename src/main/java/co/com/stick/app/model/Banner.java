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
public class Banner {

	private int id;
	private String titulo;
	private Date fecha; // Fecha pulicacion de banner
	private String archivo; // Atributo para guardar el nombre de la imagen
	private String estatus;

	public Banner() {
		this.fecha = new Date();
		this.estatus = "Activo";
	}
	
	@Override
	public String toString() {
		return "Banner [id=" + id + ", titulo=" + titulo + ", fecha=" + fecha + ", archivo=" + archivo + ", estatus="
				+ estatus + "]";
	}	
		
}
