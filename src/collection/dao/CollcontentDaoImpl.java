package collection.dao;

import java.util.List;

import collection.vo.CollcontentVO;
import util.MyBatisDao;

public class CollcontentDaoImpl extends MyBatisDao implements ICollcontentDao {
	
	private static ICollcontentDao singleTon;
	
	private CollcontentDaoImpl() {};
	
	public static ICollcontentDao getInstance() {
		if( singleTon ==null ) {
			singleTon = new CollcontentDaoImpl();
		}
		return singleTon;
	}

	@Override
	public List<CollcontentVO> getCollContentList(CollcontentVO collcontentVO) {
		return selectList("collcontent.getCollContentList", collcontentVO);
	}

}
