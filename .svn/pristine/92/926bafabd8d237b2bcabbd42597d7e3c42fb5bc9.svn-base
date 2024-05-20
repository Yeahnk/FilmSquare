package movie.dao;

import java.time.LocalDate;
import java.util.List;

import movie.vo.GradeVOforYE;
import movie.vo.MovieInfoVO;
import movie.vo.MvCommentVO;
import movie.vo.MvGradeVO;
import util.MyBatisDao;

public class MovieGradeDaoImpl extends MyBatisDao implements IMovieGradeDao {
	
	private static IMovieGradeDao singleTon;
	
	private MovieGradeDaoImpl() {};
	
	public static IMovieGradeDao getInstance() {
		if( singleTon ==null ) {
			singleTon = new MovieGradeDaoImpl();
		}
		return singleTon;
	}

	@Override
	public int getGradeAvg(int mvId) {
		return selectOne("movieGrade.getGradeAvg", mvId);
	}

	@Override
	public int countAGrade(MvGradeVO grade) {
		return selectOne("movieGrade.countAGrade", grade);
	}

	@Override
	public int countAllGrade(MvGradeVO grade) {
		return selectOne("movieGrade.countAllGrade", grade);
	}

	@Override
	public List<GradeVOforYE> getGradeList(MvGradeVO mvGradeVO) {
		return selectList("movieGrade.getGradeList", mvGradeVO);
	}

	@Override
	public int countMostCommonGrade(MvGradeVO grade) {
		return selectOne("movieGrade.countMostCommonGrade", grade);
	}

	@Override
	public List<GradeVOforYE> getMyDateWatchedList(MvGradeVO mvGradeVO) {
		return selectList("movieGrade.getMyDateWatchedList", mvGradeVO);
	}

	@Override
	public GradeVOforYE getAGradeByMvIdNMemId(GradeVOforYE grade) {
		return selectOne("movieGrade.getAGradeByMvIdNMemId", grade);
	}

	@Override
	public List<GradeVOforYE> getMonthGradeList(MvGradeVO mvGradeVO) {
		return selectList("movieGrade.getMonthGradeList", mvGradeVO);
	}

	@Override
	public int countGenre(MvCommentVO param) {
		return selectOne("movieGrade.countGenre", param);
	}

	@Override
	public int getTotalRtime(String memId) {
		return selectOne("movieGrade.getTotalRtime", memId);
	}

}
