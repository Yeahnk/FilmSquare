package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminMboardServiceImpl;
import admin.service.AdminQboardServiceImpl;
import admin.service.AdminReportServiceImpl;
import admin.service.IAdminMboardService;
import admin.service.IAdminQboardService;
import admin.service.IAdminReportService;
import member.vo.MemberVO;

@WebServlet("/admin/main.do")
public class MainController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 남녀 비율
		int mCnt = 0; // 남성 회원 수
		int fCnt = 0; // 여성 회원 수
		
		IAdminMboardService memService = AdminMboardServiceImpl.getInstance();
		
		List<MemberVO> memList = memService.selectAll();
		
		for (MemberVO mv : memList) {
			if(mv.getMemMW().equals("남")) {
				mCnt++;
			} else if(mv.getMemMW().equals("여")) {
				fCnt++;
			}
		}
		
		
		System.out.println("mCnt / fCnt ==> " + mCnt + " / " + fCnt);
		
		// 미처리 신고내역 확인
		IAdminReportService rptService = AdminReportServiceImpl.getInstance();
		int rptCnt = rptService.mrcountList();
		System.out.println("rptCnt 갯수 = " + rptCnt);
		
		// 미답변 문의내역 확인
		IAdminQboardService qnaService = AdminQboardServiceImpl.getInstance();
		int qnaCnt = qnaService.uncountList();
		System.out.println("qnaCnt 갯수 = " + qnaCnt);
		
		req.setAttribute("mCnt", mCnt);
		req.setAttribute("fCnt", fCnt);
		req.setAttribute("rptCnt", rptCnt);
		req.setAttribute("qnaCnt", qnaCnt);
		
		
		req.getRequestDispatcher("/adminIndex.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
