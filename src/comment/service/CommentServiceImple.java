package comment.service;

import comment.dao.CommentDaoImpl;
import comment.dao.ICommentDao;
import comment.vo.CommentVO;
import movie.vo.GradeVOforYE;

public class CommentServiceImple implements ICommentService {

	private static ICommentService commentService;
	
	private static ICommentDao dao;
	
	public CommentServiceImple() {
		dao = CommentDaoImpl.getInstance();
	}
	
	public static ICommentService getInstance() {
		
		if(commentService == null) {
			commentService = new CommentServiceImple();
		}
		return commentService;
	}

	@Override
	public CommentVO getACommentByMvIdNMemId(GradeVOforYE index) {
		return dao.getACommentByMvIdNMemId(index);
	}
	
	
	
	
	
}
