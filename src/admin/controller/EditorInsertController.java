package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminEboardServiceImpl;
import admin.service.AtchFileServiceImpl;
import admin.service.IAdminEboardService;
import admin.service.IAtchFileService;
import admin.vo.AtchFileVO;
import admin.vo.EBTextVO;
import admin.vo.EditorBoardVO;

@MultipartConfig
@WebServlet("/admin/editorInsert.do")
public class EditorInsertController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/admin/eboard/editorInsert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ebTitle = req.getParameter("ebTitle");
		String ebtContent = req.getParameter("ebtContent");
		
		IAdminEboardService eboardService = AdminEboardServiceImpl.getInstance();

		EditorBoardVO ev = new EditorBoardVO();
		
		ev.setEbTitle(ebTitle);
		int cnt_b = eboardService.editorInsert(ev); //editorboard insert
		
		EBTextVO etv = new EBTextVO();
		etv.setEbtContent(ebtContent);
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		int cnt_t = 0;
		
		if(cnt_b > 0) { 
			cnt_t = eboardService.ebtInsert(etv); // editortext insert
			
			if(cnt_t > 0) {
				
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				AtchFileVO atchFileVO = new AtchFileVO();	
				atchFileVO = fileService.saveAtchFileList(req.getParts()); //파일 담겼을 때 가져오는 메소드 jsp에 멀티파트 타입일 때
			
			}
			
			
			
		}
		
		resp.sendRedirect(req.getContextPath() + "/admin/eboard/list.do");
		
	}
}
