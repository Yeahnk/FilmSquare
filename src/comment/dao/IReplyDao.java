package comment.dao;

import java.util.List;

import comment.vo.ReplyVO;

public interface IReplyDao {

	public int rvInsert(ReplyVO rv);

	public List<ReplyVO> getList(int mvcId) ;
}
