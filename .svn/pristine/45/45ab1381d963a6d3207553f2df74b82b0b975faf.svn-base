package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminEboardServiceImpl;
import admin.service.IAdminEboardService;

@WebServlet("/admin/eboard/delete.do")
public class EditerDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int ebId = Integer.parseInt(req.getParameter("ebId"));
		
		IAdminEboardService ebService =  AdminEboardServiceImpl.getInstance();
		
		int cnt = ebService.deleteEboard(ebId);
		
		if(cnt > 0) {
			
			System.out.println("eboard삭제작업 성공! 삭제된 보드번호 =>" + ebId);
		}
		
		resp.sendRedirect(req.getContextPath() + "/admin/eboard/list.do");
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	
	}
	
}
