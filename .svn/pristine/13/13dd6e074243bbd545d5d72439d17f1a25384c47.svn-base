package comment.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.service.IReplyService;
import comment.service.ReplyServiceImpl;
import comment.vo.ReplyVO;
@WebServlet("/replyInsert.do")
public class CommentReplyController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	// ...

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    String memId = req.getParameter("memId");
		//임시
//		String memId = "34";
	    int mvcId = Integer.parseInt(req.getParameter("mvcId"));
//	    int mvcreId = Integer.parseInt(req.getParameter("mvcreId"));
	    String mvcreContent = req.getParameter("mvcreContent");
	    System.out.println("리플인서트"+memId+mvcId+mvcreContent);
	    
	    // mvcrecDate를 sysdate로 설정
//	    LocalDate mvcrecDate = LocalDate.now();

	    IReplyService replyInsertService = ReplyServiceImpl.getInstance();
	    ReplyVO rv = new ReplyVO();

	    rv.setMemId(memId);
	    rv.setMvcId(mvcId);
//	    rv.setMvcrecDate(mvcrecDate);
	    rv.setMvcreContent(mvcreContent);
//	    rv.setMvcreId(mvcreId);

	    int cnt = replyInsertService.rvInsert(rv);

//	    resp.getWriter().write("댓글 등록 성공");
	    
//	    resp.sendRedirect(req.getContextPath()+"/cmtDetail.do");
	}

}
