package comm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkCode.do")
public class CheckVerificationCodeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userEnteredCode = request.getParameter("verification_code");

        // 세션을 통해 이전에 생성한 랜덤 코드 가져오기
        HttpSession session = request.getSession();
        Integer generatedCode = (Integer) session.getAttribute("verificationCode");

        if (userEnteredCode != null && generatedCode != null && userEnteredCode.equals(String.valueOf(generatedCode))) {
            PrintWriter out = response.getWriter();
            out.print("success");
            out.flush();
        } else {
            PrintWriter out = response.getWriter();
            out.print("failure");
            out.flush();
        }
    }
}
