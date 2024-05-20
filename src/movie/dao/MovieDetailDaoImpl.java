package movie.dao;

import java.sql.SQLException;
import java.util.List;

import collection.vo.CollectionVO;
import comment.vo.ReplyVO;
import movie.vo.MvGradeVO;
import movie.vo.MvLaterVO;
import movie.vo.MvPosterVO;
import movie.vo.MvcLikeVO;
import movie.vo.ActorVO;
import movie.vo.MvCollectionVO;
import movie.vo.MovieInfoVO;
import movie.vo.MvCommentVO;
import movie.vo.PosterVO;
import movie.vo.SottVO;
import movie.vo.VodVO;
import util.MyBatisDao;

public class MovieDetailDaoImpl extends MyBatisDao implements IMovieDetailDao{
	private static IMovieDetailDao movieDetailDao;
	
	private MovieDetailDaoImpl() {}
	
	public static IMovieDetailDao getInstance() {
		
		if(movieDetailDao == null) {
			movieDetailDao = new MovieDetailDaoImpl();
		}
		return movieDetailDao;
	}
	

	@Override
	public MovieInfoVO getMovieDetail(int mvId) {
		return selectOne("movie.getMovieDetail", mvId);
	}

	@Override
	public MvPosterVO getMoviePoster(int mvId) {
		return selectOne("movie.getMoviePoster", mvId);
	}

	@Override
	public MvGradeVO getMovieGrade(int mvId) {
		return selectOne("movie.getMovieGrade", mvId);
	}

	@Override
	public int laterInsert(MvLaterVO mlv) {
		return insert("movie.laterInsert", mlv);
	}

	// MovieDetailDaoImpl 또는 해당하는 Dao에서
	@Override
	public boolean isAlreadyAdded(MvLaterVO mlv) {
	    
		return (Boolean)selectOne("movie.isAlreadyAdded" ,mlv);
	}

	@Override
	public int cmtInsert(MvCommentVO cmtv) {
		return insert("movie.cmtInsert", cmtv);
	}

	@Override
	public List<ActorVO> getActorList(int mvId) {
		return selectList("movie.getActorList", mvId);
	}

	@Override
	public List<VodVO> getVodList(int mvId) {
		return selectList("movie.getVodList", mvId);
	}

	@Override
	public List<MvCollectionVO> getCltList(int mvId) {
		return selectList("movie.getCltList", mvId);
	}

	@Override
	public List<MvCommentVO> getCmtList(int mvId) {
		return selectList("movie.getCmtList", mvId);
	}

	@Override
	public int mvcLikeInsert(MvcLikeVO mvcLikev) {
		return insert("movie.mvcLikeInsert", mvcLikev);
	}

	@Override
	public int mvGradeInsert(MvGradeVO mvgv) {
		return insert("movie.mvGradeInsert", mvgv);
	}

	@Override
	public int mvgExist(MvGradeVO mvgv) {
		return selectOne("movie.mvgExist", mvgv);
	}

	@Override
	public int mvGradeUpdate(MvGradeVO mvgv) {
		return update("movie.mvGradeUpdate", mvgv);
	}

	@Override
	public MvGradeVO getMemGrade(MvGradeVO memGrade) {
		return selectOne("movie.getMemGrade", memGrade);
	}

	@Override
	public List<MvPosterVO> getCltPoster(int clId) {
		return selectList("movie.getCltPoster", clId);
	}

	@Override
	public List<MvCollectionVO> getMemCl(String memId) {
		return selectList("movie.getMemCl", memId);
	}

	@Override
	public int myClInsert(MvCollectionVO cv) {
		return insert("movie.myClInsert", cv);
	}

	@Override
	public MvCommentVO getMvMvc(MvCommentVO mvc) {
		System.out.println("직정여기!~"+mvc);
		return selectOne("getMvMvc",mvc);
	}

	@Override
	public int clExist(MvCollectionVO cv) {
		return selectOne("movie.clExist", cv);
	}

	@Override
	public int clInsert(MvCollectionVO cv) {
		return insert("movie.clInsert", cv);
	}

	@Override
	public MvCommentVO getCmtDetail(int mvcId) {
		return selectOne("movie.getCmtDetail", mvcId);
	}

	@Override
	public List<ReplyVO> getCmtReply(int mvcId) {
		return selectList("movie.getCmtReply", mvcId);
	}

	@Override
	public int mvcLikeExist(MvcLikeVO mvcLikev) {
		return selectOne("movie.mvcLikeExist", mvcLikev);
	}

	@Override
	public int mvcLikeDelete(MvcLikeVO mvcLikev) {
		return delete("movie.mvcLikeDelete", mvcLikev);
	}

	@Override
	public List<SottVO> getSottList(int mvId) {
		return selectList("movie.getSottList", mvId);
	}

	@Override
	public int mvcRpUpdate(ReplyVO rv) {
		return update("movie.mvcRpUpdate", rv);
	}

	@Override
	public int mvcRpDelete(int mvcreId) {
		return delete("movie.mvcRpDelete", mvcreId);
	}
	
	
	
	
	

}
