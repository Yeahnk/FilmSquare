package character.dao;

import java.util.List;
import java.util.Map;

import character.vo.CharacterVO;
import character.vo.PersonImageVO;
import character.vo.PersonInfoVO;
import character.vo.PersonLikeVO;
import util.MyBatisDao;

public class CharacterDaoImpl extends MyBatisDao implements ICharacterDao {
	
	private static ICharacterDao charDao;
	
	private CharacterDaoImpl() {}
	
	public static ICharacterDao getInstance() {
		if(charDao == null) {
			charDao = new CharacterDaoImpl();
		}
		return charDao;
	}

	@Override
	public List<CharacterVO> getCharList(String kwd) {
		return selectList("character.getCharList", kwd);
	}

	@Override
	public List<PersonImageVO> searchImage(long psId) {
		
		return selectList("character.searchImage", psId);
	}

	@Override
	public List<PersonInfoVO> searchInfo(long psId) {
		
		return selectList("character.searchInfo", psId);
	}

	@Override
	public List<PersonLikeVO> personLk(long psId) {
		
		return selectList("character.personLk", psId);
	}

	@Override
	public int createlike(Map<String, Object> map) {
		
		return insert("character.createlike", map);
	}

	@Override
	public int updatelike(Map<String, Object> map) {
		
		return update("character.updatelike", map); 
	}

	@Override
	public int updatelikeReverse(Map<String, Object> map) {
		
		return update("character.updatelikeReverse", map);
	}
	
	@Override
	public PersonLikeVO plvoinfo(Map<String, Object> map) {
		return selectOne("character.plvoinfo", map);
	}


	@Override
	public List<CharacterVO> getMovActList(String kwd) {

		return selectList("character.getMovActList", kwd);
	}

	
	
	

}
