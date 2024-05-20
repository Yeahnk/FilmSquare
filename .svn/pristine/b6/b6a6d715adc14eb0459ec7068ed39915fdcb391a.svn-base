package member.servive;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import member.vo.AtchFileVO;
import member.vo.MemberVO;



public interface IAtchFileService {

	

	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);
	

	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);
	
	
	public AtchFileVO getMember(MemberVO memId);

	/**
	 * 
	 * 
	 * 
	 * @param av
	 * @return
	 */
	public int insertFile(AtchFileVO av);


	public AtchFileVO saveAtchFile(Collection<Part> parts, String memId);

	/**
	 * 프로필사진을 등록한 적 있는지 확인하는 메서드
	 * @param memId
	 * @return
	 */
	public int exist(String memId);


	public AtchFileVO getAFile(String memId);
	

}
