package comment.dao;

import comment.vo.CommentVO;
import movie.vo.GradeVOforYE;
import util.MyBatisDao;

public class CommentDaoImpl extends MyBatisDao implements ICommentDao{
	
	private static ICommentDao commentDao;
	
	private CommentDaoImpl() {}
	
	public static ICommentDao getInstance() {
		
		if(commentDao == null) {
			commentDao = new CommentDaoImpl();
		}
		return commentDao;
	}

	@Override
	public CommentVO getACommentByMvIdNMemId(GradeVOforYE index) {
		return selectOne("comment.getACommentByMvIdNMemId",index);
	}















}
