package comment.service;

import java.util.List;

import comment.vo.ReplyVO;

public interface IReplyService {

	public int rvInsert(ReplyVO rv);

	public List<ReplyVO> getList(int mvcId);

}
