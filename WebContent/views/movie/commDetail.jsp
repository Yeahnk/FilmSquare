<%@page import="movie.vo.MvPosterVO"%>
<%@page import="comment.vo.ReplyVO"%>
<%@page import="member.vo.AtchFileVO"%>
<%@page import="movie.vo.MvCommentVO"%>
<%@page import="movie.vo.MvCollectionVO"%>
<%@page import="movie.vo.VodVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.vo.ActorVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="movie.vo.MvGradeVO"%>
<%@page import="movie.vo.PosterVO"%>
<%@page import="movie.vo.MovieInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MovieInfoVO mvv = (MovieInfoVO) request.getAttribute("mvDetail");
	MvPosterVO pv = (MvPosterVO) request.getAttribute("mvPoster");
	MvGradeVO mgv = (MvGradeVO) request.getAttribute("mvGrade");
	List<ActorVO> actorList = (List<ActorVO>) request.getAttribute("actorList");
	List<VodVO> vodList = (List<VodVO>) request.getAttribute("vodList");
	List<MvCollectionVO> cltList = (List<MvCollectionVO>) request.getAttribute("cltList"); 
	List<MvCommentVO> cmtList = (List<MvCommentVO>) request.getAttribute("cmtList");
	List<ReplyVO> rv =(List<ReplyVO>)request.getAttribute("rv");
	// 세션에 로그인 정보 꺼내기
	MvCommentVO mvc =(MvCommentVO) request.getAttribute("mvC");
	MemberVO mv = (MemberVO) request.getSession().getAttribute("LOGIN_MEMBER");
	
	System.out.println(" mvC>>>"+ mvc);		  
	System.out.println("rv2>>>"+rv);		  
			    
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* Add more styles as needed */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width:100%;
  height:200%;
  overflow: hidden;
  background-color: rgba(0, 0, 0, 0);
}

.modal-content {
  position: relative;
  margin: 10% auto;
  padding: 10px;
  max-height: 80%;
  overflow-y: auto;
  width: 30%;
  background: #F2F2F2;
  border-radius: 8px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  gap: 38px;
}
    .container {
      width: 100%;
      padding: 10px;
      box-sizing: border-box;
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
.header {
	align-self: stretch;
	display: flex;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 38px;
}

.image-container {
	width: 248px;
	height: 360px;
	position: relative;
	box-shadow: 0px 0px 20px 4px rgba(0, 0, 0, 0.15);
}

.info-container {
	flex: 1 1 0;
	align-self: stretch;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 16px;
}

.user-info {
	align-self: stretch;
	padding-top: 11px;
	padding-bottom: 11px;
	border-bottom: 1px #AFAFAF solid;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	gap: 32px;
}

.user-image {
	width: 111px;
	height: 110px;
	border-radius: 9999px;
}

.user-details {
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 16px;
	display: flex;
}

.user-name {
	color: #1F1F1F;
	font-size: 30px;
	font-family: Roboto;
	font-weight: 600;
	line-height: 22px;
	word-wrap: break-word;
}

.user-description {
	padding-left: 4px;
	padding-right: 4px;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 10px;
	display: flex;
	color: #848485;
	font-size: 21px;
	font-family: Roboto;
	font-weight: 300;
	line-height: 22px;
	word-wrap: break-word;
}

.title-section {
	align-self: stretch;
	flex: 1 1 0;
	padding-top: 2px;
	padding-bottom: 2px;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 16px;
	display: flex;
}

.title-info {
	color: black;
	font-size: 33px;
	font-family: Roboto;
	font-weight: 800;
	word-wrap: break-word;
}

.date-info {
	color: #848485;
	font-size: 23px;
	font-family: Nokora;
	font-weight: 300;
	line-height: 24px;
	word-wrap: break-word;
}

.content-section {
	align-self: stretch;
	flex: 1 1 0;
	color: black;
	font-size: 22px;
	font-family: Roboto;
	font-weight: 400;
	line-height: 24px;
	word-wrap: break-word;
}

.footer {
	/* Add styles for the footer */
	
}

.comment-section {
	align-self: stretch;
	height: 200px;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 4px;
	display: flex;
}

.comment-user {
	align-self: stretch;
	padding-left: 16px;
	padding-right: 16px;
	padding-top: 8px;
	padding-bottom: 8px;
	border-top: 1px #AFAFAF solid;
	border-bottom: 1px #AFAFAF solid;
	justify-content: space-between;
	align-items: flex-start;
	display: flex;
}

.comment-image {
	width: 35px;
	height: 34px;
	border-radius: 9999px;
	border: 1px #4B4B4B solid;
}

  #openModalButton {
            cursor: pointer;
        }
.comment-username {
	color: black;
	font-size: 20px;
	font-family: Roboto;
	font-weight: 600;
	line-height: 22px;
	word-wrap: break-word;
}

.comment-text {
	color: #787878;
	font-size: 17px;
	font-family: Roboto;
	font-weight: 400;
	line-height: 22px;
	word-wrap: break-word;
}
</style>
</head>

<body>
	<div class="virtual-image-container" onclick="openModal()">
   <img src="<%= pv.getPosterImg() %>" alt="이미지" style="width: 10%; height: 10%; object-fit: cover;">
   <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white; font-size: 24px; font-weight: bold;">
      클릭하여 모달 열기
   </div>
