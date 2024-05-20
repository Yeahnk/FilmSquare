package member.dao;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import member.vo.AtchFileVO;
import member.vo.MemberVO;



public interface IAtchFileDao {
	public int updateAtchFile(AtchFileVO fileVO);
	
	public int insertAtchFileDetail(AtchFileVO atchFileVO);
	
	
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);
	
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);

	public AtchFileVO getMember(MemberVO memId);

	public int insertFile(AtchFileVO av);

	public int saveFile(Collection<Part> parts);

	AtchFileVO getMember(String memId);
	
	/**
	 * 프로필사진을 등록한 적 있는지 확인하는 메서드
	 * @param memId
	 * @return
	 */
	public int exist(String memId);

	public AtchFileVO getAFile(String memId);
	
}
