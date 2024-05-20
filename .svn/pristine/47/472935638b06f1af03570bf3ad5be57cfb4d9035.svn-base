<%@page import="movie.vo.SottVO"%>
<%@page import="comment.vo.ReplyVO"%>
<%@page import="movie.vo.MvPosterVO"%>
<%@page import="movie.vo.MvCommentVO"%>
<%@page import="movie.vo.MvCollectionVO"%>
<%@page import="movie.vo.VodVO"%>
<%@page import="java.util.List"%>
<%@page import="movie.vo.ActorVO"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="movie.vo.MvGradeVO"%>
<%@page import="movie.vo.MovieInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%

	MemberVO loginMem = (MemberVO)request.getAttribute("LOGIN_MEMBER");

	MvGradeVO memGrade;
	List<MvCollectionVO> memClList;
	if(loginMem!=null){
		memGrade = (MvGradeVO) request.getAttribute("memGrade"); //접속자의 별점
		memClList = (List<MvCollectionVO>) request.getAttribute("memClList");	
	}

	MovieInfoVO mvv = (MovieInfoVO) request.getAttribute("mvDetail");
	MvPosterVO pv = (MvPosterVO) request.getAttribute("mvPoster"); //영화 포스터
	MvGradeVO mgv = (MvGradeVO) request.getAttribute("mvGrade"); //영화에 대한 평균 별점
	List<ActorVO> actorList = (List<ActorVO>) request.getAttribute("actorList");
	List<VodVO> vodList = (List<VodVO>) request.getAttribute("vodList");
	List<MvCollectionVO> cltList = (List<MvCollectionVO>) request.getAttribute("cltList"); 
	List<MvCommentVO> cmtList = (List<MvCommentVO>) request.getAttribute("cmtList");
	List<List<MvPosterVO>> pLists = (List<List<MvPosterVO>>) request.getAttribute("pLists"); //컬렉션 포스터
	List<MvCommentVO> mvcList =(List<MvCommentVO>)request.getAttribute("mvcList");
// 	List<ReplyVO> rv =(List<ReplyVO>)request.getAttribute("rv");
// 	MvCommentVO mvc =(MvCommentVO) request.getAttribute("mvC");
	MvCommentVO cmtv = (MvCommentVO) request.getAttribute("mvcv");
	List<ReplyVO> rList = (List<ReplyVO>) request.getAttribute("rList");
	List<SottVO> sottList = (List<SottVO>) request.getAttribute("sottList");
	
	

	MemberVO mv = (MemberVO) request.getSession().getAttribute("LOGIN_MEMBER");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>영화 상세 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/detail.css">
  
  <style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
  
.full-width-image {
    position: relative;
    width: 100%;
    height: 100vh;
    background-size: cover; /*혹은 contain*/
    background-position: center;
    background-repeat: no-repeat;
    display: flex;
    align-items: flex-end; /* 이미지의 상단에 정렬되도록 수정 */
    justify-content: flex-start; /* 이미지의 왼쪽에 정렬되도록 수정 */
    color: white;

}

.text-container {
    margin-left: 20px; /* 왼쪽 여백 조정 */
    text-align: left;
}

 h3 {
    font-weight: bold; /* 글꼴을 두껍게 설정 */
    margin-left: 20px; /* 왼쪽 여백 조정 */
}

.grade {
 	display: flex;
	justify-content: center;
}
.star {
	margin: 10px;
}
.top {
 	display: flex;
	justify-content: space-between;
}

/* css 적용 */

.subject {
 padding:15px;
 font-size: 24px;
 font-family: Roboto;
 font-weight: 700;
 line-height: 28px;
 word-wrap: break-word
}
.MvTitle {
 color: white;
 font-size: 47px;
 font-family: Roboto;
 font-weight: 800;
 word-wrap: break-word
}
.Engtitle {
 color: white;
 font-size: 24px;
 font-family: Roboto;
 font-weight: 400;
 word-wrap: break-word
}
.Ryear{
color: white;
font-size: 16px;
font-family: Roboto;
font-weight: 400;
word-wrap: break-word
}
.smallsj {
 color: black;
 font-size: 18px;
 font-family: Roboto;
 font-weight: 700;
 line-height: 28px;
 word-wrap: break-word
}








