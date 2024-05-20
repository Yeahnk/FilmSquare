package admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import admin.vo.MvcReportVO;
import member.vo.MemberVO;



public interface IAdminMboardService {

	/**
	 * 회원 리스트 조회 메서드
	 * @param map
	 * @return 회원 리스트
	 */
	public List<MemberVO> selectAll(Map<String, Object> map);
	
	/**
	 * DB에 존재하는 블랙리스트를 조회하기 위한 메서드
	 * @return 블랙리스트 회원 정보
	 */
	public List<MemberVO> blackList(Map<String, Object> map);

	/**
	 * 게시판 글 개수 구하는 메서드
	 * @return 게시판 글 개수
	 */
	public int countList();
	
	/**
	 * 특정 회원 한 명을 조회하기 위한 메서드
	 * @param memId
	 * @return 특정 회원 정보
	 */
	public MemberVO selectMember(String memId);

	/**
	 * 특정회원을 블랙리스트에서 삭제하기 위한 메서드
	 * @param mv 블랙리스트 삭제할 회원
	 * @return
	 */
	public int blackUpdate(MemberVO mv);

	/**
	 * 특정회원을 블랙리스트에 추가하기 위한 메서드
	 * @param mv 블랙리스트 추가할 회원
	 * @return
	 */
	public int listUpdate(MemberVO mv);
	
	/**
	 * 블랙리스트 게시판 글 개수 구하는 메서드
	 * @return 게시판 글 개수
	 */
	public int bcountList();

	/**
	 * 멤버 전체리스트 조회 페이징처리 x
	 * @return
	 */
	public List<MemberVO> selectAll();

}