</div>

	<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="container" id="draggableModal">
					<img class="image-container"
						src="<%=pv.getPosterImg() %>" />
					<div class="info-container">
    
    <div>
    <div>
    <div>
    <div class="user-info">
    <img class="user-image" src="
    <%
    for (int i = 0; i < 1; i++) {
        String mempPath = cmtList.get(i).getMempPath();
        if (mempPath == null) {
    %>
        https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
    <%
        } else {
            mempPath = cmtList.get(i).getMempPath().substring(cmtList.get(i).getMempPath().indexOf("images"));
    %>
        ./<%= mempPath %>
    <%
        }
    }
    %>
    " />
    <div class="user-details">
        <div class="user-name">
        <%
        for(int i=0; i<1; i++){
        
        %>
        	<%= cmtList.get(i).getMemNcnm() %>
		<%
		}
		%>        
        </div>
        <div class="user-description">
         <%
        for(int i=0; i<1; i++){
        
        %>
        	<%= cmtList.get(i).getMemIntro() %>
		<%
		}
		%>      
       
        
        
        </div>
    </div>
</div>
</div>
</div>
<div class="title-section">
    <div class="title-info"><%= mvv.getMvTitle() %></div>
    <div class="date-info">
    <%
    for (int i = 0; i < 1; i++) {
    %>
        <%= cmtList.get(i).getMvcRegdt() %>
    <%
    }
    %>
    </div>
</div>

<div class="content-section">
    <%
    for (int i = 0; i < 1; i++) {
    %>
        <%= cmtList.get(i).getFullContent() %>
    <%
    }
    %>
</div>
		
			</div>
					</div>
					<div
					style="align-self: stretch; height: 200px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
					<div
						style="align-self: stretch; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; border-top: 1px #AFAFAF solid; border-bottom: 1px #AFAFAF solid; justify-content: space-between; align-items: flex-start; display: inline-flex">
						<div
							style="height: 22px; justify-content: flex-start; align-items: flex-start; gap: 16px; display: flex">
							
							<div
								style="color: #787878; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">좋아요
								39</div>
							<div
								style="color: #787878; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">댓글
								25</div>
						</div>
						
							
							
							
						<div
							style="justify-content: flex-start; align-items: flex-start; gap: 40px; display: flex">
							<div
								style="padding-top: 1px; padding-bottom: 1px; justify-content: flex-start; align-items: flex-start; gap: 8px; display: flex">
								<div
									style="width: 13.87px; height: 14.25px; background: #787878"></div>
								<div
									style="color: #787878; font-size: 16px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word">좋아요</div>
							</div>
							<div
								style="padding-top: 1px; padding-bottom: 1px; justify-content: flex-start; align-items: flex-start; gap: 8px; display: flex">
								<div
									style="width: 13.50px; height: 13.50px; background: #787878"></div>
								<div
									style="color: #787878; font-size: 16px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word">댓글</div>
							</div>
						</div>
					</div>
<!-- 댓글 입력 폼 -->
<textarea id="mvcreContent" rows="4" cols="50"></textarea><br>

<!-- 댓글 등록 버튼 -->
<button type="button" onclick="submitReply()">댓글 등록</button>
							<%
							
							for(int i=0; i<rv.size(); i++ ){
							
                    			%>
				<div
					style="align-self: stretch; padding: 8px 16px; justify-content: flex-start; align-items: flex-start; gap: 16px; display: inline-flex;">
					<div
						style="height: 34px; justify-content: flex-start; align-items: center; gap: 16px; display: flex;">
						<img
							style="width: 35px; height: 34px; border-radius: 9999px; border: 1px #4B4B4B solid;"
							src="
								<%String mempPath = rv.get(i).getMempStreNm();
							 if(mempPath == null) {
				                   %>
								https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
                    <%
                    }else {
                    	mempPath = rv.get(i).getMempStreNm();%> 
								
								./images/pf/<%=mempPath%>
								<%System.out.println("memPath<<<<<<<<"+mempPath); %>
                    	<%
                    	}
                    	%>
								" />
					</div>
					<div
						style="color: black; font-size: 20px; font-family: Roboto; font-weight: 600; line-height: 22px; word-wrap: break-word"><%=rv.get(i).getMemNcnm() %>
					</div>
					<div
						style="color: #787878; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word"><%=rv.get(i).getMvcreContent() %>
					</div>
				</div>
			</div>
							<%}%>
	
			</div>
			</div>
			</div>
			
					
	
	
							

<script>
document.addEventListener("DOMContentLoaded", function () {
    var modal = document.getElementById("myModal");
    var draggableModal = document.getElementById("draggableModal");
    var isDragging = false;
    var offset = { x: 0, y: 0 };

    draggableModal.addEventListener("mousedown", function (event) {
        isDragging = true;
        offset = {
            x: event.clientX - modal.offsetLeft,
            y: event.clientY - modal.offsetTop,
        };
    });

    window.addEventListener("mousemove", function (event) {
        if (isDragging) {
            modal.style.left = event.clientX - offset.x + "px";
            modal.style.top = event.clientY - offset.y + "px";
        }
    });

    window.addEventListener("mouseup", function () {
        isDragging = false;
    });

    // 모달 바깥 영역 클릭 시 모달 닫기
    window.addEventListener("click", function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });
});

function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

function submitReply() {
    // 댓글 내용 가져오기
    var mvcreContent = document.getElementById("mvcreContent").value;

    // Ajax를 이용하여 서버에 댓글 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "./replyInsert.do", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    // 전송할 데이터 설정
    var data = "memId=" + encodeURIComponent("<%= rv.get(0).getMemId() %>") +
        "&mvcId=" + encodeURIComponent("<%= rv.get(0).getMvcId() %>") +
        "&mvcreId=" + encodeURIComponent("<%= rv.get(0).getMvcreId() %>") +
        "&mvcreContent=" + encodeURIComponent(mvcreContent);

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // 서버 응답 처리
            alert(xhr.responseText);
            // 여기에 필요한 추가 작업을 수행할 수 있습니다.
        }
    };

    // 데이터 전송
    xhr.send(data);
}
</script>
</body>



</html>
