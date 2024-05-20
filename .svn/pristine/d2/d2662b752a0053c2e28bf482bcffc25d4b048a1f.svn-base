<%@page import="movie.vo.PosterInfoVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="character.vo.PersonLikeVO"%>
<%@page import="character.vo.PersonImageVO"%>
<%@page import="character.vo.PersonInfoVO"%>
<%@page import="character.vo.CharacterVO"%>
<%@page import="movie.vo.PosterVO"%>
<%@page import="movie.vo.MovieInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<style>
.row, .col-lg-12 {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.item {
	width: 300px;
	margin: 15px 20px;
}

/* .item img { */
/* 	height: auto; */
/* 	width: 100%; */
/* } */

.section-heading h2 {
	margin-top: 30px;
}

section {
	height: 100%;
}

section.our-courses {
	padding-top: 0;
}

#section-container {
	padding-top: 80px;
}

.header-area.header-sticky {
	background-color: black;
	min-height: 80px;
}

#news-table {
	z-index: 1;
	color: white;
}
.section-heading h2{
  font-size: xx-large;
  border-bottom: 0;
}

.section-heading h2.redH {
	color: red;
}

.love h2 {
	cursor: pointer;
	
}

p {
	color: white;
	font-weight: bolder;
	
}
li {
  color: white;
  font-weight: bolder;
}

#heart {
  font-size: 2em; 
}


.img-responsive {
  width: 300px; 
  height: 400px;
}

.love {
  justify-content: center;
  display: flex;
  left: 250px;
  position: relative;
}
.love p {
  font-size: x-large;
  margin: 30px 0px 50px;
  padding: 8px 15px 20px;
}


#person {
  height: 380px;
  left: 250px;
  position: relative;
}
#movietxt {
  font-size: 16px;
  line-height: 25px;
  padding-top: 5px;
}
#personinfo {
    font-size: x-large;
    line-height: 45px;
}

section.our-courses {
  padding-bottom: 30px;
}

#move{
  padding-top: 160px;
}

.col-sm-3 {
  flex: 0 0 auto;
  width: 20%;
  text-align: -webkit-center;
  
}
</style>

<%
	List<PersonImageVO> psiList = (List<PersonImageVO>) request.getAttribute("psiList");

	List<PersonInfoVO> psifList = (List<PersonInfoVO>) request.getAttribute("psifList");

	List<PersonLikeVO> pslkList = (List<PersonLikeVO>) request.getAttribute("pslkList");
	
	List<PosterInfoVO> pstifList = (List<PosterInfoVO>) request.getAttribute("pstifList");
	

%>


<!-- 인물사진 및 소개 -->
<div id="section-container">

	<section class="our-courses" id="courses">
		<div class="container">
			<div class="row">
