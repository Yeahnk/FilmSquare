package movie.dao;

import java.util.List;

import movie.vo.PosterInfoVO;
import movie.vo.PosterVO;
import util.MyBatisDao;

public class PosterDaoImpl extends MyBatisDao implements IPosterDao {
	
	private static IPosterDao posterDao;
	
	private PosterDaoImpl() {}
	
	public static IPosterDao getInstance() {
		
		if(posterDao == null) {
			posterDao = new PosterDaoImpl();
		}
		return posterDao;
		
	}

	@Override
	public PosterVO getPosterByMvId(int mvId) {
		return selectOne("poster.getPosterByMvId", mvId);
	}

	@Override
	public List<PosterInfoVO> pstInfo(long psId) {
		
		return selectList("poster.pstInfo",psId);
	}

	@Override
	public List<PosterVO> getStillListByMvId(int mvId) {
		return selectList("poster.getStillListByMvId", mvId);
	}

	
	

}
