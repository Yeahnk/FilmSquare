package comm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sendCode.do")
public class Verification extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String userEmail = request.getParameter("memEmail");

        // 이메일 중복 확인
        if (isEmailExists(userEmail)) {
            // 중복된 이메일이면 클라이언트에게 중복 응답 전송
            PrintWriter out = response.getWriter();
            out.print("duplicate");
            out.flush();
            return;
        }

        int verificationCode = generateRandomCode();

        // 이메일 전송 로직 추가
        boolean emailSent = sendVerificationEmail(userEmail, verificationCode);

        if (emailSent) {
            // 세션에 코드 저장
            HttpSession session = request.getSession();
            session.setAttribute("verificationCode", verificationCode);

            // 전송 성공 시 클라이언트에게 성공 응답 전송
            PrintWriter out = response.getWriter();
            out.print("success");
            out.flush();
        } else {
            // 전송 실패 시 클라이언트에게 실패 응답 전송
            PrintWriter out = response.getWriter();
            out.print("failure");
            out.flush();
        }
    }

    private boolean isEmailExists(String userEmail) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@112.220.114.130:1521:xe", "team2_202310M", "java");

            String sql = "SELECT COUNT(*) FROM MEMBER WHERE mem_email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private int generateRandomCode() {
        // 랜덤한 6자리 숫자 생성
        return (int) ((Math.random() * (999999 - 100000)) + 100000);
    }

    private boolean sendVerificationEmail(String toEmail, int verificationCode) {
        // 이메일 서버 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // 사용자 인증 정보
        String username = "sohee0021@gmail.com";
        String password = "hsej kycb wyrc zblr";

        // 세션 생성
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(username, password);
            }
        });

        // 메시지 생성
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("이메일 인증 코드");
            message.setText("인증 코드: " + verificationCode);

            // 메시지 전송
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