@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/* 예고편 */
    .video-container {
        position: relative;
        padding-bottom: 56.25%; /* 16:9 비율을 유지하려면 (높이 / 너비) * 100% 값을 사용합니다. */
        height: 0;
        overflow: hidden;
    }

    .video-container iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 



  .rounded-image-container {
        width: 90px; /* 이미지의 너비 */
        height: 90px; /* 이미지의 높이 */
        overflow: hidden; /* 이미지를 부모 요소로 잘라냅니다. */
        border-radius: 50%; /* 50%로 설정하여 동그랗게 만듭니다. */
    }

    .rounded-image-container img {
        width: 100%; /* 이미지가 부모 요소의 크기에 맞게 표시됩니다. */
        height: auto; /* 비율을 유지하면서 이미지의 높이가 조정됩니다. */
        display: block; /* inline 속성을 해제하여 여백을 제거합니다. */
    }

.container {
    width: 100%;
    bottom: -8px;
    left: 0px;
    position: relative;
    background-color: black;
    opacity: 0.8;
    padding: 38px;
    margin: 0;
}


  </style>
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<div class="full-width-image" style="background-image: url('<%=mvv.getMvBackground()%>')">
  <div class="container">
    <div class="MvTitle"><%=mvv.getMvTitle() %></div>
    <div class="Engtitle"><%=mvv.getMvEngtitle() %></div>
    <div class="Ryear"><%=mvv.getMvRyear() %> / <%=mvv.getMvGenre()%> / <%=mvv.getMvNation() %>
    <br><%=mvv.getMvRtime() %>분 / <%=mvv.getMvAgelimit()%></div>
  </div>
</div>
 
<!-- 포스터 및 상세정보 -->
<div class="container-fluid bg-3">    
 <br>
  <div class="row">
    <div class="col-sm-3">
    
    <!-- 포스터 첫번째 이미지 -->
      <img src="<%=pv.getPosterImg() %>" class="img-responsive" style="width:100%" alt="PosterImage">
    </div>
    <div class="col-sm-9"> 
      <div class="top">
      	<div class="grade">
 			<h4 class ="star">
    		<!-- 별점기능 -->
      		
<fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5"></label>
    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4"></label>
    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3"></label>
    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half"></label>
    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2"></label>
    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1"></label>
    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf"></label>
</fieldset>
			<div style="color: #8C8C8C; font-size: 13px; font-family: Roboto; font-weight: 400; line-height: 12px; word-wrap: break-word">
      		<%
      		if (memGrade == null) {
			%>
			별점을 등록해 주세요
      		<%
      		}else {
      		%>
 			이 영화에 <%=(double)memGrade.getMvgRating()/10%>점을 주었어요
 			<%
      		}
 			%>
			</div>
      		<h4 class ="star">평균 별점 <br> ★<%=(double) mgv.getGradeAvg()/10 %></h4>
      		<h4 class ="star">평론가 별점 <br> ★<%=(double) mgv.getGradeCAvg()/10 %></h4>
      	</div> <!-- grade end -->
      	
      	<!--  시청가능 OTT 바로가기 -->
		 <%
		 for(int i=0; i<sottList.size(); i++) {
		 %>
		 
		
		 <div class="rounded-image-container">
		 <a href ="<%=sottList.get(i).getSottLink() %>" target="_blank"> 
		<img src="./images/ottlogo/<%= sottList.get(i).getOttId()%>.png" alt="OTT">
		</a>
		</div>
		 
		  
		  <%
		  }  
		 %>
      	
      	<div class="later-write">
  		<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#cltModal" data-backdrop="static">나의 컬렉션에 담기</button>
      	<button id="mvlater" onclick="mvlater('<%=mvv.getMvId()%>','<%=mv.getMemId()%>')">보고싶어요</button>
  		<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#commentModal" data-backdrop="static">코멘트 쓰기</button>



