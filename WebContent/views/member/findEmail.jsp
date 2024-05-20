<%@ page import="member.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
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

        .found-id {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }

        .found-login button {
            margin: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .found-login button#btnLogin {
            background-color: #28a745;
            color: #fff;
            border: none;
        }

        .found-login button#btnFindPass {
            background-color: #007bff;
            color: #fff;
            border: none;
        }

        .found-login button#btnBack, .found-login button#btnJoin {
            background-color: #6c757d;
            color: #fff;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String member_mid = (String) request.getAttribute("memEmail");
            System.out.println(member_mid);
        %>

        <form action="./findEmail.do" name="idsearch" method="post">
            <% if (member_mid != null) { %>
                <div class="found-success">
                    <h4>회원님의 아이디는</h4>
                    <div class="found-id"><%= member_mid %></div>
                    <h4>입니다</h4>
                </div>
                <div class="found-login">
                    <button type="button" id="btnLogin" onclick='Login()'>로그인</button>
                    <button type="button" id="btnFindPass" onclick='findPass()'>비밀번호찾기</button>
                </div>
            <% } else { %>
                <div class="found-fail">
                    <h4>등록된 정보가 없습니다</h4>
                </div>
                <div class="found-login">
                    <button type="button" id="btnBack" onclick="history.back()">다시 찾기</button>
                    <button type="button" id="btnJoin" onclick="Login()">회원가입</button>
                </div>
            <% } %>
        </form>

        <script>
            function Login() {
                window.location.href = "<%=request.getContextPath()%>/memLogin.do";
            }

            function findPass() {
                window.location.href = "<%=request.getContextPath()%>/views/member/find2.jsp";
            }
        </script>
    </div>
</body>
</html>
