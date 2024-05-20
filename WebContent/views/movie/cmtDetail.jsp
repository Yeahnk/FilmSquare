<%@page import="member.servive.MemberServiceImpl"%>
<%@page import="member.servive.IMemberService"%>
<%@page import="movie.vo.MovieInfoVO"%>
<%@page import="movie.vo.MvPosterVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="comment.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.vo.MvCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   

	MovieInfoVO mvv = (MovieInfoVO) request.getAttribute("mvDetail");
	MvPosterVO pv = (MvPosterVO) request.getAttribute("mvPoster"); //영화 포스터
	MvCommentVO cmtv = (MvCommentVO) request.getAttribute("cmtv");
	List<ReplyVO> rList = (List<ReplyVO>) request.getAttribute("rList");
	

	MemberVO mv = (MemberVO) request.getSession().getAttribute("LOGIN_MEMBER");

%>  	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코멘트 상세 페이지</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<a href="javascript:history.back()">
<span class="glyphicon glyphicon-remove" style="padding-top: 50px; margin-left: auto; font-size: 30px; left: 75%; position: relative;"></span>
</a>
<div style="width: 100%; height: 100%; flex-direction: column; justify-content: flex-start; align-items: center; gap: 14px; display: inline-flex">
    <div style="width: 1125px; height: 100%; padding-left: 50px; padding-right: 50px; padding-top: 10px; padding-bottom: 40px; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 38px; display: flex">
        <div style="align-self: stretch; justify-content: flex-start; align-items: flex-start; gap: 38px; display: inline-flex">
            <img style="width: 248px; height: 360px; position: relative; box-shadow: 0px 0px 20px 4px rgba(0, 0, 0, 0.15)" src="<%=pv.getPosterImg() %>" />
            <div style="flex: 1 1 0; align-self: stretch; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 16px; display: inline-flex">
                <div style="align-self: stretch; padding-top: 11px; padding-bottom: 11px; border-bottom: 1px #AFAFAF solid; justify-content: flex-start; align-items: center; gap: 32px; display: inline-flex">
                    <img style="width: 111px; height: 110px; border-radius: 9999px" src="
                    
                                        <% //프로필 사진
                    String mempPath = cmtv.getMempPath();
                    if(mempPath == null) {
                    %>
                    	https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
                    <%
                    }else {
                    	mempPath = cmtv.getMempPath().substring(cmtv.getMempPath().indexOf("images"));
                    %>
                    ./<%= mempPath%>
                    <%
                    }
                    %>  
                    
                    " />
                    <div style="flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 16px; display: inline-flex">
                        <div style="color: #1F1F1F; font-size: 25px; font-family: Roboto; font-weight: 600; line-height: 22px; word-wrap: break-word"><%=cmtv.getMemNcnm() %></div>
                        <div style="padding-left: 4px; padding-right: 4px; justify-content: flex-start; align-items: flex-start; gap: 10px; display: inline-flex">
                            <div style="color: #848485; font-size: 18px; font-family: Roboto; font-weight: 300; line-height: 22px; word-wrap: break-word">
                            
                    <% //소개글
                    if(cmtv.getMemIntro() == null) {
                    	
                    %>
                    <%
                    }else {
                    %>
                    	<%= cmtv.getMemIntro()%>
                    <%
                    }
                    %>
                           </div>
                        </div>
                    </div>
                </div>
                <div style="align-self: stretch; flex: 1 1 0; padding-top: 2px; padding-bottom: 2px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 16px; display: flex">
                    <div style="align-self: stretch; justify-content: space-between; align-items: flex-start; display: inline-flex">
                        <div style="color: black; font-size: 28px; font-family: Roboto; font-weight: 800; word-wrap: break-word"><%=mvv.getMvTitle() %></div>
                        
                        <div style="color: #848485; font-size: 18px; font-family: Nokora; font-weight: 300; line-height: 24px; word-wrap: break-word"><%=cmtv.getMvcRegdt() %></div>
                    </div>
                    <div style="align-self: stretch; flex: 1 1 0; color: black; font-size: 18px; font-family: Roboto; font-weight: 400; line-height: 24px; word-wrap: break-word"><%=cmtv.getFullContent() %></div>
                </div>
            </div>
            
        </div>
        <div style="align-self: stretch; height: 200px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
            <div style="align-self: stretch; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; border-top: 1px #AFAFAF solid; border-bottom: 1px #AFAFAF solid; justify-content: space-between; align-items: flex-start; display: inline-flex">
                <div style="height: 22px; justify-content: flex-start; align-items: flex-start; gap: 16px; display: flex">
                    <div style="color: #787878; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">좋아요 <%=cmtv.getMvcLikeCnt() %></div>
                    <div style="color: #787878; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">댓글 <%=cmtv.getMvcReplyCnt() %></div>
                </div>
                <div style="justify-content: flex-start; align-items: flex-start; gap: 40px; display: flex">
                    <div style="padding-top: 1px; padding-bottom: 1px; justify-content: flex-start; align-items: flex-start; gap: 8px; display: flex">
                       <i class="material-icons" style="color: #787878;">thumb_up</i>
                       <a href="#likelink" onclick="mvcLikeInsert('<%=mv.getMemId() %>', '<%=cmtv.getMvcId() %>')" style="color: #787878; font-size: 16px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word; text-decoration: none;">좋아요</a>
                       <div> </div>
                       <i class="material-icons" style="color: #787878;">notifications</i>
                       <div style="color: #787878; font-size: 16px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word; text-decoration: none; cursor: pointer;">신고하기</div>
                    </div>
                    <div style="padding-top: 1px; padding-bottom: 1px; justify-content: flex-start; align-items: flex-start; gap: 8px; display: flex">
                    </div>
                </div>
            </div>
            <div style="align-self: stretch; height: 200px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
        <!-- 댓글 입력 폼 시작 -->
        <div style="align-self: stretch; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; justify-content: flex-start; align-items: flex-start; gap: 16px; display: inline-flex">
        <input type="text" id="mvcreContent" placeholder="댓글을 입력하세요" style="flex: 1; height: 34px; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; border: 1px #AFAFAF solid; border-radius: 4px; padding: 8px; box-sizing: border-box; text-decoration: none;" onkeydown="handleKeyDown(event)"/>
    <button type="button" onclick="replyInsert(<%=mv.getMemId() %>,<%=cmtv.getMvcId() %>, $('#mvcreContent').val())" style="background-color: #888888; color: white; border: none; border-radius: 4px; padding: 8px 16px; font-size: 17px; cursor: pointer;">댓글 등록</button>
        </div>
    <!-- 댓글 입력 폼 끝 -->
            <!-- 댓글 시작 -->
           
           
           
       
           
            <%
            int max = Math.min(rList.size(),10);
            for(int i=0; i<max; i++) {
            
            %>
            <div style="align-self: stretch; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; justify-content: flex-start; align-items: flex-start; gap: 76px; display: inline-flex">
                <div style="height: 34px; justify-content: flex-start; align-items: center; gap: 16px; display: flex">
                    <img style="width: 35px; height: 34px; border-radius: 9999px; border: 1px #4B4B4B solid" src="
                   
                      <% //프로필 사진
                    if(rList.get(i).getMempStreNm() == null) {
                    %>
                    	https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
                    <%
                    }else {
                    
                    %>
                    ./images/pf/<%=rList.get(i).getMempStreNm() %>
                    <%
                    }
                    %>  
      
                    " />
                  <div style="color: black; font-size: 18px; font-family: Roboto; font-weight: 600; line-height: 22px; word-wrap: break-word"><%=rList.get(i).getMemNcnm() %></div>
                    <div style="color: #787878; font-size: 15px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word"><%=rList.get(i).getMvcreContent() %></div>
                    
         
                    
                    <div style="color: #787878; font-size: 13px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word"> ⠂<%=rList.get(i).getMvcrecDate() %></div>
                <!-- 수정 버튼 -->
  <button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#updateModal<%=i %>" data-backdrop="static" <% if (!rList.get(i).getMemId().equals(mv.getMemId())) { %> style="display: none;" <% } %>>수정</button>
  				<!-- 삭제 버튼 -->
  <button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#deleteModal<%=i %>" data-backdrop="static" <% if (!rList.get(i).getMemId().equals(mv.getMemId())) { %> style="display: none;" <% } %>>삭제</button>
           <div style="margin-bottom: 100px;"></div>
            
        
            
           <!-- 수정 모달 영역 시작 -->
  <div class="modal fade" id="updateModal<%=i %>" role="dialog">
    <div class="modal-dialog">
      <!-- 수정 모달 컨텐츠 -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h5 class="modal-title">수정할 댓글 내용을 써주세요</h5>
        </div>
        <div class="modal-body">
          <form id="updateForm">
          <div class="form-group">
            <textarea class="form-control" rows="4" id="updateText<%=i %>" name="updateText<%=i %>"></textarea>
          </div>
          <button type="button" class="btn" onclick="submitupdate('<%=rList.get(i).getMvcreId() %>',$('#updateText<%=i %>').val())">등록</button>
        </form>
        </div>

      </div>
      
    </div>
  </div><!-- 수정 모달 끝 -->

  <!-- 삭제 모달 -->
<div class="modal fade" id="deleteModal<%=i %>" role="dialog" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                댓글을 삭제할까요?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" onclick="confirmDelete('<%=rList.get(i).getMvcreId() %>')">예</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
            </div>
        </div>
    </div>
</div><!-- 삭제 모달 끝  -->


                </div>
            </div><!-- 댓글 끝 -->
            <%} %>
            
        </div>
    </div>
