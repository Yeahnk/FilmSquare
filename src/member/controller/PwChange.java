package member.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/passChange.do")
public class PwChange extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC 연결을 위한 정보
    private static final String JDBC_URL = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
    private static final String JDBC_USER = "team2_202310M";
    private static final String JDBC_PASSWORD = "java";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JDBC 드라이버 로드
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

     // 클라이언트로부터 전송된 데이터 가져오기
        String memId = request.getParameter("memId");
        String memPw = request.getParameter("memPw"); // 변경된 부분
        String newPassword = request.getParameter("newPassword");

        boolean success = passwordChange(memId, memPw, newPassword);
        System.out.println("newPassword: " + memId);
        System.out.println("newPassword: " + memPw);
        System.out.println("newPassword: " + newPassword);


        // 클라이언트에 응답 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // JSON 형태의 응답 데이터 생성
        String jsonResponse = "{\"success\":" + success + "}";
        response.getWriter().write(jsonResponse);
        System.out.println(jsonResponse);
//        request.getRequestDispatcher("/views/member/mypage.jsp").forward(request, response);
//       response.sendRedirect(request.getContextPath() + "/views/member/mypage.jsp");
    }

    private boolean passwordChange(String memId, String memPw, String newPassword) {
        // JDBC 관련 변수
        try (
            // JDBC 드라이버 로드
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        ) {
            connection.setAutoCommit(false); // 트랜잭션 시작

            // SQL 쿼리 작성
            try (PreparedStatement statement = connection.prepareStatement("UPDATE MEMBER SET MEM_PW= ? WHERE MEM_ID = ? AND MEM_PW = ?")) {
                // 쿼리 파라미터 설정
                statement.setString(1, newPassword);
                statement.setString(2, memId);
                statement.setString(3, memPw);
                System.out.println(statement);
                // 쿼리 실행
                int rowCount = statement.executeUpdate();

                // 변경된 행의 개수를 기반으로 성공 여부 판단
                if (rowCount > 0) {
                	System.out.println("성공");
                    connection.commit(); // 트랜잭션 커밋
                } else {
                    connection.rollback(); // 트랜잭션 롤백 (선택적으로 처리)
                }

                return rowCount > 0;
            } catch (SQLException e) {
                connection.rollback(); // 예외 발생 시 롤백
                e.printStackTrace();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
