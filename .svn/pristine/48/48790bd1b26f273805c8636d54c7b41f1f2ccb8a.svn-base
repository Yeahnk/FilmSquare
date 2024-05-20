<%@page import="admin.vo.AdminVO"%>
<%@page import="admin.vo.EditorBoardVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    List<EditorBoardVO> editorList = (List<EditorBoardVO>) request.getAttribute("editorList");
    String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
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
	console.log("관리자 로그인을 해주세요.");
	
	</script>
<%
	response.sendRedirect(request.getContextPath() + "/admin");
	return;
}
%>
    <meta charset="UTF-8">
    <title>에디터 게시판 조회</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        table, th {
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

#writeBoard {
	position: relative;       	
	left: 1050px;
}
        
  .modal-backdrop {
    opacity: 0 !important;
  }        
    </style>
</head>
<body>
<div class="container">
<input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>

<!-- 리스트출력 영역 start -->
  <table class="table">
    <thead>
            <tr>
                <th style="width: 10%">순번</th>
                <th style="width: 40%">제목</th>
                <th style="width: 15%">작성일</th>
                <th>공개여부</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody id="myTable">

            <%
                List<EditorBoardVO> list = (List<EditorBoardVO>) request.getAttribute("editorList");
                if (list != null) {
                    for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
						<td><%=list.get(i).getEbId()%></td>
						<td><a href="<%=request.getContextPath()%>/admin/editorDetail.do?ebId=<%=list.get(i).getEbId()%>"><%=list.get(i).getEbTitle()%></a></td>
						<td><%=list.get(i).getEbDate()%></td>
						<td><button type="button" class="btn btn-danger visibility-toggle" style="background-color: black; color: white; border-radius: 0; border-color: white;" data-id="<%=list.get(i).getEbId()%>">
    					<%= "Y".equals(list.get(i).getEbYn()) ? "공개" : "비공개" %>
						</button></td>

						<td><button type="button" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;">관리</button></td>
</tr>

            <%
                    }//for end
                } else {
            %>
            <tr>
                <td>게시물 없음</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
	<button id="writeBoard" class="btn btn-danger" type="button" style="background-color: black; color: white; border-radius: 0; border-color: white;" onclick="location.href='<%=request.getContextPath()%>/admin/editorInsert.do' ">글쓰기</button>
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
	
	//페이징처리
	$('.paginatio div').on('click',function(){
// 		alert( $(this).text() );
		location.href="/FilmSquare/admin/eboard/list.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.paginatio').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="/FilmSquare/admin/eboard/list.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.paginatio').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="/FilmSquare/admin/eboard/list.do?page=" + currentPage;
	});



$(document).ready(function () {
    $('.visibility-toggle').on('click', function (e) {
        e.preventDefault();

        var ebId = $(this).data('id');

        // 가시성 업데이트를 위한 AJAX 요청
        $.ajax({
            type: 'POST',
            url: '/FilmSquare/admin/eboard/toggleVisibility.do', // 실제 서버 엔드포인트로 교체
            data: 'ebId=' + ebId, 
            success: function (response) {
                // 서버가 성공 상태를 반환한다고 가정
                if (response.success) {
                    // 페이지에서 가시성 텍스트 전환
                    var visibilityText = $(e.target).text();
                    $(e.target).text(visibilityText === '공개' ? '비공개' : '공개');
                    alert('가시성이 성공적으로 업데이트되었습니다.');
                } else {
                    alert('가시성을 업데이트하는 데 실패했습니다.');
                }
            },
            error: function () {
                alert('요청을 처리하는 동안 오류가 발생했습니다.');
            }
        });
    });
});

</script>


<%
    if (msg.equals("성공")) {
%>
<script>
    alert('정상적으로 처리되었습니다.');
</script>
<%
    }
%>
</body>
</html>