</div>

<br>
<br>
<br>
<br>
<br>




<script>

function submitupdate(mvcreId, updateText) {
    // 여기에서 답변 폼 데이터를 처리하는 로직을 추가하세요.
    // 예를 들어, AJAX 호출을 사용하여 서버에 답변을 전송할 수 있습니다.
    console.log(mvcreId + updateText);

    // AJAX를 사용하여 서버로 데이터 전송
    $.ajax({
        type: 'POST',  // 전송 방식 (POST 또는 GET)
        url: '<%=request.getContextPath()%>/mvcRpUpdate.do',  // 서버의 엔드포인트 URL (실제 서버 URL로 대체해야 함)
        data: { mvcreId: mvcreId, updateText: updateText },  // 전송할 데이터
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: '댓글이 수정되었어요',
                showConfirmButton: false,
                timer: 1000  // 1초 뒤에 알림이 사라짐
            });

            // 1초 뒤에 성공하면 콘솔에 메시지를 표시하고 모달을 닫음
            setTimeout(function() {
                $('#answerModal').modal('hide');
                // 리스트 새로고침
                location.reload();
            }, 1000);
        },
        error: function (error) {
            console.error('에러 발생:', error);
            // 에러 처리를 원하면 추가하세요.
        }
    });
}

// 댓글 삭제
function confirmDelete(mvcreId) {
    // 여기에 댓글 삭제 처리를 위한 Ajax 코드를 작성합니다.
    // 예제: 삭제할 댓글의 인덱스(index)를 서버로 전달하는 경우
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/mvcRpDelete.do",
        data: { mvcreId: mvcreId },
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: '댓글이 삭제되었어요',
                showConfirmButton: false,
                timer: 1000  // 1초 뒤에 알림이 사라짐
            });
            // 1초 뒤에 모달을 닫습니다.
            setTimeout(function() {
                $('#deleteModal').modal('hide');
                // 리스트 새로고침
                location.reload();
            }, 1000);
        },
        error: function (error) {
            // 실패 시 실행할 코드
            console.error("댓글 삭제 Ajax 요청 실패", error);
            // 1초 뒤에 모달을 닫습니다.
            setTimeout(function() {
                $('#deleteModal').modal('hide');
            }, 1000);
        }
    });
}