<!-- 컬렉션 담기 모달 창 -->
<div class="modal fade" id="cltModal" tabindex="-1" role="dialog" aria-labelledby="cltModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="cltModalLabel">나의 컬렉션 목록</h4>
            </div>
            <div class="modal-body" id="clListContainer">
            <div style="display: flex; justify-content: space-between; align-items: center;">
    <input type="text" id="clTitle" style="flex: 1; padding: 10px; margin: 8px 0; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px; outline: none;" placeholder="새로운 컬렉션 제목을 입력해 주세요">
    <button type="button" class="btn btn-primary" style="margin-left: 10px; padding: 10px 20px;" onclick="clInsert(<%=mv.getMemId() %>,$('#clTitle').val())">+</button>
</div>

                <!-- 모달 내용을 추가 -->
                <%
                for(int i=0 ; i<memClList.size(); i++) {
			    %>
				<hr>
			<div style="display: flex; justify-content: space-between; cursor: pointer;" onclick="mycl(<%=memClList.get(i).getClId()%>,<%=mvv.getMvId()%>)">

			   <div><%=memClList.get(i).getClTitle() %></div>
			    <div><%=memClList.get(i).getClDate() %></div>
				</div>	
			    
			    
			    <%            	
                }
                %>
                <p></p>
            </div>
            
        </div>
    </div>
</div>




  
  <!-- 코멘트 모달 영역 시작 -->
<div class="modal fade" id="commentModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- 모달 컨텐츠 -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">❝ <%=mvv.getMvTitle() %> ❞ 에 대한 생각을 자유롭게 작성해 주세요.</h4>
      </div>
      <div class="modal-body">
        <p id="comment"></p>
        <form id="commentForm">
          <div class="form-group">
            <textarea class="form-control" rows="4" id="commentText" name="commentText"></textarea>
          </div>
          <!-- 날짜 선택 입력 칸 추가 -->
          <div class="form-group">
            <label for="commentDate">언제 감상하셨나요?</label>
            <input type="date" class="form-control" id="commentDate" name="commentDate">
          </div>
          <!-- 체크박스 추가 -->
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="approvalCheckbox" name="approvalCheckbox" value="Y">
            <label class="form-check-label" for="approvalCheckbox">스포일러가 포함되었다면 체크해 주세요.</label>
          </div>
          <br>
          <!-- 등록 버튼 -->
          <button type="button" class="btn btn-primary" onclick="submitComment(<%=mv.getMemId() %>,<%=mvv.getMvId() %>,$('#commentText').val(), getCheckboxValue(),$('#commentDate').val())">등록</button>
        </form>
      </div>
    </div>
  </div>
</div>


  
  

      	</div>
      </div> <!-- top end -->
      <hr> <!-- 선  -->
      <p><%=mvv.getMvPlot() %></p>

      <br><br>

<!-- 출연진 -->

<div class="subject">출연/제작</div>
<div class="container-fluid bg-4">    
  <div class="row">

<% 
    int max = Math.min(actorList.size(),12);
    for(int i=0; i < max; i++ ){
%>
    
    <div class="col-sm-4">
    <a href="<%=request.getContextPath() %>/personDetail.do?psId=<%=actorList.get(i).getPsId() %>" style="text-decoration: none">
 <div style="width: 100%; display: flex; align-items: center; gap: 12px;">
	
    <img style="padding: 1px; width: 56px; height: 56px; position: relative; box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.08) inset; border-radius: 5px" 
    src="
    <%
    	if(actorList.get(i).getPsiSrc() == null) {
    %>
    	https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
    <%
    	}else {
    %>
     <%=actorList.get(i).getPsiSrc() %>
    <%
    	}
    %>
   " />
    <div style="flex-direction: column; display: inline-flex;">
        <div style="width: 100%; height: 23px; color: #1E1E1E; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word;">
        <%=actorList.get(i).getPsName() %></div>
        <div style="width: 100%; height: 19px; color: #8C8C8C; font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word;">
        <%=actorList.get(i).getActorRole() %></div>
    </div>
    
</div>
</a>

</div><!-- col-sm-4 end -->
<%
    }
%>



</div>
</div><br>

<!-- 예고편 보기 -->

