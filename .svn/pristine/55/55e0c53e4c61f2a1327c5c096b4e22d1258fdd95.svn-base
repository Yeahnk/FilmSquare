package movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;
import movie.vo.MvCollectionVO;

@WebServlet("/clInsert.do")
public class ClInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String clTitle = req.getParameter("clTitle");
		System.out.println("멤버,컬렉션제목:"+memId+clTitle);
		
		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
		
		MvCollectionVO cv = new MvCollectionVO();
		cv.setMemId(memId);
		cv.setClTitle(clTitle);
		
		int cnt = movieDetailService.clInsert(cv);
		
	}
}
