package comm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import comm.controller.DatabaseConnection;

public class NickDAO {
    // 닉네임 중복 여부 확인 메서드
    public boolean isNicknameAvailable(String nickname) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
           
            conn = DatabaseConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM member WHERE mem_ncnm = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nickname);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count == 0; // 0이면 사용 가능한 닉네임
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt, rs);
        }

        return false;
    }

    private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}