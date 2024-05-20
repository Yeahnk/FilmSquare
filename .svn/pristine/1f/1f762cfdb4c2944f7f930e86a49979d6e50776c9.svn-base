package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.IMovieGradeService;
import movie.service.MovieGradeServiceImpl;
import movie.vo.MvCommentVO;
import util.MyUtil;

@WebServlet("/mycate.do")
public class MyCateController extends HttpServlet {

	static IMovieGradeService gradeService = MovieGradeServiceImpl.getInstance(); 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("mypagemember");
		
		
		int actionCount = gradeService.countGenre(new MvCommentVO(memId, "액션"));
		int dramaCount = gradeService.countGenre(new MvCommentVO(memId, "드라마"));
		int comedyCount = gradeService.countGenre(new MvCommentVO(memId, "코메디"));
		int melloCount = gradeService.countGenre(new MvCommentVO(memId, "멜로"));
		int thrillerCount = gradeService.countGenre(new MvCommentVO(memId, "스릴러"));
		int fantasyCount = gradeService.countGenre(new MvCommentVO(memId, "판타지"));
		int sfCount = gradeService.countGenre(new MvCommentVO(memId, "SF"));
		int horrorCount = gradeService.countGenre(new MvCommentVO(memId, "공포"));
		int countSum = actionCount + dramaCount + comedyCount + melloCount + thrillerCount + fantasyCount + sfCount + horrorCount;
		
		int totalRTime = gradeService.getTotalRtime(memId);
		
		Map<String, Integer> cateCountMap = new HashMap();
		
		cateCountMap.put("actionCount", actionCount);
		cateCountMap.put("dramaCount", dramaCount);
		cateCountMap.put("comedyCount", comedyCount);
		cateCountMap.put("melloCount", melloCount);
		cateCountMap.put("thrillerCount", thrillerCount);
		cateCountMap.put("fantasyCount", fantasyCount);
		cateCountMap.put("sfCount", sfCount);
		cateCountMap.put("horrorCount", horrorCount);
		cateCountMap.put("countSum", countSum);
		cateCountMap.put("totalRTime", totalRTime);
		
		System.out.println("MyCateController");
		
		String cateCountMapJSON = MyUtil.convertObjectToJson(cateCountMap);

        // 클라이언트로 응답 전송
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(cateCountMapJSON);
		
	}
	
}
