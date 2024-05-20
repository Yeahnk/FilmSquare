package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.servive.AtchFileServiceImpl;
import member.servive.IAtchFileService;
import member.vo.AtchFileVO;

@MultipartConfig
@WebServlet("/pfSet.do")
public class Pfinsert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/member/mypage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO av = new AtchFileVO();
		
		int exist = fileService.exist(memId);
		System.out.println("레코드개수:" + exist);
		int cnt;
		
		if(exist == 0) {
		
		av.setMemId(memId);
		System.out.println("사진>>>>>>"+av);
		cnt = fileService.insertFile(av);
		System.out.println("pfpfpfp>>>"+cnt);
		
		}


		// 파일 업로드 성공 시 세션에 프로필 이미지 경로 설정
//		if (cnt > 0) {
			av = fileService.saveAtchFile(req.getParts(), memId);
		    System.out.println("filvo>>>>>>"+av);
		    // FileVO에서 프로필 이미지 경로 가져오기 (가정)
		    String profileImgPath = av.getMempPath();

		    // 세션에 프로필 이미지 경로 설정
		    req.getSession().setAttribute("profileImgPath", profileImgPath);
//		}


		//req.getRequestDispatcher("/views/member/mypage.jsp").forward(req, resp);
		}
		
	}

