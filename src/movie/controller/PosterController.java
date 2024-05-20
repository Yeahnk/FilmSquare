package movie.controller;

import movie.service.IPosterService;
import movie.service.PosterServiceImpl;
import movie.vo.PosterVO;

public class PosterController {
	
	static IPosterService posterService = PosterServiceImpl.getInstance();
	
	public PosterVO getPosterByMvId (int mvId) {
		return posterService.getPosterByMvId(mvId);
	}

}
