<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>FilmSquare</title>

    <!-- 부트스트랩 사용 링크 -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS파일 목록 -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />
    <style>
    
.top-bar {
  background-color: black;
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  padding: 13px 20px;
  position: relative;
  align-self: stretch;
  width: 100%
}

.top-bar .logo {
  display: flex;
  width: 376px;
  align-items: flex-start;
  justify-content: 
}

.top-bar .text-wrapper .div {
  transition: color 0.3s ease-in-out;
}

a {
  text-decoration: none;
  color: inherit;
}

.top-bar .no-underline:hover {
  text-decoration: none;
}
.top-bar .search {
  cursor: pointer;
  border-bottom: 1px solid transparent;
  display: inline-block;
}

.top-bar .search span,
.top-bar .search input {
  position: absolute;
  top: 0;
  left: 0;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.top-bar .search span {
  z-index: 2;
}

.top-bar .search:hover span {
  display: none; /* 호버 시 안보임 */
}

.top-bar .search input {
  z-index:1;
  border: none;
  outline: none;
  background-color: transparent;
  width: 300px;
  transition: width 0.3s ease-in-out;
  position: absolute;
  top: 0;
  left: 0;
}

.top-bar .search:hover input {
  width: 300px; /* 텍스트 입력창 길이 */
}
    
    
    </style>
  </head>
  <body>
  <header>
    <div class="nev-bar">
      <div href="<%=request.getContextPath()%>/main.do" class="nev-icon-frame logo">FILM SQUARE</div>
      <div href="<%=request.getContextPath() %>/releasingCal.do" class="nev-icon-frame calendar" style="background-image: url(./images/icons/header-icon/CALENDAR.png)"></div>
      <div href="<%=request.getContextPath() %>/map.do" class="nev-icon-frame map" style="background-image: url(./images/icons/header-icon/MAP.png)"></div> 
      <div class="nev-icon-frame search" id="searchContainer search"  style="background-image: url(./images/icons/header-icon/SEARCH.png)">
    	<span>SEARCH</span>
    	<input type="text" id="searchInput" placeholder="영화, 인물 컬렉션을 검색하세요"></div>
	<% 
	MemberVO mem = (MemberVO)session.getAttribute("LOGIN_MEMBER"); 

	if(mem != null && mem.getMemEmail() != null && !mem.getMemEmail().equals("")){
		String memId = mem.getMemId();
	%>
      <div href="<%=request.getContextPath()%>/mypage.do?memId=<%=memId%>" class="nev-icon-frame my-page" style="background-image: url(./images/icons/header-icon/MYPAGE.png)"></div>
      <div href="<%=request.getContextPath()%>/memLogout.do" class="nev-icon-frame logout" style="background-image: url(./images/icons/header-icon/LOGOUT.png)"></div>
	<%} else{ %>
      <div href="#회원 가입 링크#" class="nev-icon-frame join" style="background-image: url(./images/icons/header-icon/JOIN.png)"></div>
      <div href="<%=request.getContextPath()%>/memLogin.do" class="nev-icon-frame login" style="background-image: url(./images/icons/header-icon/LOGIN.png)"></div>
    </div>
	<% } %>
<script type="text/javascript">

document.getElementById('searchContainer').addEventListener('mouseenter', function () {
    document.getElementById('searchInput').focus();
  });

  document.getElementById('searchInput').addEventListener('focusout', function () {
    this.style.width = '0';
  });

</script>
  </header>
</body>
</html>