<div class="subject">예고편 보기</div>
<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <%
    for(int i=0; i<3; i++){
    %>	
    <div class="col-sm-4">
    
       <video width="100%" height="auto" controls>
        <source src="./images/ottlogo/test.mp4" type="video/mp4"></source>
		</video>
<%--         <video width="100%" height="auto" controls muted autoplay>
        <source src="<%= vodList.get(i).getMvvodLink() %>" type="video/mp4""></source>
		</video>  --%>
		


      
      <div class ="smallsj"><%= vodList.get(i).getMvvodTitle() %></div>
    </div>
    <%
    }
    %>

  </div>
</div>
    </div>
  </div>
</div>



<!-- 컬렉션 -->


<div style="width: 100%; height: 100%; padding-left: 16px; padding-right: 16px; justify-content: space-between; align-items: center; display: inline-flex">
<div class="subject">이 영화가 담긴 컬렉션 보기</div> <!-- 사진 넣고 링크 걸어야 함 -->
</div>
    
   <%

    int cltMax = Math.min(cltList.size(), 5);
   	
    for(int i=0; i<cltMax; i++){
	int pMax = Math.min(pLists.get(i).size(),4);
   %>	 
    <a href="<%=request.getContextPath() %>/collectionDetail.do?clId=<%=cltList.get(i).getClId() %>" style="text-decoration: none">
    <div style="width: 320px; flex-direction: column; justify-content: flex-start; align-items: center; gap: 8px; display: inline-flex">
    <div style="padding: 8px; background: #C4C4C4; box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.08) inset; border-radius: 5px; overflow: hidden; flex-direction: column; justify-content: flex-start; align-items: center; gap: 8px; display: flex">
        <%
        for(int j=0; j<pMax; j++) {
        %>
        <div style="justify-content: flex-start; align-items: center; gap: 8px; display: inline-flex">
            <img id="cltposter" style="width: 70px; height: 140px; position: relative; border-radius: 4px" src="<%=pLists.get(i).get(j).getPosterImg() %>" />
        </div>
        <%} %>
    </div>
    <div style="align-self: center; justify-content: flex-start; align-items: center; gap: 8px; display: inline-flex; margin-top: 8px;">
        <div style="color: black; font-size: 18px; font-family: Roboto; font-weight: 700; line-height: 28px; word-wrap: break-word"><%=cltList.get(i).getClTitle() %></div>
    </div>
	</div>
	</a>
 	<%
    }
	%> 



<!-- 코멘트 -->


<div style="width: 100%; height: 100%; padding-left: 16px; padding-right: 16px; justify-content: space-between; align-items: center; display: inline-flex">
<div class="subject">코멘트</div>
<a href="<%=request.getContextPath() %>/cmtMore.do?mvId=<%=mvv.getMvId() %>" style="color: #FF2F6E; font-size: 16px; font-family: Roboto; font-weight: 600; word-wrap: break-word; text-decoration: none">더보기</a>
</div>


