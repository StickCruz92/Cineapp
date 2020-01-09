/**
 * 
 */
package co.com.stick.app.model;

import java.util.Arrays;
import java.util.List;

import lombok.Data;

/**
 * @author Stick
 *
 */
@Data
public class Contacto {

	private int id;
	private String nombre;
	private String email;
	private int rating;
	private String[] generos;
	private List<String> notificaciones;
	private String comentario;
	
	@Override
	public String toString() {
		return "Contacto [id=" + id + ", nombre=" + nombre + ", email=" + email + ", rating=" + rating + ", generos="
				+ Arrays.toString(generos) + ", notificaciones=" + notificaciones + ", comentario=" + comentario + "]";
	}
	
	
}

