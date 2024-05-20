package movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.IMovieDetailService;
import movie.service.MovieDetailServiceImpl;
import movie.vo.MvLaterVO;

@WebServlet("/laterInsert.do")
public class LaterInsertController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 클라이언트에서 전송한 데이터를 받아옴
        int mvId = Integer.parseInt(req.getParameter("mvId"));
        String memId = req.getParameter("memId");
        MvLaterVO mlv= new MvLaterVO();
        // 서비스와 DAO를 이용해 나중에 볼 영화인지 확인
        IMovieDetailService movieDetailService = MovieDetailServiceImpl.getInstance();
        mlv.setMvId(mvId);
        mlv.setMemId(memId);
        boolean isAlreadyAdded = movieDetailService.isAlreadyAdded(mlv);

        // 이미 추가된 경우 메시지를 전송
        if (isAlreadyAdded) {
            resp.getWriter().write("이미 나중에 볼 목록에 추가된 영화입니다.");
            return;
        }

        // 나중에 볼 영화 추가
        int cnt = movieDetailService.laterInsert(mlv);

        // 추가 성공시 메시지 전송
        if (cnt > 0) {
            resp.getWriter().write("나중에 볼 영화에 추가되었습니다.");
        } else {
            resp.getWriter().write("나중에 볼 영화 추가에 실패했습니다.");
        }
    }
}
