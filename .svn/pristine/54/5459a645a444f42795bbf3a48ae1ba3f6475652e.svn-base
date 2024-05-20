package character.service;

import java.util.List;
import java.util.Map;

import character.vo.CharacterVO;
import character.vo.PersonImageVO;
import character.vo.PersonInfoVO;
import character.vo.PersonLikeVO;

public interface ICharacterService {
	
	/**
	 * keyword를 입력 받아 해당 키워드가 포함되거나 일치하는 인물을 검색하기 위한 메서드
	 * @param kwd
	 * @return key워드 연관 인물 List 반환
	 */
	public List<CharacterVO> getCharList(String kwd);
	
	
	/**
	 * psId를 입력받아 인물사진을 가져옴
	 * @param psiVO
	 * @return
	 */
	public List<PersonImageVO> searchImage(long psId);
	
	/**
	 * psId를 입력받아 인물정보을 가져옴
	 * @param psifVO
	 * @return
	 */
	public List<PersonInfoVO> searchInfo(long psId);


	
	public List<PersonLikeVO> personLk(long psId);


	public int createlike(Map<String, Object> map);


	public int updatelike(Map<String, Object> map);

	public int updatelikeReverse(Map<String, Object> map);


	public List<CharacterVO> getMovActList(String kwd);
	
	public PersonLikeVO plvoinfo(Map<String, Object> map);
	
	

}
