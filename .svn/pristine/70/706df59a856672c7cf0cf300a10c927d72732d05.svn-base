<%@page import="character.vo.PersonInfoVO"%>
<%@page import="character.vo.PersonImageVO"%>
<%@page import="character.vo.CharacterVO"%>
<%@page import="movie.vo.PosterVO"%>
<%@page import="movie.vo.MovieInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<style>
img{
  max-height: 350px;
  max-width: 250px;
  min-height: 180px;
  min-width: 120px;

}



.row, .col-lg-12 {
	display: flex;
	flex-direction: row;
/* 	justify-content: space-between; */
}

.item {
	width: 300px;
	margin: 15px 20px;
}
/* 사진크기 height: auto;width: 100%; 에서 일정하게 바꿈 */
/* .item img { */
/* 	height: auto; */
/* 	width: 100%; */
/* } */

.section-heading h2 {
	margin-top: 50px;
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
	padding: 5px;
	margin: 20px;
	border-style: hidden;
	font-size: 17px;
	
}
#news-table td {
  padding: 10px;
}
#news-table a {
  color: white;
  padding-right: 10px;
}

.psDetail>li {
	display: block;
	position: relative;
}
h4 a{
  color: black;
}
.movie-img {
  height: 350px;
  width: 100%;
}
.person-img {
  height: 150px;
  width: 100%;
}

tr a:hover{
  background-color: darkgray;
}
.our-courses .item .down-content h4 {
  padding: 10px;
}
.posterinfo {
  padding: 10px 0 10px 0;
  list-style: none;
  text-align: left;
  padding-left: 6px;
  line-height: 6px;
}

</style>

<!-- 내용 표시  -->

<%

	List<MovieInfoVO> movieInfoList = (List<MovieInfoVO>) request.getAttribute("movieInfoList");
	List<CharacterVO> charList = (List<CharacterVO>) request.getAttribute("charList");
	List<PersonImageVO> imageList =(List<PersonImageVO>) request.getAttribute("psiList");
	List<MovieInfoVO> actMovList =(List<MovieInfoVO>) request.getAttribute("actMovList");
	List<CharacterVO> movActList = (List<CharacterVO> )request.getAttribute("movActList");
// 	System.out.println(">>>>>>>>>>"+movieInfoList);
// 	System.out.println(">>>>>>>>>>"+actMovList);
// 	System.out.println(">>>>>>>>>>"+charList);
// 	System.out.println(">>>>>>>>>>"+movActList);

%>


<div id="section-container">

	<section class="our-courses" id="courses">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>영화</h2>
					</div>
				</div>
				<div class="col-lg-12">

					<%
if (movieInfoList != null && movActList.size() != 0) {
//     System.out.println("Movie Info List Size: " + movieInfoList.size());
    for (MovieInfoVO miv : movieInfoList) {
//     	System.out.println(miv);
%>
					<!-- 영화 정보 -->
					<div class="item">
						<img src="<%=miv.getPosterImg() %>"
							class="img-responsive movie-img" alt="<%=miv.getMvTitle()%> 포스터" data-mvId="<%= miv.getMvId()%>">
						<div class="down-content">
							<h4 id="movienm"><a href="<%=request.getContextPath()%>/movieDetail.do?mvId=<%=miv.getMvId()%>"><%=miv.getMvTitle() %></a></h4>
							<div class="info">
								<div class="row">
									<div class="col-11">
										<ul id="posterinfo">
											<li><%=miv.getMvRyear()%>&nbsp;·&nbsp;<%=miv.getMvNation()%></li>
											<br><li>평점★&nbsp;<%=(double)miv.getGradeAvg()/10 %></li>
											<br><li><%=miv.getMvGenre() %></li>
										</ul>
									</div>
<!-- 									<div class="col-4"> -->
<%-- 										<span><%=miv.getMvGenre() %></span> --%>
<!-- 									</div> -->
								</div>
							</div>
						</div>
					</div>
					<%
    }
} else if (movieInfoList.size()==0 ) { 
//     System.out.println("Act Movie List Size: " + actMovList.size());
    int limit = Math.min(actMovList.size(), 4);
    for (int i = 0; i < limit; i++) {
        MovieInfoVO acm = actMovList.get(i);
%>
					<div class="item">
						<img src="<%=acm.getPosterImg() %>"
							class="img-responsive movie-img" alt="<%=acm.getMvTitle()%> 포스터" data-mvId="<%= acm.getMvId()%>">
						<div class="down-content">
							<h4><a href="<%=request.getContextPath()%>/movieDetail.do?mvId=<%=acm.getMvId()%>"><%=acm.getMvTitle() %></a></h4>
							<div class="row">
								<div class="col-11">
									<ul>
										<li><%=acm.getMvRyear()%>&nbsp;·&nbsp;<%=acm.getMvNation()%></li>
										<br><li>평점★&nbsp;<%=(double)acm.getGradeAvg()/10 %></li>
										<br><li><%=acm.getMvGenre() %></li>
									</ul>
								</div>
<!-- 								<div class="col-4"> -->
<%-- 									<span><%=acm.getMvGenre() %></span> --%>
<!-- 								</div> -->
							</div>
						</div>
					</div>
					<%
    }
} else {
%>
					<h1>검색 결과가 없습니다.</h1>
					<%
}
%>


				</div>
			</div>
		</div>
	</section>
</div>