// 댓글 등록
function handleKeyDown(event) {
    if (event.key === "Enter") {
        // Enter 키를 눌렀을 때, 원하는 동작 수행
        replyInsert(<%=mv.getMemId() %>, <%=cmtv.getMvcId() %>, $('#mvcreContent').val());
        // 텍스트 박스로 포커스 이동
        document.getElementById('mvcreContent').focus();
    }
}

function replyInsert(memId, mvcId, mvcreContent) {
    console.log(memId + mvcId + mvcreContent);
    // Ajax로 데이터 전송
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath() %>/replyInsert.do",
        data: {
            memId: memId,
            mvcId: mvcId,
            mvcreContent: mvcreContent
        },
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: '댓글이 등록되었어요',
                showConfirmButton: false,
                timer: 1000  // 1초 뒤에 알림이 사라짐
            });
            // 1초 뒤에 여기에서 화면 갱신 또는 새로운 댓글 추가 등의 동작을 수행할 수 있습니다.
            // 예를 들어, 화면 갱신을 위해 페이지 새로고침
            setTimeout(function() {
                location.reload();
            }, 1000);
        },
        error: function (error) {
            // 실패 시 실행할 코드
            Swal.fire({
                icon: 'error',
                title: '댓글 등록 실패',
                text: '댓글 등록에 실패했어요.',
            });
            // 1초 뒤에 텍스트 박스로 포커스 이동
            setTimeout(function() {
                document.getElementById('mvcreContent').focus();
            }, 1000);
        }
    });
    // 텍스트 박스로 포커스 이동
    document.getElementById('mvcreContent').focus();
}

// 좋아요 버튼
function mvcLikeInsert(memId, mvcId) {
    // Ajax로 dopost 방식으로 데이터 전송
    $.ajax({
        type: "POST",
        async: false,
        url: "<%=request.getContextPath() %>/mvcLikeInsert.do",
        data: { memId: memId, mvcId: mvcId },
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: '이 코멘트에 좋아요를 했어요',
                showConfirmButton: false,
                timer: 1000  // 1초 뒤에 알림이 사라짐
            });
            // 1초 뒤에 리스트 새로고침
            setTimeout(function() {
                location.reload();
            }, 1000);
        },
        error: function (error) {
            // 실패 시 실행할 코드
            Swal.fire({
                icon: 'error',
                title: 'Ajax 요청 실패',
                text: '댓글 좋아요 등록에 실패했어요.',
            });
            // 1초 뒤에 리스트 새로고침
            setTimeout(function() {
                location.reload();
            }, 1000);
        }
    });
}


</script>
</body>
</html>