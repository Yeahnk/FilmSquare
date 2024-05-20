package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminMboardServiceImpl;
import admin.service.AdminServiceImpl;
import admin.service.IAdminMboardService;
import member.vo.MemberVO;

@WebServlet("/admin/mboard/blackList/update.do")
public class BlackUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		IAdminMboardService mboardService = AdminMboardServiceImpl.getInstance();
		
		MemberVO mv = mboardService.selectMember(memId);
		mv.setMemId(memId);
		req.setAttribute("mv", mv);
		
		req.getRequestDispatcher("/views/admin/mboard/blackUpdate.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String memId = req.getParameter("memId");
		IAdminMboardService mboardService = AdminMboardServiceImpl.getInstance();
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		System.out.println(mv);
		int cnt = mboardService.blackUpdate(mv);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		
		// 목록 화면으로 포워딩처리
		//req.getRequestDispatcher("/member/list.do").forward(req, resp);
		
		// 목록 화면으로 리다이렉팅 처리
//		resp.sendRedirect(req.getContextPath() + "/admin/mboard/blackList.do");
		
	}
}
