package admin.service;

import java.util.List;
import java.util.Map;

import admin.vo.MvcReportVO;
import admin.vo.QnaReplyVO;
import admin.vo.QnaVO;
import member.vo.MemberVO;



public interface IAdminQboardService {

	/**
	 * 게시판 글 개수 구하는 메서드
	 * @return 게시판 글 개수
	 */
	public int countList();
	
	/**
	 * 문의 리스트 조회 메서드
	 * @param map
	 * @return 문의 리스트
	 */
	public List<QnaVO> qnaList(Map<String, Object> map);
	
	/**
	 * 미답변 문의 리스트 조회 메서드
	 * @param map
	 * @return 미답변 문의 리스트
	 */
	public List<QnaVO> unQnaList(Map<String, Object> map);

	/**
	 * 문의 게시판 특정한 글 상세내역 조회하는 메서드
	 * @param qaId 문의게시판PK
	 * @return 문의 게시판 상세
	 */
	public QnaVO qnaDetail(int qaId);

	
	/**
	 * 문의 게시판의 답변 등록하는 메서드
	 * @param qv
	 * @return
	 */
	public int replyInsert(QnaReplyVO qv);

	
	/**
	 * 문의글의 답변 리스트를 조회하는 메서드
	 * @return 답변 리스트
	 */
	public List<QnaReplyVO> replyList();

	
	/**
	 * 미처리문의게시판 글 개수 구하는 메서드
	 * @return 게시판 글 개수
	 */
	public int uncountList();

}
