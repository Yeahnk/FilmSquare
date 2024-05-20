package movie.service;

import java.time.LocalDate;
import java.util.List;

import movie.vo.GradeVOforYE;
import movie.vo.MovieInfoVO;
import movie.vo.MvCommentVO;
import movie.vo.MvGradeVO;

public interface IMovieGradeService {

	int getGradeAvg(int mvId);
	
	int countAGrade(MvGradeVO grade);
	
	int countAllGrade(MvGradeVO grade);
	
	int countMostCommonGrade(MvGradeVO grade);

	List<GradeVOforYE> getGradeList(MvGradeVO mvGradeVO);

	List<GradeVOforYE> getMyDateWatchedList(MvGradeVO mvGradeVO);

	GradeVOforYE getAGradeByMvIdNMemId(GradeVOforYE grade);

	List<GradeVOforYE> getMonthGradeList(MvGradeVO mvGradeVO);

	int countGenre(MvCommentVO param);

	int getTotalRtime(String memId);

}
