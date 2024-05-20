package comment.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import comment.vo.ReplyVO;
import config.MyBatisUtil;
import util.MyBatisDao;

public class ReplyDaoImpl extends MyBatisDao implements IReplyDao{
	
	private ReplyDaoImpl() {
	}
	private static IReplyDao replyDao;
	

	
	public static IReplyDao getInstance() {
		if(replyDao == null) {
			replyDao = new ReplyDaoImpl();
		}
		
		return replyDao;
	}

	@Override
	public int rvInsert(ReplyVO rv) {
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("reply.insertReply", rv);
			if(cnt > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return cnt;
	}
	@Override
	public List<ReplyVO> getList(int mvcId) {
		System.out.println("dao!!!!!!!!!!"+mvcId);
		return selectList("reply.getList",mvcId);
	}
	
}
