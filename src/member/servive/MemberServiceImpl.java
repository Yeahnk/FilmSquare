package member.servive;

import java.util.List;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.AtchFileVO;
import member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	
	private static IMemberService memService;
	IMemberDao memDao;
	
	public static IMemberService getInstance() {
		if(memService == null) {
			memService = new MemberServiceImpl();
		}
		return memService;
	}
	public MemberServiceImpl() {
		memDao = MemberDaoImpl.getInstance();
	}
	
	
	@Override
	public List<MemberVO> getMemberList() {
		return memDao.getMemberList();
	}
	@Override
	public int insertMember(MemberVO mv) {
		
		int cnt=memDao.insertMember(mv);
		return cnt;
	}
	
	@Override
	public MemberVO loginChk(MemberVO login) {
		MemberVO mv = memDao.loginChk(login);
		return mv;
	}
	@Override
	public MemberVO searchMember(MemberVO memId) {
		return memDao.searchMember(memId);
	}
	public MemberVO schMember(String memId) {
		return memDao.schMember(memId);
	}
	@Override
	public int kakaoInsert(MemberVO mv) {
		
		return memDao.kakaoInsert(mv);
	}
	@Override
	public boolean emailChk(String memEmail) {
		return memDao.emailChk(memEmail);
	}
	@Override
	public int updateIntro(MemberVO mvInt) {
	
		return memDao.updateIntro(mvInt);
	}
	@Override
	public int updateNic(MemberVO mvNic) {
		
		return memDao.updateNic(mvNic);
	}
	@Override
	public MemberVO searchInfo(String memEmail) {
		return memDao.searchInfo(memEmail);
	}
	@Override
	public int search(String memEmail) {
		// TODO Auto-generated method stub
		return memDao.search(memEmail);
	}
	@Override
	public MemberVO getAMember(MemberVO memberVO) {
		return memDao.getAMember(memberVO);
	}
	@Override
	public int getWatchedMovieNum(String memId) {
		return memDao.getWatchedMovieNum(memId);
	}
	@Override
	public int getMemberRank(MemberVO mem) {
		return memDao.getMemberRank(mem);
	}
	@Override
	public int getGradeCount(MemberVO mem) {
		return memDao.getGradeCount(mem);
	}
	@Override
	public int getCommentCount(MemberVO mem) {
		return memDao.getCommentCount(mem);
	}
	@Override
	public int getCollCout(MemberVO mem) {
		return memDao.getCollCout(mem);
	}

	
	

	
	
}