<div style="width: 100%; height: 100%; justify-content: flex-start; align-items: flex-start; gap: 20px; display: inline-flex"> <!-- 코멘트 전체 시작 -->
    
    
    <%
    int cmtMax = Math.min(cmtList.size(), 5);
    for(int i = 0; i<cmtMax; i++){
    %>
    <!-- 코멘트 한블럭 시작-->
    <div id ="likelink" style="width: 320px; height: 270px; padding-left: 12px; padding-right: 12px; background: #F2F2F2; border-radius: 8px; overflow: hidden; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 38px; display: inline-flex">
        <div style="width: 300px; padding-bottom: 1px; border-bottom: 1px #E5E5E5 solid; justify-content: center; align-items: center; gap: 16px; display: inline-flex">
            <div style="flex: 1 1 0; align-self: stretch; padding-top: 11px; padding-bottom: 11px; padding-right: 94.48px; justify-content: flex-start; align-items: center; gap: 8px; display: inline-flex">
                <div style="width: 32px; height: 32px; padding: 1px; border-radius: 16px; overflow: hidden; border: 1px rgba(0, 0, 0, 0.08) solid; justify-content: center; align-items: center; display: inline-flex">
                    <img style="width: 30px; height: 30px" src="
                    <% //프로필 사진
                    String mempPath = cmtList.get(i).getMempPath();
                    if(mempPath == null) {
                    %>
                    	https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
                    <%
                    }else {
                    	mempPath = cmtList.get(i).getMempPath().substring(cmtList.get(i).getMempPath().indexOf("images"));
                    %>
                    ./<%= mempPath%>
                    <%
                    }
                    %>  
                    " />
                </div>
                <div style="align-self: stretch; justify-content: flex-start; align-items: center; gap: 8px; display: inline-flex">
                    <div style="color: #1F1F1F; font-size: 17px; font-family: Roboto; font-weight: 600; line-height: 22px; word-wrap: break-word"><%=cmtList.get(i).getMemNcnm() %></div><!-- 멤버 닉네임 -->
                </div>
            </div>
            <div style="width: 55.52px; padding-top: 3.50px; padding-bottom: 3.50px; padding-left: 9px; padding-right: 8.58px; background: white; border-radius: 13px; border: 1px #EAEAEA solid; justify-content: center; align-items: flex-start; gap: 3px; display: inline-flex">
                <div style="width: 16px; height: 16px; justify-content: center; align-items: center; display: inline-flex">
                    <div style="flex: 1 1 0; align-self: stretch; justify-content: center; align-items: center; display: inline-flex">
                        <div style="width: 16px; height: 16px; position: relative; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
                            <div style="width: 14.67px; height: 14px; background: #4A4A4A"></div>
                        </div>
                    </div>
                </div>
                <div style="width: 18.94px; height: 19px; color: #4A4A4A; font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word"><%=(double) cmtList.get(i).getMemMvgRating()/10 %></div><!-- 멤버 평점 -->
            </div>
        </div>
        <div style="width: 300px; height: 72px; padding-top: 2px; padding-bottom: 2px; justify-content: center; align-items: center; display: inline-flex">
            <div style="width: 301.36px; height: 68px; color: black; font-size: 15px; font-family: Roboto; font-weight: 400; line-height: 24px; word-wrap: break-word">
            <a href="<%=request.getContextPath() %>/cmtDetail.do?mvId=<%=mvv.getMvId() %>&mvcId=<%=cmtList.get(i).getMvcId() %>" style="text-decoration: none; color: inherit; display: block; width: 100%; height: 100%;">
      
            <%
				if(cmtList.get(i).getMvcSpoyn().equals("Y")){
			%>
					<div style="text-align: center;">스포일러가 포함된 코멘트입니다.<br>클릭해 주세요.</div>
			<%
				}else {
            %>
            <%=cmtList.get(i).getMvcContent() %> 
            <% } %>    
            </a>
            </div><!-- 코멘트 내용 -->
        </div>
        <div style="width: 300px; height: 44px; position: relative; border-top: 1px #E5E5E5 solid">
            <div style="padding-top: 1px; padding-bottom: 1px; left: 3px; top: 12.50px; position: absolute; justify-content: flex-start; align-items: flex-start; gap: 8px; display: inline-flex">
                <div style="width: 18px; height: 18px; justify-content: center; align-items: center; display: flex">
                    <div style="flex: 1 1 0; align-self: stretch; justify-content: center; align-items: center; display: inline-flex">
                        <div style="width: 18px; height: 18px; position: relative; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
                            <div style="width: 13.87px; height: 14.25px; background: #787878"></div>
                        </div>
                    </div>
                </div>
                <div style="color: #787878; font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word"><%= cmtList.get(i).getMvcLikeCnt() %></div><!-- 좋아요 개수 -->
            </div>
            <div style="padding-top: 1px; padding-bottom: 1px; left: 44.56px; top: 12.50px; position: absolute; justify-content: flex-start; align-items: flex-start; gap: 8px; display: inline-flex">
                <div style="width: 18px; height: 18px; justify-content: center; align-items: center; display: flex">
                    <div style="flex: 1 1 0; align-self: stretch; justify-content: center; align-items: center; display: inline-flex">
                        <div style="width: 18px; height: 18px; position: relative; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
                            <div style="width: 13.50px; height: 13.50px; background: #787878"></div>
                        </div>
                    </div>
                </div>
                <div style="width: 7.92px; height: 19px; color: #787878; font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 19px; word-wrap: break-word"><%=cmtList.get(i).getMvcReplyCnt() %></div><!-- 댓글 개수 -->
            </div>
            <a href="#likelink" onclick="mvcLikeInsert('<%=mv.getMemId() %>', '<%=cmtList.get(i).getMvcId() %>')" style="width: 107px; height: 23px; left: 190px; top: 15px; position: absolute; text-align: right; color: #FF2F6E; font-size: 17px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word; text-decoration: none">좋아요</a>
        </div> 
    </div> <!-- 코멘트 한블럭 끝 -->
    <%
    }
    %>

