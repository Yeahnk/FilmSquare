package movie.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;
import movie.vo.MvCommentVO;

@WebServlet("/cmtInsert.do")
public class CmtInsertController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		int mvId = Integer.parseInt(req.getParameter("mvId"));
		String mvcContent = req.getParameter("commentText");
		String mvcSpoyn = req.getParameter("checkboxValue");
		LocalDate mvcDate = LocalDate.parse(req.getParameter("commentDate"));
		
		System.out.println("코멘트vo:"+memId+mvId+mvcContent+mvcSpoyn+mvcDate);
		
		
		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
		MvCommentVO cmtv = new MvCommentVO();
		cmtv.setMemId(memId);
		cmtv.setMvId(mvId);
		cmtv.setMvcContent(mvcContent);
		cmtv.setMvcDate(mvcDate);
		cmtv.setMvcSpoyn(mvcSpoyn);
		
		int cnt = movieDetailService.cmtInsert(cmtv);
		
		System.out.println("코멘트cnt:"+cnt);
		
	}
}
