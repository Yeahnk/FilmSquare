
<%@page import="admin.vo.AdminVO"%>
<%@page import="admin.vo.QnaReplyVO"%>
<%@page import="admin.vo.QnaVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	List<QnaVO> qnaList =(List<QnaVO>)request.getAttribute("qnaList");
	
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
<title>문의 게시판 조회</title>
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
<input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
  <table class="table">
		    <thead>
		      <tr>
		        <th style="width: 10%">순번</th>
		        <th style="width: 35%">문의내용</th>
		        <th style="width: 15%">작성자</th>
		        <th style="width: 15%">작성일</th>
		        <th style="width: 15%">전체보기</th>
		        <th style="width: 15%">답변여부</th>
		      </tr>
		    </thead>
		   <tbody id="myTable">

		<%
	    	List<QnaVO> list = (List<QnaVO>)request.getAttribute("qnaList");
	    	if(list != null){
		    	for(int i=0; i<list.size(); i++){
	    %>
	      <tr>
	        <td id=qaId><%=list.get(i).getQaId() %></td>
	        <td><%=list.get(i).getQaContent() %></td>
	        <td><%=list.get(i).getQaEmail() %></td>
	        <td><%=list.get(i).getQaDate() %></td>
	        <td><!-- 전체보기 모달 버튼 -->
  <button type="button" class="btn btn-danger" data-target="#myModal" style="background-color: black; color: white; border-radius: 0; border-color: white;"
    onclick="detail('<%=list.get(i).getQaTitle() %>', '<%=list.get(i).getQaContent() %>', '<%=list.get(i).getQareContent() %>')">전체보기</button></td>
	        <td><!-- 답변 모달 버튼 -->
  <button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#answerModal<%=i %>" data-backdrop="static" <% if (!list.get(i).getQareContent().equals("답변이 등록되지 않았습니다.")) { %> style="display: none;" <% } else {%>style="background-color: black; color: white; border-radius: 0; border-color: white;" <%} %>>답변</button>
</td>
	      </tr>
	      
	        
   <!-- 답변 모달 영역 시작 -->
  <div class="modal fade" id="answerModal<%=i %>" role="dialog">
    <div class="modal-dialog">
    
      <!-- 모달 컨텐츠 -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">답변 등록</h4>
        </div>
        <div class="modal-body">
          <p id="qaAnswer"></p>
          <form id="answerForm">
          <div class="form-group">
            <textarea class="form-control" rows="4" id="answerText<%=i %>" name="answerText<%=i %>"></textarea>
          </div>
          <button type="button" class="btn btn-danger" style="background-color: black; color: white; border-radius: 0; border-color: white;" onclick="submitAnswer('<%=list.get(i).getQaId() %>',$('#answerText<%=i %>').val())">등록</button>
        </form>
        </div>

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
  
  
<!-- 전체보기 모달 영역 시작 -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
        <!-- 모달 컨텐츠 -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="qaTitle"></h4>
            </div>
            <div class="modal-body">
                <p id="qaContent"></p>
                
                <!-- 수평선 추가 -->
                <hr>
                
                <p id="qareContent"></p> <!-- 답변 내용 추가 -->
            </div>
        </div>
      
    </div>
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
	
		
</div>

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
		location.href="/FilmSquare/admin/qboard/list.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.paginatio').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="/FilmSquare/admin/qboard/list.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.paginatio').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="/FilmSquare/admin/qboard/list.do?page=" + currentPage;
	});

	/* 전체보기 모달  */


    function detail(qaTitle, qaContent, qareContent) {
        // 모달 내용에 다른 데이터를 동적으로 설정
        $('#qaTitle').text(qaTitle ? qaTitle : '제목 없음');
        $('#qaContent').text(qaContent);
        $('#qareContent').text(qareContent);

        // 모달을 엽니다.
        $('#myModal').modal('show');
    }
    
	
    
    /* 답변달기 모달 */
       
  function submitAnswer(qaId, answerText) {
    // AJAX를 사용하여 서버로 데이터 전송
    $.ajax({
        type: 'POST',  // 전송 방식 (POST 또는 GET)
        url: 'unList/answer.do',  // 서버의 엔드포인트 URL (실제 서버 URL로 대체해야 함)
        data: { answerText: answerText, qaId: qaId },  // 전송할 데이터
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
                $('#answerModal').modal('hide');
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

    
	
   
</script>	
	
	
<%
	if(msg.equals("성공")){
%>
<script>
	alert('정상적으로 처리되었습니다.');
</script>
<%
	}
%>
</body>
</html>