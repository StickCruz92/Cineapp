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
public class Horario {
	
	private int id;
	private Date fecha;
	private String hora;
	private String sala;
	private double precio;
	private Pelicula pelicula;
	
	@Override
	public String toString() {
		return "Horario [id=" + id + ", fecha=" + fecha + ", hora=" + hora + ", sala=" + sala + ", precio=" + precio
				+ ", pelicula=" + pelicula + "]";
	}
	
	

}