</div>  <!-- 코멘트 전체 끝 -->








	<%@include file="../../include/footer.jsp"%>



<script>



//////나의 컬렉션 새로 만들기

    function clInsert(memId,clTitle) {
  		console.log(memId+'컬렉션제목:'+clTitle);

    // Ajax 요청
    $.ajax({
        url: '<%=request.getContextPath()%>/clInsert.do', // 실제 서버 컨트롤러 URL로 변경
        type: 'POST', // 또는 'GET'
        data: { memId: memId, clTitle: clTitle }, // 서버로 전송할 데이터
        success: function (response) {
            // Ajax 요청이 성공하면 여기서 수행할 작업
            Swal.fire({
                icon: 'success',
                title: '새로운 컬렉션을 만들었어요',
                showConfirmButton: false,
                timer: 1500  // 1.5초 뒤에 알림이 사라짐
            });
            // 1.5초 뒤에 리스트 새로고침
            setTimeout(function () {
                location.reload();
            }, 1500);
        },
        error: function (error) {
            // Ajax 요청이 실패하면 여기서 수행할 작업
            console.error('에러 발생:', error);
        }
    });
}

/////나의 컬렉션에 담기
function mycl(clId, mvId) {
    // Ajax 요청
    	console.log(clId+"|"+mvId);
    $.ajax({
        type: "POST", // 또는 "GET"
        url: "<%=request.getContextPath()%>/myClInsert.do", // 서버의 실제 URL로 변경
        data: {clId: clId, mvId: mvId},
        success: function(response) {
            // Ajax 요청이 성공하면 실행되는 부분
            Swal.fire({
                icon: 'success',
                title: '컬렉션에 담았어요',
                showConfirmButton: false,
                timer: 1500  // 1.5초 뒤에 알림이 사라짐
            });
        },
        error: function(error) {
            // Ajax 요청이 실패하면 실행되는 부분
            console.error("컬렉션 담기 요청 실패:", error);
        }
    });
}


///// 별점 출력 selectedRating
$(document).ready(function () {
    // 라디오 버튼 변경 이벤트 리스너 추가
    $('input[name="rating"]').on('change', function () {
        // 선택된 별점 값 가져오기
        var selectedRating = $('input[name="rating"]:checked').val();
        // 가져온 값 출력 (콘솔 또는 다른 로직으로 활용)
        console.log("Selected Rating: " + selectedRating);
        
        // Ajax로 선택된 별점 값을 서버로 전송
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/mvGradeInsert.do",  // 서버 URL을 입력해주세요
            data: {
            selectedRating:selectedRating,
            mvId:<%=mvv.getMvId()%>,
            memId:<%=mv.getMemId()%>
            },
            success: function (response) {
                // 성공 시 실행할 코드
                Swal.fire({
                    icon: 'success',
                    title: '별점을 등록했어요',
                    showConfirmButton: false,
                    timer: 1500  // 1.5초 뒤에 알림이 사라짐
                });
                // 1.5초 뒤에 리스트 새로고침
                setTimeout(function () {
                    location.reload();
                }, 1500);
            },
            error: function (error) {
                // 실패 시 실행할 코드
                console.log("별점 등록 실패", error);
                Swal.fire({
                    icon: 'error',
                    title: '별점 등록 실패',
                    text: '별점 등록 중 오류가 발생했어요',
                });
            }
        });
        
    });
});



////////// 좋아요 버튼

