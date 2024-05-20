
<%@page import="admin.vo.AdminVO"%>
<%@page import="admin.vo.MvcReportVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	List<MvcReportVO> mvcReportList =(List<MvcReportVO>)request.getAttribute("mvcReportList");
	
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
<title>미처리 신고 조회</title>
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
	<h3>미처리 신고 내역을 조회합니다.</h3>
<input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table">
		    <thead>
				<tr>
					<th>순번</th>
					<th>코멘트 내용</th>
					<th>작성자</th>
					<th>신고자</th>
					<th>신고사유</th>
					<th>관리</th>
				</tr>
			 </thead>
    		<tbody id="myTable">

		<%
	    	List<MvcReportVO> list = (List<MvcReportVO>)request.getAttribute("mvcReportList");
	    	if(list != null){
		    	for(int i=0; i<list.size(); i++){ 
	    %>
	    
	      <tr>
			<td><%=list.get(i).getMvcrpId() %></td>
			<td><a href="#"><%=list.get(i).getMvcContent() %></a></td>
			<td><%=list.get(i).getMvcMemEmail() %></td>
			<td><%=list.get(i).getRpMemEmail() %></td>
			<td><%=list.get(i).getMvcrpContent() %></td>
			<td><!-- 모달 버튼 -->
  <button type="button" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;" data-toggle="modal" data-target="#myModal<%=i %>" data-backdrop="static">수정</button></td>
  
  	<!-- 모달 영역 시작 -->
  <div class="modal fade" id="myModal<%=i %>" role="dialog" data-bs-backdrop="false">
    <div class="modal-dialog">
    
      <!-- 모달 컨텐츠 -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">신고글 처리</h4>
        </div>
        <div class="modal-body">
          <!-- 블랙리스트 추가 버튼 -->
        <button type="button" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;" onclick="black('<%= list.get(i).getMemId() %>')">블랙리스트 추가</button>
        <!-- 처리완료 버튼 -->
        <button type="button" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;" onclick="complete('<%= list.get(i).getMvcrpId() %>')">처리완료</button>
        <!-- 처리완료 버튼 -->
        <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 0;">처리보류</button>
        </div>
<!--         <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div> -->
      </div>
      
    </div>
  </div>
  
  
		<%
	    		}//for end
	    	}else{
	    %>
	    		<tr>
		          <td>게시물 없음</td>
		      	</tr>
		<%			      
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
		location.href="/FilmSquare/admin/mvcReport/list.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.paginatio').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="/FilmSquare/admin/mvcReport/list.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.paginatio').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="/FilmSquare/admin/mvcReport/list.do?page=" + currentPage;
	});
	
	
	/* 모달  */

  function black(memId) {
    // AJAX를 이용하여 서버로 요청을 보냅니다.
    $.ajax({
        type: 'POST',
        url: '/FilmSquare/admin/mboard/List/update.do',
        data: { memId: memId },
        success: function (response) {
            // SweetAlert2로 성공 메시지 표시
            Swal.fire({
                title: '성공',
                text: '정상처리되었습니다.',
                icon: 'success',
                showConfirmButton: false,
                timer: 1500, // 3초 동안 메시지 보여줌
                timerProgressBar: true
            });

            // 3초 후에 모달을 닫고 페이지 새로고침
            setTimeout(function () {
                $('#myModal').modal('hide');
                location.reload();
            }, 1500);
        },
        error: function (error) {
            // SweetAlert2로 에러 메시지 표시
            Swal.fire({
                title: '에러',
                text: '에러가 발생했습니다. 다시 시도해주세요.',
                icon: 'error',
                showConfirmButton: true
            });

            console.error('에러 발생:', error);
            // 에러 처리를 원하면 추가하세요.
        }
    });
}

// 처리완료 클릭했을 때 실행되는 함수
function complete(mvcrpId) {
    // SweetAlert2로 성공 메시지 표시
    Swal.fire({
        title: '성공',
        text: '정상처리되었습니다.',
        icon: 'success',
        showConfirmButton: false,
        timer: 1500, // 3초 동안 메시지 보여줌
        timerProgressBar: true
    });

    // 3초 후에 모달을 닫습니다.
    setTimeout(function () {
        $('#myModal').modal('hide');
    }, 1500);

    // 2초 후에 AJAX를 이용하여 서버로 요청을 보냅니다.
    setTimeout(function () {
        $.ajax({
            type: 'POST',
            url: '/FilmSquare/admin/mvcReport/list/complete.do',
            data: { mvcrpId: mvcrpId },
            success: function (response) {
                // 페이지 새로고침
                location.reload();
            },
            error: function (error) {
                // SweetAlert2로 에러 메시지 표시
                Swal.fire({
                    title: '에러',
                    text: '에러가 발생했습니다. 다시 시도해주세요.',
                    icon: 'error',
                    showConfirmButton: true
                });

                console.error('에러 발생:', error);
                // 에러 처리를 원하면 추가하세요.
            }
        });
    }, 2000);
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