package collection.service;

import java.math.BigDecimal;

import collection.dao.ClLikeDaoImpl;
import collection.dao.IClLikeDao;
import collection.vo.CollectionVO;

public class ClLikeServiceImpl implements IClLikeService {

	IClLikeDao dao;
	
	private static IClLikeService singleTon;
	
	private ClLikeServiceImpl() {
		dao = ClLikeDaoImpl.getInstance();
	};
	
	public static IClLikeService getInstance() {
		if( singleTon ==null) {
			singleTon = new ClLikeServiceImpl();
		}
		return singleTon;
	}

	@Override
	public int countLike(CollectionVO coll) {
		return dao.countLike(coll);
	}
	
}
