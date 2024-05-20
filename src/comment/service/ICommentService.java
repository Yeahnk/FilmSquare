package comment.service;

import comment.vo.CommentVO;
import movie.vo.GradeVOforYE;

public interface ICommentService {

	CommentVO getACommentByMvIdNMemId(GradeVOforYE index);

}
