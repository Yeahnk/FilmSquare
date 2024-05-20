package collection.service;

import java.util.List;

import collection.dao.CollcontentDaoImpl;
import collection.dao.ICollcontentDao;
import collection.vo.CollcontentVO;

public class CollcontentServiceImpl implements ICollcontentService{
	
	ICollcontentDao dao;
	
	private static ICollcontentService singleTon;
	
	private CollcontentServiceImpl() {
		dao = CollcontentDaoImpl.getInstance();
	};
	
	public static ICollcontentService getInstance() {
		if( singleTon ==null) {
			singleTon = new CollcontentServiceImpl();
		}
		return singleTon;
	}

	@Override
	public List<CollcontentVO> getCollContentList(CollcontentVO collcontentVO) {
		return dao.getCollContentList(collcontentVO);
	}

}
