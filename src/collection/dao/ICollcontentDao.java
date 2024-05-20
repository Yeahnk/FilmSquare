package collection.dao;

import java.util.List;

import collection.vo.CollcontentVO;

public interface ICollcontentDao {

	List<CollcontentVO> getCollContentList(CollcontentVO collcontentVO);

}
