<%@page import="java.util.UUID"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .found-success, .found-fail {
            margin-bottom: 20px;
        }

        .found-success h4 {
            font-size: 18px;
            color: #28a745;
        }

        .found-fail h4 {
            font-size: 18px;
            color: #dc3545;
        }

        .found-login {
            margin-top: 20px;
        }

        .found-login input {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #6c757d;
            color: #fff;
            border: none;
            margin-right: 10px;
        }

        .found-login input#btnSubmit {
            background-color: #007bff;
            color: #fff;
            border: none;
            margin-right: 0; /* Remove margin-right for uniform spacing */
        }
    </style>
</head>
<body>
<%
    String mem_mEmail = (String) request.getAttribute("memEmail");
    String mem_mTel = (String) request.getAttribute("memTelno");
    String mem_mPw = (String) request.getAttribute("memPw");
    System.out.println(mem_mTel + mem_mEmail + mem_mPw);

    if (mem_mEmail != null && mem_mPw != null && mem_mTel != null) {
%>
    <form action="<%=request.getContextPath()%>/findPw.do" name="pwsearch" method="post">
        <div class="container">
            <div class="found-success">
                <h4>회원님의 정보가 존재합니다. 임시 비밀번호를 이메일로 전송하시겠습니까?</h4>
            </div>
        </div>
    </form>
    <form action="<%=request.getContextPath()%>/passSend.do" method="post">
        <input type="hidden" name="memEmail" value="<%=mem_mEmail%>">
        <input type="submit" value="새로운 비밀번호 발송" id="btnSubmit">
        <div class="found-login">
            <input type="button" id="btnLogin" value="로그인" onclick='Login()' />
            <input type="button" id="btnBack" value="돌아가기" onclick="history.back()" />
        </div>
    </form>
<% } else { %>
    <div class="found-fail">
        <h4>등록된 정보가 없습니다</h4>
    </div>
    <div class="found-login">
        <input type="button" id="btnBack" value="다시 찾기" onclick="history.back()" />
    </div>
<% } %>

<script>
    function Login() {
        window.location.href = "<%=request.getContextPath()%>/memLogin.do";    
    }
</script>
</body>
</html>
