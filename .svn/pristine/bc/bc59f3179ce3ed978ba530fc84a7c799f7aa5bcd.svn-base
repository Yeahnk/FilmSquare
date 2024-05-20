package movie.dao;

import java.util.List;

import movie.vo.MovieInfoVO;
import util.MyBatisDao;

public class MovieInfoDaoImpl extends MyBatisDao implements IMovieInfoDao {
	
	private static IMovieInfoDao movieInfoDao;
	
	private MovieInfoDaoImpl() {}
	
	public static IMovieInfoDao getInstance() {
		
		if(movieInfoDao == null) {
			movieInfoDao = new MovieInfoDaoImpl();
		}
		return movieInfoDao;
		
	}
	
	

	@Override
	public List<MovieInfoVO> getMovieList(String kwd) {
		
		return selectList("movie.getMovieList", kwd);
	}

	@Override
	public MovieInfoVO getAMovie(int mvId) {
		return selectOne("movie.getMovieDetail", mvId);
	}

	@Override
	public List<MovieInfoVO> getActMovList(String kwd) {
		System.out.println("idididid"+kwd);
		return selectList("movie.getActMovList", kwd);
	}

	@Override
	public List<MovieInfoVO> getBoxOffice() {
		return selectList("movie.getBoxOffice");
	}

	@Override
	public List<Integer> getWatchedList(String memId) {
		return selectList("movie.getWatchedList", memId);
	}


}
