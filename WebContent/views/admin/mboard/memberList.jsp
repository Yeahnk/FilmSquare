
<%@page import="admin.vo.AdminVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	List<MemberVO> memberList =(List<MemberVO>)request.getAttribute("memberList");
	
	String msg = session.getAttribute("msg") == null ? ""
			: (String)session.getAttribute("msg");
	session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html>
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
<meta charset="UTF-8">
<title>회원 조회</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
table {
/*   table-layout: fixed; */
}
table, th, tr {
  text-align: center;
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
 .paginatio {
    display: flex;

  }
  .modal-backdrop {
    opacity: 0 !important;
  }


</style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<div class="container">
	

<!-- 리스트출력 영역 start -->
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table">
    <thead>
    	  <tr>
			<th>순번</th>
			<th>이메일</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>전화</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>신고건수</th>
			<th>정지여부</th>			
			<th>관리</th>
		 </tr>
    </thead>
    <tbody id="myTable">
<%
	if(memberList.size()==0){
		
%>	
		<tr>
			<td colspan="10">회원 정보가 존재하지 않습니다.</td>
		
		</tr>
<%
	}else{
		
		for(int i=0; i<memberList.size(); i++){ 
			
		
%>		
		<tr>
			<td><%=memberList.get(i).getMemId() %></td>
			<td><%=memberList.get(i).getMemEmail() %></td>
			<td><%=memberList.get(i).getMemName() %></td>
			<td><%=memberList.get(i).getMemNcnm() %></td>
			<td><%=memberList.get(i).getMemTelno() %></td>
			<td><%=memberList.get(i).getMemBirth() %></td>
			<td><%=memberList.get(i).getMemMW() %></td>
<%
	if(memberList.get(i).getReportCount() == 0) {
%>
			<td><%=memberList.get(i).getReportCount() %></td>
<%
	}else {
%>
			<td><a href="./blackList/detail.do?memId=<%=memberList.get(i).getMemId()%>"><%=memberList.get(i).getReportCount() %></a></td>
<%
	}
%>
			<td><%=memberList.get(i).getMemStopyn() %></td>
			<td><!-- 모달 버튼 -->
  <button type="button" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;" data-toggle="modal" data-target="#myModal<%=i %>" data-backdrop="static">수정</button></td>
		</tr>
		
			 <!-- 모달 영역 시작 -->
  <div class="modal fade" id="myModal<%=i %>" role="dialog">
    <div class="modal-dialog">
    
      <!-- 모달 컨텐츠 -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">블랙리스트에 추가하시겠습니까?</h4>
        </div>
        <div class="modal-body">
          <!-- 예 버튼 -->
        <button type="button" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;" onclick="confirm(<%=memberList.get(i).getMemId() %>)">예</button>
        <!-- 아니오 버튼 -->
        <button type="button" class="btn btn-default" style="border-radius: 0;" data-dismiss="modal">아니오</button>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div> -->
      </div>
      
    </div>
  </div>
<%
		}
	}
%>
 		</tbody>
	  </table>
	 </div>
	


	 
	<!-- 페이징 영역 start -->		
	<div id="pageArea">
		

		  <div class="prev"><a href="#" class="w3-button">PREV</a></div>
		  <div class="paginatio">
		<%
			int sPage = (int)request.getAttribute("sPage");
			int ePage = (int)request.getAttribute("ePage");
			int cPage = (int)request.getAttribute("cPage");
	
			for(int i=sPage; i<=ePage; i++){
				//페이지번호 활성화 처리
				if(cPage == i){
		%>
		  <div class="active"><a href="#" class="w3-button w3-black"><%=i %></a></div>
		<%			
				}else{
		%>
		  <div><a href="#" class="w3-button"><%=i %></a></div>
		<%
				}
			}//for end %>
		</div>
				  <div class="next"><a href="#" class="w3-button">NEXT</a></div>

	
	
	</div>
	<!-- 페이징 영역 end -->	
	





<script>


function redirectToMain() {
    // 페이지 리디렉션
    window.location.href = '<%=request.getContextPath()%>/admin/main.do';
}


//검색
	$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});


	$('.paginatio div').on('click',function(){
// 		alert( $(this).text() );
		location.href="/FilmSquare/admin/mboard/list.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.paginatio').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="/FilmSquare/admin/mboard/list.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.paginatio').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="/FilmSquare/admin/mboard/list.do?page=" + currentPage;
	});


	/* 모달  */

    // 예 버튼을 클릭했을 때 실행되는 함수
  function confirm(memId) {
    // 여기에 예 버튼을 클릭했을 때의 동작을 구현
    // 예를 들어, 어떤 작업을 수행하거나 서버로 요청을 보낼 수 있음
    console.log("memId값:", memId);

    // SweetAlert2를 사용하여 알림창 표시
    Swal.fire({
        title: '성공',
        text: '정상적으로 처리되었습니다.',
        icon: 'success',
        showConfirmButton: false,  // 확인 버튼 감추기
        timer: 1500,  // 1초 동안 메시지 보여줌
        timerProgressBar: true
    });

    // 1초 후에 모달을 닫습니다.
    setTimeout(function() {
        $('#myModal').modal('hide');
    }, 700);

    // 일정 시간 후에 실행되는 함수
    setTimeout(function() {
        // AJAX를 이용하여 서버로 요청을 보냅니다.
        $.ajax({
            type: 'POST',  // 또는 'GET' 등 HTTP 메소드 선택
            url: 'List/update.do',  // 서블릿의 URL
            data: { memId : memId },  // 전송할 데이터, 필요한 경우에 데이터 추가
            success: function(response) {
                // 리스트 새로고침
                location.reload();
            },
            error: function(error) {
                // 에러 발생 시의 동작을 구현
                console.error("에러 발생: " + error);
            }
        });
    }, 2000);  // 2초 후에 실행
}


</script>	
	
	
<%-- <%
	if(msg.equals("성공")){
%>
<script>
	alert('정상적으로 처리되었습니다.');
</script>
<%
	}
%> --%>
</body>
</html>