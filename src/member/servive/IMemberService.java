package member.servive;

import java.util.List;

import member.vo.AtchFileVO;
import member.vo.MemberVO;

public interface IMemberService {
	
	/**
	 * DB에 존재하는 모든회원 정보를 조회하기 위한 메서드
	 * @return 전체 회원 리스트
	 */
	public List<MemberVO> getMemberList();
	
	
	public MemberVO loginChk(MemberVO mv);

	public int insertMember(MemberVO mv);

	public MemberVO searchMember(MemberVO memId);

	public MemberVO schMember(String memId);
	
	public int kakaoInsert(MemberVO mv);
	
	public boolean emailChk(String memEmail);

	public int updateIntro(MemberVO mvInt);
	
	public int updateNic(MemberVO mvNic);
	
	public MemberVO searchInfo(String memEmail);
	
	public int search(String memEmail); 

	public MemberVO getAMember(MemberVO memberVO); 
	
	public int getWatchedMovieNum(String memId);
	
	public int getMemberRank(MemberVO mem);
	
	public int getGradeCount(MemberVO mem);
	
	public int getCommentCount(MemberVO mem);
	
	public int getCollCout(MemberVO mem);


}

	
