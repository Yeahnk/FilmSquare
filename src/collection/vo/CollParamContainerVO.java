package collection.vo;

import java.util.List;
import java.util.Map;

import lombok.Data;
import member.vo.AtchFileVO;
import member.vo.MemberVO;

@Data
public class CollParamContainerVO {
	private CollectionVO coll;
	private MemberVO mem;
	private AtchFileVO memProfile;
	private List<Map<String, Object>> movieMap;
	
	
	public CollParamContainerVO(CollectionVO coll, MemberVO mem, AtchFileVO memProfile,
			List<Map<String, Object>> movieMap) {
		super();
		this.coll = coll;
		this.mem = mem;
		this.memProfile = memProfile;
		this.movieMap = movieMap;
	}
	
	
	
}
