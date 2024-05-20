package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminMboardServiceImpl;
import admin.service.AdminReportServiceImpl;
import admin.service.IAdminMboardService;
import admin.service.IAdminReportService;
import admin.vo.MvcReportVO;

@WebServlet("/admin/mboard/blackList/detail.do")
public class BlackDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			String memId = req.getParameter("memId");
			IAdminReportService reportService = AdminReportServiceImpl.getInstance();
			
			List<MvcReportVO> mvcReportList = reportService.memberReport(memId);
			req.setAttribute("mvcReportList", mvcReportList);
			
			req.getRequestDispatcher("/views/admin/mboard/blackDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
