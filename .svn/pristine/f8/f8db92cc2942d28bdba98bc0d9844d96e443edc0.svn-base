package movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;
import movie.vo.MovieInfoVO;
import movie.vo.MvCommentVO;

@WebServlet("/cmtMore.do")
public class CmtMoreController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mvId = Integer.parseInt(req.getParameter("mvId"));
		System.out.println("코멘트더보기"+mvId);
		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
		
		
		MovieInfoVO mvDetail = movieDetailService.getMovieDetail(mvId);
		//코멘트 테이블, 코멘트 작성자 평점*10, 코멘트 좋아요 개수, 코멘트 댓글 개수, 프로필 이미지 경로, 좋아요 순으로 정렬
		List<MvCommentVO> cmtList = movieDetailService.getCmtList(mvId);
		
		req.setAttribute("mvDetail", mvDetail);
		req.setAttribute("cmtList", cmtList);
		
		req.getRequestDispatcher("views/movie/cmtMore.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
}