<%
	if(psiList != null && !psiList.isEmpty()) {
		for(PersonImageVO psivo : psiList) {
%>
				<div class="col-lg-6">
				<div class="section-heading">
						<h2>인물정보</h2>
					</div>
					<div class="section-heading" style="width: 300px; height: 300px;">
					
						<img id="person" src="<%= psivo.getPsiSrc()%>" alt="이미지없음">
					</div>
				</div>
				<%
					}
				} else {
				%>
				
				<div class="col-lg-6">
				<div class="section-heading">
						<h2>인물정보</h2>
					</div>
					<div class="section-heading" style="width: 300px; height: 300px;">
					
						<img id="person" src="https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg" alt="이미지없음">
					</div>
				</div>
				<%
					}
				%>

				<%
					if (psifList != null) {
				%>
				<div class="col-lg-6">
				<div class="section-heading">
						<h2>&nbsp;</h2>
					</div>
					<ul id="personinfo">
						<li><h2><%=psifList.get(0).getPsName()%></h2></li>
						<%
							for (PersonInfoVO psinvo : psifList) {
						%>
						<li><%=psinvo.getPsinfoKey()%>&nbsp;&nbsp; &lt;<%=psinvo.getPsinfoVal()%>&gt;</li>
						<%
							}
						%>
					</ul>
				</div>
				<%
					} else {
				%>
				<h1>검색 결과가 없습니다.</h1>
				<%
					}
				%>

			</div>
			<hr>
		</div>
	</section>




	<%
	long psId = Long.parseLong(request.getParameter("psId"));
	System.out.print(psId);
	
	MemberVO mbvo = (MemberVO) request.getSession().getAttribute("LOGIN_MEMBER");
	String memberId = (mbvo != null) ? mbvo.getMemId() : null;
	
	
	boolean hasYValue = false; // 변수를 초기화합니다.
	
	if (pslkList != null && memberId != null ) {
	    for (PersonLikeVO pslkvo : pslkList) {
	        if ("Y".equals(pslkvo.getPslkYn()) && memberId.equals(pslkvo.getMemId())) {
	            hasYValue = true; // "Y" 값이 있는 경우 변수를 true로 설정합니다.
	            break; // 사용자의 선택이 있으면 반복문을 종료합니다.
	        } 
	    }
	}
	
	
	if(hasYValue){     
	%>
	<!-- 좋아요 -->
	<section class="our-courses" id="courses" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading love">
						<h2 class="redH" id="heart">&#x2665;</h2>
						<p>
							좋아요
							<%=pslkList.size()%>개
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%
        } else {
	%>
	<section class="our-courses" id="courses" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading love">
						<h2 class="whiteH" id="heart">&#x2665;</h2>
						<p>좋아요 <%=pslkList.size()%>개</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%
        
    }
	%>
	
	
	


	<%
	if(pstifList != null && !pstifList.isEmpty()){
		Set<String> onetitle = new HashSet<>();
		
	%>

	<!-- 출연작 사진 및 정보 -->
	<section class="our-courses" id="courses">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" id="move">
					<div class="section-heading">
						<h2>출연작</h2>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="container text-center">
						<h3></h3>
						<br>
						<div class="row">
	<%
	for(PosterInfoVO pstifvo : pstifList){
		String title = (pstifvo.getMvTitle() != null) ? pstifvo.getMvTitle() : "정보없음";
		String director = (pstifvo.getMvDirector() != null) ? pstifvo.getMvDirector() : "정보없음";
		String img = (pstifvo.getPosterImg() != null) ? pstifvo.getPosterImg() : request.getContextPath() + "/images/icons/alterPoster.png";
		String rdateString = (pstifvo.getMvRdate() != null) ? pstifvo.getMvRdate().toString() : "정보없음";
		
		if(onetitle.add(pstifvo.getMvTitle())){
	%>

							<div class="col-sm-3">
								<img src="<%=img %>" class="img-responsive movie-img"
									alt="/images/icons/alterPoster.png" data-mvId="<%= pstifvo.getMvId() %>">
								<p id="movietxt">제목&nbsp;&nbsp;&lt;&nbsp;<%=title %>&nbsp;&gt;</p>
								<p id="movietxt">감독 &nbsp;&nbsp;&lt;&nbsp;<%=director %>&nbsp;&gt;</p>
								<p id="movietxt">개봉일 &nbsp;&nbsp;&lt;&nbsp;<%=rdateString %>&nbsp;&gt;</p>
							</div>
	<%
		}
	}

	%>

						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%
		}
		

	%>


	<%@include file="../include/footer.jsp"%>

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/lightbox.js"></script>
	<script src="assets/js/tabs.js"></script>
	<script src="assets/js/video.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"
		integrity="sha512-HX+/SvM7094YZEKOCtG9EyjRYvK8dKlFhdYAnVCGNxMkA59BZNSZTZrqdDlLXp0O6/NjDb1uKnmutUeuzHb3iQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>

    //according to loftblog tut
    $('.nav li:first').addClass('active');

    var showSection = function showSection(section, isAnimate) {
      var
      direction = section.replace(/#/, ''),
      reqSection = $('.section').filter('[data-section="' + direction + '"]'),
      reqSectionPos = reqSection.offset().top - 0;

      if (isAnimate) {
        $('body, html').animate({
          scrollTop: reqSectionPos },
        800);
      } else {
        $('body, html').scrollTop(reqSectionPos);
      }

    };

    var checkSection = function checkSection() {
      $('.section').each(function () {
        var
        $this = $(this),
        topEdge = $this.offset().top - 80,
        bottomEdge = topEdge + $this.height(),
        wScroll = $(window).scrollTop();
        if (topEdge < wScroll && bottomEdge > wScroll) {
          var
          currentId = $this.data('section'),
          reqLink = $('a').filter('[href*=\\#' + currentId + ']');
          reqLink.closest('li').addClass('active').
          siblings().removeClass('active');
        }
      });
    };

    $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
      e.preventDefault();
      showSection($(this).attr('href'), true);
    });

    $(window).scroll(function () {
      checkSection();
    });
    
    
    
	
    </script>
	<script>
    document.getElementById('heart').addEventListener('click',function(){
    	
    	let xhr = new XMLHttpRequest();
    	xhr.open('POST','/FilmSquare/personDetail.do');
    	xhr.setRequestHeader('Content-Type','application/json');
    	
		let data ={};
		
		<% if(pslkList != null){%>
		
			data = {
				psId: <%=psifList.get(0).getPsId()%>		
			}
			
		<% } %>

    	console.log('보낼 데이타 >>>>>>' , data);
		
    	xhr.onload = function(){
    		
    		if(xhr.status == 200){
    			console.log('성공');
    			console.log("결과1",xhr.responseText);
    			location.href = "personDetail.do?psId=" + data.psId;
    		}else{
    			console.log('서버 에러');
    		}
    	};	
    	xhr.send(JSON.stringify(data));
    });
    
    
    </script>
    <script>
	 // 이미지를 클릭할 때 영화 페이지로 이동
	    document.querySelectorAll('.movie-img').forEach(function (img) {
	        img.addEventListener('click', function () {
	            // 이미지의 data-mvId 속성을 통해 해당 이미지의 mvId 가져오기
	            var mvId = img.getAttribute('data-mvId');
	            	console.log(mvId);
	            if (mvId !== null && mvId !== undefined) {
	                // mvId를 사용하여 URL 생성
	                var redirectUrl = 'movieDetail.do?mvId=' + mvId;
	                console.log(redirectUrl);
	                // 생성된 URL로 이동
	                window.location.href = redirectUrl;
	            }
	        });
	    });
	    
    </script>

</div>



</body>
</html>