package movie.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import movie.vo.ReleasingMovieVO;
import util.MyBatisDao;

public class ReleasingMovieDaoImple extends MyBatisDao implements IReleasingMovieDao {

	private static IReleasingMovieDao releasingMovieDao;
	
	private ReleasingMovieDaoImple() {

	}
	
	public static IReleasingMovieDao getInstance() {
		if(releasingMovieDao == null) {
			releasingMovieDao = new ReleasingMovieDaoImple();
		}
		
		return releasingMovieDao;
	}

	@Override
	public List<ReleasingMovieVO> getReleaseList(LocalDate calDate) {
		return selectList("releasingMovie.getReleaseList", calDate);
	}
	
	
	
	
}
