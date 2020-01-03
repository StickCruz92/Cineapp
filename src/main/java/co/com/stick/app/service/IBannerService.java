package co.com.stick.app.service;

import java.util.List;

import co.com.stick.app.model.Banner;

public interface IBannerService {

	void GuardarBanner(Banner banner);
	
	List<Banner> ListarTodosBanner();
	
}
