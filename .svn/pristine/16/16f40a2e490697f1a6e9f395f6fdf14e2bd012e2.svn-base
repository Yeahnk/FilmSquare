package member.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.service.CommentServiceImple;
import comment.service.ICommentService;
import comment.vo.CommentVO;
import member.vo.MyMovieVO;
import movie.service.IMovieGradeService;
import movie.service.IMovieInfoService;
import movie.service.IPosterService;
import movie.service.MovieGradeServiceImpl;
import movie.service.MovieInfoServiceImpl;
import movie.service.PosterServiceImpl;
import movie.vo.GradeVOforYE;
import movie.vo.MovieInfoVO;
import movie.vo.MvGradeVO;
import movie.vo.PosterVO;
import util.MyUtil;

@WebServlet("/myCal.do")
public class MyPageCalController extends HttpServlet {
	
	static IMovieInfoService movieService = MovieInfoServiceImpl.getInstance();
	static IMovieGradeService gradeService = MovieGradeServiceImpl.getInstance();
	static IPosterService posterService = PosterServiceImpl.getInstance();
	static ICommentService commentService = CommentServiceImple.getInstance();

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String memId = req.getParameter("mypagemember");
		
		Calendar cal = Calendar.getInstance();
		
		// year, month 기본적으로 오늘로 설정
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date = cal.get(Calendar.DAY_OF_MONTH);

		// 파라미터 받아오기
		String sy = req.getParameter("mypyear");
		String sm = req.getParameter("mypmonth");;
		String sd = req.getParameter("mypdate");
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(sy+"."+sm+"."+sd+".");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!");

		// 파라미터 넘어왔는지 확인
		// 처음 접속 시 파라미터 없음
		if( sy != null) {
			year = Integer.parseInt(sy);
		}
		if( sm != null) {
			month = Integer.parseInt(sm);
		}
		if( sd != null) {
			date = Integer.parseInt(sd);
		}

		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, (month-1));
		int lastDay = cal.getActualMaximum(Calendar.DATE);
		
		if( date >lastDay ) {
			date = lastDay;
		}
		
		// 1월에서 이전 누르거나 12월에서 다음 눌렀을 때 처리
		if( month == 0 ) {
			month = 12;
			year--;
		} else if( month == 13 ) {
			month = 1;
			year ++;
		}
		
		// 1일에서 말일까지 내가 본 영화 담을 리스트
		Map<String, List<MyMovieVO>> myMovieMap = new HashMap<String,List<MyMovieVO>>();
		
		for( int i=1; i<=lastDay; i++) {
			LocalDate calDate = LocalDate.of(year,month,i);
			List<GradeVOforYE> dayWatchedList = gradeService.getMyDateWatchedList(new MvGradeVO(memId,calDate));
			List<MyMovieVO> listByDay = new ArrayList<MyMovieVO>();
			for(GradeVOforYE index : dayWatchedList) {
				PosterVO poster = posterService.getPosterByMvId(index.getMvId().intValue());
				GradeVOforYE grade = gradeService.getAGradeByMvIdNMemId(index);
				CommentVO comment = commentService.getACommentByMvIdNMemId(index);
				MovieInfoVO movie = movieService.getAMovie(index.getMvId().intValue());
				
				MyMovieVO myMovie = new MyMovieVO();
				
				if(poster!= null) myMovie.setPosterImg(poster.getPosterImg());
				if(grade!= null) {
					int gradeRate = grade.getMvgRating().multiply(new BigDecimal(2)).intValue();
					myMovie.setMvGrade(gradeRate);
				}
				if(comment!= null) myMovie.setMvComment(comment.getMvcContent());
				if(movie!= null) {
					myMovie.setMvId(movie.getMvId());
					myMovie.setMvTitle(movie.getMvTitle());
				}
				
				listByDay.add(myMovie);
			}
			String keyDate = year+"-"+month+"-"+i;
			myMovieMap.put(keyDate, listByDay);
		}

		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		System.out.println("!!!!!!!!!!!!!!!!!!");
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		LocalDate calDate = LocalDate.of(year, month, date);
		System.out.println(calDate);
		paramMap.put("year", year);
		paramMap.put("month", month);
		paramMap.put("date", date);
		paramMap.put("myMovieMap", myMovieMap);
		
		String paramMapJSON = MyUtil.convertObjectToJson(paramMap);

        // 클라이언트로 응답 전송
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(paramMapJSON);
		
		
	}
	
}
