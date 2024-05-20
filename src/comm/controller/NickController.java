package comm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.dao.NickDAO;

@WebServlet("/nickChk.do")
public class NickController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        // 클라이언트에서 전송된 닉네임 가져오기
        String nickname = request.getParameter("nickname");

        // DAO 클래스를 이용하여 닉네임 중복 여부 확인
        NickDAO memberDAO = new NickDAO();
        boolean isNicknameAvailable = memberDAO.isNicknameAvailable(nickname);

        // 결과를 클라이언트로 응답
        PrintWriter out = response.getWriter();
        if (isNicknameAvailable) {
            out.write("사용가능");
        } else {
            out.write("사용불가");
        }
        out.close();
    }
}

