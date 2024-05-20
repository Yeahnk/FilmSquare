package movie.service;

import java.util.List;

import movie.dao.IPosterDao;
import movie.dao.PosterDaoImpl;
import movie.vo.PosterInfoVO;
import movie.vo.PosterVO;

public class PosterServiceImpl implements IPosterService{
	
	static IPosterDao posterDao = PosterDaoImpl.getInstance();
	private static IPosterService posterService;
	
	private PosterServiceImpl() {}
	
	public static IPosterService getInstance() {
		
		if(posterService == null) {
			posterService = new PosterServiceImpl();
		}
		return posterService;
		
	}

	@Override
	public PosterVO getPosterByMvId(int mvId) {
		return posterDao.getPosterByMvId(mvId);
	}

	@Override
	public List<PosterInfoVO> pstInfo(long psId) {
		
		return posterDao.pstInfo(psId);
	}

	@Override
	public List<PosterVO> getStillListByMvId(int mvId) {
		// TODO Auto-generated method stub
		return posterDao.getStillListByMvId(mvId);
	}


}
