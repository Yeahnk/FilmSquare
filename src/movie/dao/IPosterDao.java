package movie.dao;

import java.util.List;

import movie.vo.PosterInfoVO;
import movie.vo.PosterVO;

public interface IPosterDao {

	PosterVO getPosterByMvId(int mvId);

	List<PosterInfoVO> pstInfo(long psId);

	List<PosterVO> getStillListByMvId(int mvId);
	
	
	

}
