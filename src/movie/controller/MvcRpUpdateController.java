package movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.vo.ReplyVO;
import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;

@WebServlet("/mvcRpUpdate.do")
public class MvcRpUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mvcreId = Integer.parseInt(req.getParameter("mvcreId"));
		String mvcreContent = req.getParameter("updateText");
		
		
		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
		
		ReplyVO rv = new ReplyVO();
		rv.setMvcreId(mvcreId);
		rv.setMvcreContent(mvcreContent);
		System.out.println("리플vo"+rv);
		
		int cnt = movieDetailService.mvcRpUpdate(rv);
		
		
		
	}
}
