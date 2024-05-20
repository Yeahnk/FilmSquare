package movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.MemberVO;
import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;
import movie.vo.MvCollectionVO;

@WebServlet("/myClInsert.do")
public class MyClInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//접속자 컬렉션 목록
//		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
//		MemberVO mv = (MemberVO) req.getSession().getAttribute("LOGIN_MEMBER");
//		String memId = mv.getMemId();
//		System.out.println("컬렉션목록:"+memId);
//		List<MvCollectionVO> memClList = movieDetailService.getMemCl(memId);
//		req.setAttribute("memClList", memClList);
//		req.getRequestDispatcher("views/movie/detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int clId = Integer.parseInt(req.getParameter("clId"));
		int mvId = Integer.parseInt(req.getParameter("mvId"));
		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
		MvCollectionVO cv = new MvCollectionVO();
		cv.setClId(clId);
		cv.setMvId(mvId);
		System.out.println("나의컬렉션에넣기:"+cv);
		
		int exist = movieDetailService.clExist(cv);
		System.out.println("컬렉션존재?:"+exist);
		int cnt = 0;
		if(exist == 0) {
		cnt = movieDetailService.myClInsert(cv);
		}
		
		
	}
}
