<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="member.vo.MemberVO"%>

<%
    MemberVO vo = new MemberVO();
    BeanUtils.populate(vo, request.getParameterMap());

    String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
    String username = "team2_202310M";
    String password = "java";

    try (Connection conn = DriverManager.getConnection(url, username, password);
         PreparedStatement pstmt = conn.prepareStatement(
                 "INSERT INTO member (memName, memPw, memNcnm, memEmail, memInum, memTelno) " +
                 "VALUES (?, ?, ?, ?, ?, ?)")) {

        // PreparedStatement를 사용하여 바인딩 변수를 설정
        pstmt.setString(1, vo.getMemName());
        pstmt.setString(2, vo.getMemPw());
        pstmt.setString(3, vo.getMemNcnm());
        pstmt.setString(4, vo.getMemEmail());
        pstmt.setString(5, vo.getMemInum());
        pstmt.setString(6, vo.getMemTelno());

        // SQL 문 실행
        int rst = pstmt.executeUpdate();
        out.println(rst); // 결과 출력

    } catch (Exception e) {
        e.printStackTrace();
        out.println("0"); // 오류 발생 시 0 출력
    }
%>
