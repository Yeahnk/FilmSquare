package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.servive.IMemberService;
import member.servive.MemberServiceImpl;
import member.vo.MemberVO;
@MultipartConfig
@WebServlet("/insert.do")
public class InsertController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/member/joinForm.jsp").forward(req, resp);
		
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String memName = req.getParameter("memName");
		String memPw = req.getParameter("memPw");
		String memNcnm = req.getParameter("memNcnm");
		String memEmail = req.getParameter("memEmail");
		String memTelno = req.getParameter("memTelno");
		String memInum1 = req.getParameter("memInum1");
		String memInum2 = req.getParameter("memInum2");
		String memInum = memInum1 + "-" + memInum2;
		
		
		//회원정보저장
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = new MemberVO();
		mv.setMemName(memName);
		mv.setMemPw(memPw);
		mv.setMemNcnm(memNcnm);
		mv.setMemEmail(memEmail);
		mv.setMemTelno(memTelno);
		mv.setMemInum(memInum);
		
		int cnt = memService.insertMember(mv);
		
		String msg = "";
		
		if(cnt > 0) {
			msg="성공";
		}else {
			msg="실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		
		
		resp.sendRedirect(req.getContextPath()+"/main.do");
		
	}
}