function mvcLikeInsert(memId, mvcId) {
    // Ajax로 dopost 방식으로 데이터 전송
    console.log(memId,mvcId);
    $.ajax({
        type: "POST",
        async: false,
        url: "<%=request.getContextPath() %>/mvcLikeInsert.do",
        data: { memId: memId, mvcId: mvcId },
        success: function(response) {
            // 성공 시 실행할 코드
            Swal.fire({
                icon: 'success',
                title: '이 코멘트에 좋아요를 했어요',
                showConfirmButton: false,
                timer: 1500  // 1.5초 뒤에 알림이 사라짐
            });
            // 1.5초 뒤에 리스트 새로고침
            setTimeout(function () {
                location.reload();
            }, 1500);
        },
        error: function(error) {
            // 실패 시 실행할 코드
            Swal.fire({
                icon: 'error',
                title: 'Ajax 요청 실패',
                text: '댓글 좋아요 등록에 실패했어요',
            });
            // 1.5초 뒤에 리스트 새로고침
            setTimeout(function () {
                location.reload();
            }, 1500);
        }
    });
}




///////////보고싶어요 버튼 클릭 시 실행할 함수//////////

function mvlater(mvId, memId) {
    console.log("mvId값:", mvId);
    console.log("memId값:", memId);
    if (memId != null) {
    	 // Ajax 요청 보내기
        $.ajax({
            type: 'POST', // 또는 'GET' 등 HTTP 메소드 선택
            url: '<%=request.getContextPath()%>/laterInsert.do',
            // dataType: 'json', // 응답 데이터 형식 (JSON을 기대할 경우)
            data: {mvId:mvId,memId:memId},
            success: function (response) {
                // 성공 시 처리할 코드
                Swal.fire({
                    icon: 'success',
                    title: '나중에 볼 영화에 추가되었어요',
                    showConfirmButton: false,
                    timer: 1500  // 1.5초 뒤에 알림이 사라짐
                });
            },
            error: function (error) {
                // 오류 시 처리할 코드
                console.error('영화 추가 중 오류 발생:', error);
                Swal.fire({
                    icon: 'error',
                    title: '영화 추가 실패',
                    text: '나중에 볼 영화 추가 중 오류가 발생했어요',
                });
            }
        });
    } else {
        Swal.fire({
            icon: 'info',
            title: '로그인 필요',
            text: '로그인을 해주세요',
        });
    }
}


////////////코멘트 작성////////////
// 체크박스 값 가져오기
function getCheckboxValue() {
    return $('#approvalCheckbox').is(':checked') ? 'Y' : 'N';
}

// 서버에 등록하는 함수
function submitComment(memId, mvId, commentText, checkboxValue, commentDate) {
    console.log("코멘트 전송:" + memId + mvId + commentText + checkboxValue + commentDate);
    $.ajax({
        type: 'POST',  // HTTP 요청 방식 (POST)
        url: '<%=request.getContextPath()%>/cmtInsert.do',  // 서버 엔드포인트 URL (실제로 사용하는 서버의 URL로 변경)
        data: {
            memId: memId,
            mvId: mvId,
            commentText: commentText,
            checkboxValue: checkboxValue,
            commentDate: commentDate
        },
        success: function (response) {
            // 성공적으로 서버에 데이터를 전송한 경우 수행할 로직
            console.log('데이터 전송 성공:', response);
            Swal.fire({
                icon: 'success',
                title: '코멘트가 등록되었어요',
                showConfirmButton: false,
                timer: 1500  // 1.5초 뒤에 알림이 사라짐
            });
            // 모달을 닫을 수 있도록 필요에 따라 추가적인 처리를 수행
            $('#commentModal').modal('hide');
        },
        error: function (error) {
            // 서버에 데이터 전송 중 오류가 발생한 경우 수행할 로직
            console.error('데이터 전송 오류:', error);
            Swal.fire({
                icon: 'error',
                title: '코멘트 등록 실패',
                text: '코멘트 또는 날짜가 입력되지 않았어요',
            });
        }
    });
}

$(document).ready(function () {
    // 코멘트 모달이 닫힐 때 이벤트 처리
    $('#commentModal').on('hidden.bs.modal', function () {
        // 텍스트 박스 초기화
        $('#commentText').val('');
        // 날짜 입력란 초기화
        $('#commentDate').val('');
        // 체크박스 초기화
        $('#approvalCheckbox').prop('checked', false);
        // 기타 초기화 로직이 있다면 추가 가능
    });
});

</script>



</body>
</html>
