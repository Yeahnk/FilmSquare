package collection.dao;

import collection.vo.CollectionVO;
import util.MyBatisDao;

public class CollectionDaoImpl extends MyBatisDao implements ICollectionDao {
	
	private static ICollectionDao singleTon;
	
	private CollectionDaoImpl() {};
	
	public static ICollectionDao getInstance() {
		if( singleTon ==null ) {
			singleTon = new CollectionDaoImpl();
		}
		return singleTon;
	}

	@Override
	public CollectionVO getACollection(CollectionVO collectionVO) {
		return selectOne("collection.getACollection", collectionVO);
	}


}
