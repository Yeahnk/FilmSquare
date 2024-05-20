package comment.service;

import java.util.List;

import javax.servlet.annotation.WebServlet;

import comment.dao.IReplyDao;
import comment.dao.ReplyDaoImpl;
import comment.vo.ReplyVO;
import util.MyBatisDao;


public class ReplyServiceImpl extends MyBatisDao implements IReplyService{

	private IReplyDao replyDao;
	
	private static IReplyService replyService;
	
	private ReplyServiceImpl() {
		replyDao = ReplyDaoImpl.getInstance();
	}
	public static IReplyService getInstance() {
		
		if(replyService == null) {
			replyService = new ReplyServiceImpl(); 
			
		
	}
	return replyService;

	}
	@Override
	public int rvInsert(ReplyVO rv) {
		
		int cnt = replyDao.rvInsert(rv);
		return cnt;
	}
	@Override
	public List<ReplyVO> getList(int mvcId) {
		return replyDao.getList(mvcId);
	}

	
}