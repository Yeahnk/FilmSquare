package collection.service;

import collection.vo.CollectionVO;

public interface ICollectionService {

	/**
	 * 컬렉션 id로 컬렉션VO 객체 select
	 * @param parseInt
	 * @return
	 */

	CollectionVO getACollection(CollectionVO collectionVO);

}
