package movie.dao;

import java.time.LocalDate;
import java.util.List;

import movie.vo.GradeVOforYE;
import movie.vo.MovieInfoVO;
import movie.vo.MvCommentVO;
import movie.vo.MvGradeVO;

public interface IMovieGradeDao {

	int getGradeAvg(int mvId);

	int countAGrade(MvGradeVO grade);
	
	int countAllGrade(MvGradeVO grade);

	List<GradeVOforYE> getGradeList(MvGradeVO mvGradeVO);

	int countMostCommonGrade(MvGradeVO mvGradeVO);

	List<GradeVOforYE> getMyDateWatchedList(MvGradeVO mvGradeVO);

	GradeVOforYE getAGradeByMvIdNMemId(GradeVOforYE grade);

	List<GradeVOforYE> getMonthGradeList(MvGradeVO mvGradeVO);

	int countGenre(MvCommentVO param);

	int getTotalRtime(String memId);

}
