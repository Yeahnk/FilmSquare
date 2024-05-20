package movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;

@WebServlet("/mvcRpDelete.do")
public class MvcRpDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mvcreId = Integer.parseInt(req.getParameter("mvcreId"));
		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
		
		int cnt = movieDetailService.mvcRpDelete(mvcreId);
		
		
	}
}
