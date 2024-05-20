package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.servive.IMemberService;
import member.servive.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/updateIntro.do")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // doGet 메서드가 없는 경우 그냥 주석처리해도 됩니다.
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String memId = req.getParameter("memId");
            String memIntro = req.getParameter("newIntro");

            if (memIntro == null || memIntro.trim().isEmpty() || memId == null || memId.trim().isEmpty()) {
                System.out.println("memIntro: " + memIntro);
                System.out.println("memId: " + memId);
                throw new IllegalArgumentException("유효하지 않은 입력 값이 있습니다.");
            }

            // 여기서 mv 객체 생성과 memService 호출은 필요한 로직에 맞게 수정
            MemberVO mvInt = new MemberVO();
            mvInt.setMemId(memId);
            mvInt.setMemIntro(memIntro);
            
            // 세션을 최신화하기 위해 HttpSession을 가져옴
            HttpSession session = req.getSession();

            // 세션에 저장된 LOGIN_MEMBER 속성 가져오기
            MemberVO oldMvInt = (MemberVO) session.getAttribute("LOGIN_MEMBER");

            if (oldMvInt != null) {
                oldMvInt.setMemIntro(mvInt.getMemIntro());


                session.setAttribute("LOGIN_MEMBER", oldMvInt);
            }

            IMemberService memService = MemberServiceImpl.getInstance();
            int cnt = memService.updateIntro(mvInt);

            System.out.println("cnt: " + cnt);

            String msg = "";

            if (cnt > 0) {
                msg = "성공";
            } else {
                msg = "실패";
            }
           // resp.sendRedirect(req.getContextPath() + "/views/member/mypage.jsp");
            //req.getRequestDispatcher("/views/member/mypage.jsp").forward(req, resp);
            // 에러 발생시에는 에러 메시지를 전달하도록 수정
        } catch (Exception e) {
            e.printStackTrace();
           // resp.sendRedirect(req.getContextPath() + "/views/member/mypage.jsp?msg=에러가 발생했습니다.");

            // 에러 발생시에는 에러 메시지를 전달하도록 수정
        }
    }
}
