<%@page import="admin.vo.EditorBoardVO"%>
<%@page import="admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>에디터 게시글 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
<!-- 부트스트랩 참조 영역 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
      crossorigin="anonymous">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha384-1H217gwSVyLSIfaLxHbE7dRb3v4mYCKbpQvzx0cegeju1MVsGrX5xXxAvs/HgeFs" crossorigin="anonymous"></script>

<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>
img {
	height: 300px;
	width: 700px;
	margin-top: 20px;
	margin-bottom: 10px; 
}

hr {
	border-color: black;

}


</style>

</head>

<%
	EditorBoardVO ebVO = (EditorBoardVO) request.getAttribute("ev");

	AdminVO av = (AdminVO) session.getAttribute("LOGIN_ADMIN");
if (av == null) {
%>
	<script>
	
	alert("관리자 로그인을 해주세요.");
	console.log("관리자 로그인 해주세요.");
	
	</script>
<%
	response.sendRedirect(request.getContextPath() + "/admin");
	return;
}
%>

<body>

<!-- 게시글 디테일 영역 시작 -->
 <body>
 		
 		<% 
 			if(ebVO != null) {
 		%>
 		
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- 게시글 제목 -->
                            <h1 class="fw-bolder mb-1"><%=ebVO.getEbTitle()%></h1>
                            <!-- 작성일자 -->
                            <div class="text-muted fst-italic mb-2">작성일 : <%=ebVO.getEbDate()%></div>
                        </header>
                        <!-- 이미지 -->
                        <figure class="mb-2"><img class="img-fluid rounded" src=".././images/eboard/<%=ebVO.getEbiStreNm()%>" alt="이미지" /></figure>
                        <hr>
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4"><%=ebVO.getEbtContent()%></p>
			                <hr>
			                <div id="select-button">
			                	<a href="<%=request.getContextPath()%>/admin/eboard/list.do"><button>목록</button></a>
			                	<a href=""><button>게시글 수정</button></a>
			                	<a href="<%=request.getContextPath()%>/admin/eboard/delete.do?ebId=<%=ebVO.getEbId()%>"><button>게시글 삭제</button></a>
			                </div>
                        </section>
                    </article>
                </div>
            </div>
        </div>
		<%
 			}
 		%>

</body>
</html>
