package collection.dao;


import collection.vo.CollectionVO;
import util.MyBatisDao;

public class ClLikeDaoImpl extends MyBatisDao implements IClLikeDao {
	
	private static IClLikeDao singleTon;
	
	private ClLikeDaoImpl() {};
	
	public static IClLikeDao getInstance() {
		if( singleTon ==null ) {
			singleTon = new ClLikeDaoImpl();
		}
		return singleTon;
	}

	@Override
	public int countLike(CollectionVO coll) {
		return selectOne("clLike.countLike", coll);
	}

}
