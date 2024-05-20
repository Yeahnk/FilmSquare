package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.IAdminReportService;
import admin.service.AdminMboardServiceImpl;
import admin.service.AdminReportServiceImpl;
import admin.service.IAdminMboardService;
import admin.vo.MvcReportVO;


@WebServlet("/admin/mvcReport/list/complete.do")
public class MvcRpCompleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int mvcrpId = Integer.parseInt(req.getParameter("mvcrpId"));
		System.out.println(mvcrpId);
		IAdminReportService reportService = AdminReportServiceImpl.getInstance();
		MvcReportVO mrv = new MvcReportVO();
		mrv.setMvcrpId(mvcrpId);
		System.out.println(mrv.getMvcrpId());
		int cnt = reportService.complete(mrv);
		System.out.println(cnt);
	
	}
}
