/**
 * 
 */
package co.com.stick.app.model;

import lombok.Data;

/**
 * @author Stick
 *
 */
@Data
public class Detalle {

	private String director;
	private String actores;
	private String sinopsis;
	private String trailer;
	
	public Detalle() {
	}
	
	public Detalle(String director, String actores, String sinopsis, String trailer) {
		super();
		this.director = director;
		this.actores = actores;
		this.sinopsis = sinopsis;
		this.trailer = trailer;
	}
	
	
	 
}
