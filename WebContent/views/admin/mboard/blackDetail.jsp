<!DOCTYPE html>
<%@page import="admin.vo.AdminVO"%>
<%@page import="admin.vo.MvcReportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  List<MvcReportVO> list = (List<MvcReportVO>)request.getAttribute("mvcReportList"); %>
<html lang="en">



<head>
<%
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
  <title>신고사유 조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
#backBtn{
	left: 0;
	font-weight: bold;
	border-radius: 20px;
	position: relative;
}

th {
font-family: 'Roboto', sans-serif;
font-size: 18px;
}
body, h3 {
  font-family: 'Roboto', sans-serif;

}
#pageArea {
  display: flex;
  justify-content: center;
font-weight: bold;
}
</style>  
  
</head>
<body>

<div class="container">
  <h2>신고사유 조회</h2>
  <table class="table">
    <thead>
      <tr>
        <th><%=list.get(0).getMemId()%>님의 신고 사유</th>
      </tr>
    </thead>
    <tbody>
     	<%
	   
	    	if(list != null){
		    	for(int i=0; i<list.size(); i++){
		%>
	      <tr>
	        <td><%=list.get(i).getMvcrpContent() %></td>
	      </tr>
	    <%
	    		}//for end
	    	}
	    %>
    </tbody>
  </table>
  <button id="backBtn" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;" type="button" onclick="location.href='/FilmSquare/admin/mboard/list.do' ">뒤로가기</button>
  
  

  
  
</div>

</body>
</html>
