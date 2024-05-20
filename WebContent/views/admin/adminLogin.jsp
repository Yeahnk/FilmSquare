<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인 화면</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link
	href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css"
	rel="stylesheet" crossorigin="anonymous" />
	
<style>

body {
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    font-family: roboto;
    background-color: black; /* 배경색을 검정색으로 지정 */
}

.container {
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column; /* 수평으로 정렬 */
    height: 100%;
    position: relative;
    top: -50px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
    padding: 15px;
    display: inline-block;
    border: none;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}
img {
    vertical-align: middle;
    border-style: none;
    position: relative;
    margin-bottom: 50px; /* 이미지 아래에 간격을 줍니다. */
}

/* 버튼 스타일링 추가 */
button {
    background-color: #FFFFFF;
    color: black;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin-top: 15px; /* 버튼 위에 간격을 줍니다. */
}

button:hover {
    background-color: salmon;
}

</style>	
</head>

<body>

<%
    // 로그인 실패 여부 확인
    boolean loginFailed = request.getAttribute("loginFailed") != null && (boolean) request.getAttribute("loginFailed");
    if (loginFailed) {
%>
    <script>
        alert("아이디 또는 비밀번호가 틀렸습니다. 다시 로그인 해주세요.");
    </script>
<%
    }
%>

<div class="container">
    <img src="./images/ottlogo/black.png">
    <form method="post" action="<%=request.getContextPath() %>/admin">
        <p>
            <label for="adminname"></label> <input
                type="text" id="adminname" name="adminId"
                placeholder="ID" required autofocus>
        </p>
        <p>
            <label for="password"></label> <input
                type="password" id="password" name="adminPw"
                placeholder="PASSWORD" required>
        </p>
        <button type="submit">ADMIN LOGIN</button>
    </form>
</div>

</body>

</html>