<section class="our-courses" id="courses">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-heading">
					<h2>인물</h2>
				</div>
			</div>
			<div class="col-lg-12">
				<%
                    if (charList != null && movieInfoList.size()==0) {
//                     	System.out.println("chchchchch"+charList);
                    	for (CharacterVO cv : charList) {
                            String job = "";
                            String birth = "";
                            if (cv != null) {
                            	 job = cv.getActorRole() != null && cv.getActorRole().equals("감독") ? cv.getActorRole() : "배우";
                            	 birth = cv.getPsinfoKey() !=null ? cv.getPsinfoKey() : "-";

                            %>
				<div class="item">
					 <img src="
                <%if(cv.getPsiSrc() != null){ %>
                <%=cv.getPsiSrc() %>
                <%}else{ %>
               https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
                <% }%>
                " class="img-responsive person-img" alt="Course One" data-psId="<%= cv.getPsId() %>">
					<div class="down-content">
						<h4>
							<a
								href="<%=request.getContextPath()%>/personDetail.do?psId=<%=cv.getPsId()%>"><%=cv.getPsName()%></a>
						</h4>
						<div class="info">
							<div class="row">
								<div class="col-8">
									<ul class="psDetail">
										<li><%=job%></li>
										
<%-- 										<li><%=birth%></li> --%>
									</ul>
								</div>
								<div class="col-4">
									<!-- 추가로 필요한 내용이 있다면 여기에 작성 -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<%}%>
				<% }%>
				<% 
} else if (movieInfoList != null && movieInfoList.size() > 0) { 
//     System.out.println("movmov" + movActList);
    
    int displayCount = 0; 
    
    for (CharacterVO av : movActList) {
        if (displayCount < 10) { 
            String job = "";
            String birth = "";
            if (av != null) {
                job = av.getActorRole() != null && av.getActorRole().equals("감독") ? av.getActorRole() : "배우";
                birth = av.getPsinfoKey() != null ? av.getPsinfoKey() : "-";
            %>
            <div class="item">
                <img src="
                <%if(av.getPsiSrc() != null){ %>
                <%=av.getPsiSrc() %>
                <%}else{ %>
               https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-cyber-man-icon-isolated-on-abstract-background-png-image_1779333.jpg
                <% }%>
                " class="img-responsive person-img" alt="Course One" data-psId="<%= av.getPsId() %>">
                <div class="down-content">
                    <h4>
                        <a href="<%=request.getContextPath()%>/personDetail.do?psId=<%=av.getPsId()%>"><%=av.getPsName()%></a>
                    </h4>
                   
                    <div class="info">
                        <div class="row">
                            <div class="col-8">
                                <ul class="psDetail">
                                    <li><%=job%></li>
                                    <br>
<%--                                     <li><%=birth%></li> --%>
                                </ul>
                            </div>
                            <div class="col-4">
                                <!-- 추가로 필요한 내용이 있다면 여기에 작성 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
            displayCount++;
        }
    }
} %>

                        <% }else{ %>
				<h1>검색 결과가 없습니다.</h1>
				<%}%>
			</div>
		</div>
	</div>
</section>


<!-- 뉴스 -->
<section class="our-courses" id="courses">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-heading">
					<h2>뉴스</h2>
				</div>
			</div>
			<div id="news-table"></div>
			<div class="col-lg-12">
				<%
						String newsResult = (String) request.getAttribute("newsResult");
					%>
				<!-- 뉴스 정보 -->
				<div class="item"></div>
				


			</div>
		</div>
	</div>
</section>


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
    
    
    
	// 뉴스 스크립트

	$(document).ready(function(){
		
	
		
	try {
	let x2js = new X2JS();
	let data = '<%=newsResult%>';
	
	let jsonObj = x2js.xml_str2json(data);
	
	let v_tbl = "<table border=1>";
	let itemArr = jsonObj.rss.channel.item;
	
	console.log(itemArr[0].link);
	console.log(itemArr[0].title);
	console.log(itemArr[0].pubDate);
	
	for(let i = 0; i < itemArr.length && i < 10; i++){
		
		// date 파싱
        let pubDate = new Date(itemArr[i].pubDate);

        // 원하는 형식으로 format
        let formattedDate = pubDate.getFullYear() + "." 
        + (pubDate.getMonth() + 1).toString().padStart(2, '0') 
        + "." + pubDate.getDate().toString().padStart(2, '0') 
        + ".(" +getWeekdayName(pubDate.getDay()) + ")";
		
		
		
		v_tbl += "<tr><td><a href = '" + itemArr[i].link + "'>";
		v_tbl += itemArr[i].title + "</a></td><td>";
		v_tbl += formattedDate  + "</td></tr>";
	}
	
	
	v_tbl += "</table>";
	$('#news-table').html(v_tbl);
	

	} catch (error) {
	    console.error("Error converting XML to JSON:", error);
	}
	
	
	 function getWeekdayName(day) {
	        const weekdayNames = ["일", "월", "화", "수", "목", "금", "토"];
	        return weekdayNames[day];
	}
	
	
    
	});
    </script>

	<script>
	 // 이미지를 클릭할 때 인물 페이지로 이동
	   document.querySelectorAll('.person-img').forEach(function (img) {
		    img.addEventListener('click', function () {
		        // 이미지의 data-psId 속성을 통해 해당 이미지의 psId 가져오기
		        var psId = img.getAttribute('data-psId');
		        console.log(psId);
		        if (psId !== null && psId !== undefined) {
		            // psId를 사용하여 URL 생성
		            var redirectUrl = 'personDetail.do?psId=' + psId;
		            console.log(redirectUrl);
		            // 생성된 URL로 이동
		            window.location.href = redirectUrl;
		        }
		    });
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





</body>
</html>