package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminQboardServiceImpl;
import admin.service.IAdminQboardService;
import admin.vo.QnaReplyVO;

@WebServlet("/admin/qboard/unList/answer.do")
public class ReplyInsertController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IAdminQboardService QboardService = AdminQboardServiceImpl.getInstance();
		List<QnaReplyVO> qnaReplylist = QboardService.replyList();
		req.setAttribute("qnaReplyList", qnaReplylist);
		req.getRequestDispatcher("/views/admin/qboard/qnaList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int qaId = Integer.parseInt(req.getParameter("qaId"));
		String qareContent = req.getParameter("answerText");
		

		IAdminQboardService QboardService = AdminQboardServiceImpl.getInstance();
		QnaReplyVO qv = new QnaReplyVO();
		qv.setQaId(qaId);
		qv.setQareContent(qareContent);
		
		int cnt = QboardService.replyInsert(qv);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		
		// 목록 화면으로 리다이렉팅 처리 2번 요청
		resp.sendRedirect(req.getContextPath() + "/admin/qboard/unList.do");
		
	}
}
