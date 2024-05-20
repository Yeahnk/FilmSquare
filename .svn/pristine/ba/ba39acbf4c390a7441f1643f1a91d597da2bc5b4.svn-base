package movie.dao;

import movie.vo.MvGradeVO;
import movie.vo.MvLaterVO;
import movie.vo.MvPosterVO;
import movie.vo.MvcLikeVO;

import java.util.List;

import collection.vo.CollectionVO;
import comment.vo.ReplyVO;
import movie.vo.ActorVO;
import movie.vo.MvCollectionVO;
import movie.vo.MovieInfoVO;
import movie.vo.MvCommentVO;
import movie.vo.PosterVO;
import movie.vo.SottVO;
import movie.vo.VodVO;

public interface IMovieDetailDao {
	/**
	 * 홈에서 영화를 선택하면 mvId를 받아 상세페이지에 해당 영화의 정보를 가져오기 위한 메서드
	 * @param mvId
	 * @return 선택한 MovieInfoVO
	 */
	public MovieInfoVO getMovieDetail(int mvId);
	
	/**
	 * 홈에서 영화를 선택하면 mvId를 받아 상세페이지에 해당 영화의 포스터를 가져오기 위한 메서드
	 * @param mvId
	 * @return 선택한 MovieInfoVO
	 */
	public MvPosterVO getMoviePoster(int mvId);
	
	/**
	 * 메인에서 영화를 선택하면 mvId를 받아 상세페이지에 해당 영화의 평균 별점을 가져오기 위한 메서드
	 * @param mvId
	 * @return
	 */
	public MvGradeVO getMovieGrade(int mvId);
	
	/**
	 * 보고싶어요를 클릭하면 '나중에 볼 영화'에 등록되는 메서드
	 * @param mlv
	 * @return
	 */
	public int laterInsert(MvLaterVO mlv);

	/**
	 * 나중에 볼 영화에 이미 추가되었는지 검사하는 메서드
	 * @param mlv
	 * @return
	 */
	public boolean isAlreadyAdded(MvLaterVO mlv);
	
	/**
	 * 영화 코멘트를 등록하는 메서드
	 * @param cmtv
	 * @return
	 */
	public int cmtInsert(MvCommentVO cmtv);
	
	/**
	 * 해당 영화의 출연/제작 리스트를 불러오는 메서드
	 * @param mvId
	 * @return 출연/제작 리스트
	 */
	public List<ActorVO> getActorList(int mvId);
	
	/**
	 * 해당 영화의 예고편 리스트를 불러오는 메서드
	 * @param mvId
	 * @return 예고편 리스트
	 */
	public List<VodVO> getVodList(int mvId);
	
	/**
	 * 해당 영화가 포함된 컬렉션들을 불러오는 메서드
	 * @param mvId
	 * @return 파라미터 영화가 들어있는 컬렉션
	 */
	public List<MvCollectionVO> getCltList(int mvId);
	
	/**
	 * 해당 영화에 작성한 코멘트들을 불러오는 메서드
	 * @param mvId
	 * @return 해당 영화 코멘트
	 */
	public List<MvCommentVO> getCmtList(int mvId);
	
	/**
	 * 코멘트에 대한 좋아요를 누르면 데이터에 저장되는 메서드
	 * @param mvcLikev
	 * @return
	 */
	public int mvcLikeInsert(MvcLikeVO mvcLikev);
	

	/**
	 * 별을 클릭하면 영화에 대한 평가가 저장되는 메서드
	 * @param mvgv
	 * @return
	 */
	public int mvGradeInsert(MvGradeVO mvgv);
	
	/**
	 * 별점이 존재하는지 확인하는 메서드
	 * @param mvgv
	 * @return
	 */
	public int mvgExist(MvGradeVO mvgv);
	
	/**
	 * 이미 별점이 존재할 때 별점을 업데이트하는 메서드
	 * @param mvgv
	 * @return
	 */
	public int mvGradeUpdate(MvGradeVO mvgv);
	
	/**
	 * 접속한 사용자의 해당 영화 별점을 가져오는 메서드
	 * @param memGrade
	 * @return
	 */
	public MvGradeVO getMemGrade(MvGradeVO memGrade);
	
	/**
	 * 컬렉션에 들어있는 영화의 포스터를 가져오는 메서드
	 * @param mvId 
	 * @return
	 */
	public List<MvPosterVO> getCltPoster(int clId);
	
	/**
	 * 접속자 컬렉션 리스트
	 * @param memId
	 * @return
	 */
	public List<MvCollectionVO> getMemCl(String memId);
	
	/**
	 * 나의 컬렉션에 담기
	 * @param cv
	 * @return
	 */
	public int myClInsert(MvCollectionVO cv);
	
	/**
	 * 나의 컬렉션에 해당 영화가 있는지 확인
	 * @param cv
	 * @return
	 */
	public int clExist(MvCollectionVO cv);
	
	/**
	 * 나의 컬렉션 새로 만들기
	 * @param cv
	 * @return
	 */
	public int clInsert(MvCollectionVO cv);

	public MvCommentVO getMvMvc(MvCommentVO mvc);
	
	/**
	 * 코멘트 상세리스트
	 * @param mvcId
	 * @return
	 */
	public MvCommentVO getCmtDetail(int mvcId);
	
	/**
	 * 코멘트댓글 리스트
	 * @param mvcId
	 * @return
	 */
	public List<ReplyVO> getCmtReply(int mvcId);
	
	/**
	 * 접속자의 코멘트 좋아요 여부
	 * @param mvcLikev
	 * @return
	 */
	public int mvcLikeExist(MvcLikeVO mvcLikev);
	
	/**
	 * 
	 * @param mvcLikev
	 * @return
	 */
	public int mvcLikeDelete(MvcLikeVO mvcLikev);
	
	/**
	 * 시청가능ott리스트
	 * @param mvId
	 * @return
	 */
	public List<SottVO> getSottList(int mvId);
	
	/**
	 * 코멘트 댓글 수정
	 * @param rv
	 * @return
	 */
	public int mvcRpUpdate(ReplyVO rv);
	
	/**
	 * 코멘트 댓글 삭제
	 * @param mvcreId
	 * @return
	 */
	public int mvcRpDelete(int mvcreId);

}
