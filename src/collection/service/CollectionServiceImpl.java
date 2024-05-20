package collection.service;

import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

import collection.dao.CollectionDaoImpl;
import collection.dao.ICollectionDao;
import collection.vo.CollectionVO;

public class CollectionServiceImpl implements ICollectionService {

	ICollectionDao dao;
	
	private static ICollectionService singleTon;
	
	private CollectionServiceImpl() {
		dao = CollectionDaoImpl.getInstance();
	};
	
	public static ICollectionService getInstance() {
		if( singleTon ==null) {
			singleTon = new CollectionServiceImpl();
		}
		return singleTon;
	}

	@Override
	public CollectionVO getACollection(CollectionVO collectionVO) {
		return dao.getACollection(collectionVO);
	}
	
}
