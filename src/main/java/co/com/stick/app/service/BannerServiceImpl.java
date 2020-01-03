/**
 * 
 */
package co.com.stick.app.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;

import co.com.stick.app.model.Banner;
/**
 * @author Stick
 *
 */
@Service
public class BannerServiceImpl implements IBannerService {

	private List<Banner> listoBanner = null;
	
	public BannerServiceImpl() {
	
		try {

			listoBanner = new LinkedList<>();

			Banner banner1 = new Banner();
			banner1.setId(1);
			banner1.setTitulo("Proximamente Kong La Isla Calavera");
			banner1.setArchivo("slide1.jpg");
			
			Banner banner2 = new Banner();
			banner2.setId(2);
			banner2.setTitulo("Estreno La bella y la bestia");
			banner2.setArchivo("slide2.jpg");
			
			Banner banner3 = new Banner();
			banner3.setId(3);
			banner3.setTitulo("Este mes no te pierdas Rapidos y Furiosos 8");
			banner3.setArchivo("slide3.jpg");
			
			Banner banner4 = new Banner();
			banner4.setId(4);
			banner4.setTitulo("Estreno en Agosto - Jefe en Pañales");
			banner4.setArchivo("slide4.jpg");

			Banner banner5 = new Banner();
			banner5.setId(5);
			banner5.setTitulo("Estreno en Agosto - Jefe en Pañales");
			banner5.setArchivo("slide5.jpg");
			banner5.setEstatus("Inactiva");

			listoBanner.add(banner1);
			listoBanner.add(banner2);
			listoBanner.add(banner3);
			listoBanner.add(banner4);
			listoBanner.add(banner5);

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			// TODO: handle exception
		} 
	}
	
	@Override
	public void GuardarBanner(Banner banner) {
		// TODO Auto-generated method stub
		listoBanner.add(banner);
	}

	@Override
	public List<Banner> ListarTodosBanner() {
		// TODO Auto-generated method stub
		return listoBanner;
	}

}
