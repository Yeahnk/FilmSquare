package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminQboardServiceImpl;
import admin.service.AdminReportServiceImpl;
import admin.service.IAdminQboardService;
import admin.service.IAdminReportService;
import admin.vo.MvcReportVO;
import admin.vo.QnaVO;

public class QnaDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			int qaId = Integer.parseInt(req.getParameter("qaId"));
			IAdminQboardService adminQnaService = AdminQboardServiceImpl.getInstance();
			
			QnaVO qv = adminQnaService.qnaDetail(qaId);
			req.setAttribute("qv", qv);
			
			req.getRequestDispatcher("/views/admin/mboard/qnaDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	} 

}
