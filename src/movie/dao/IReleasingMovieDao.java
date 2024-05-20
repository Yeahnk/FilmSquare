package movie.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import movie.vo.ReleasingMovieVO;

public interface IReleasingMovieDao {

	List<ReleasingMovieVO> getReleaseList(LocalDate calDate);

}
