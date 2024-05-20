package movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.service.IReplyService;
import comment.service.ReplyServiceImpl;
import comment.vo.ReplyVO;
import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;
import movie.vo.MovieInfoVO;
import movie.vo.MvCommentVO;
import movie.vo.MvPosterVO;

@WebServlet("/cmtDetail.do")
public class CmtDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int mvcId = Integer.parseInt(req.getParameter("mvcId"));
		int mvId = Integer.parseInt(req.getParameter("mvId"));
	
		System.out.println("코멘트상세"+mvcId+","+mvId);
		
		IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
		
		//movie
		MovieInfoVO mvDetail = movieDetailService.getMovieDetail(mvId);
		//poster
		MvPosterVO mvPoster = movieDetailService.getMoviePoster(mvId);
		MvCommentVO cmtv = movieDetailService.getCmtDetail(mvcId);
		List<ReplyVO> rList = movieDetailService.getCmtReply(mvcId);
		
		
		System.out.println(cmtv);
		System.out.println(mvDetail);
		System.out.println(mvPoster);
		System.out.println(rList);
		
		req.setAttribute("cmtv", cmtv);
		req.setAttribute("rList", rList);
		req.setAttribute("mvDetail", mvDetail);
		req.setAttribute("mvPoster", mvPoster);
		
		
		
		req.getRequestDispatcher("views/movie/cmtDetail.jsp").forward(req, resp);
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
