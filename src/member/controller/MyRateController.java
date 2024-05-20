package member.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.IMovieGradeService;
import movie.service.IPosterService;
import movie.service.MovieGradeServiceImpl;
import movie.service.PosterServiceImpl;
import movie.vo.GradeVOforYE;
import movie.vo.MvGradeVO;
import movie.vo.PosterVO;
import util.MyUtil;

@WebServlet("/myrate.do")
public class MyRateController extends HttpServlet {
	

	static IMovieGradeService gradeService = MovieGradeServiceImpl.getInstance();
	static IPosterService posterService = PosterServiceImpl.getInstance();
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("mypagemember");
		String year = req.getParameter("mypyear");
		
		Map<String, List<PosterVO>> posterListMap = new HashMap();
		
		for(int i=1; i<=12; i++) {
			
			LocalDate date = LocalDate.of(Integer.parseInt(year), i, 1);
			List<GradeVOforYE> gradeList = gradeService.getMonthGradeList(new MvGradeVO(memId,date));
			List<PosterVO> posterList = new ArrayList();
			for(GradeVOforYE grade : gradeList) {
				PosterVO poster = posterService.getPosterByMvId(grade.getMvId().intValue());
				posterList.add(poster);
			}
			String key = year+"."+i;
			posterListMap.put(key, posterList);
			
			System.out.println("myrate.do / " + key);
			
		}
		
		String posterListMapJSON = MyUtil.convertObjectToJson(posterListMap);

        // 클라이언트로 응답 전송
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(posterListMapJSON);
		
	}

}
