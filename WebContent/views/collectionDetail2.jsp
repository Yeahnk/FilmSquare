<%@page import="movie.vo.MovieInfoVO"%>
<%@page import="collection.vo.CollectionVO"%>
<%@page import="movie.vo.PosterVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.AtchFileVO"%>
<%@page import="collection.vo.CollParamContainerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<%
CollParamContainerVO collParam = (CollParamContainerVO) request.getAttribute("collParam");
CollectionVO coll = collParam.getColl();
MemberVO mem = collParam.getMem();
AtchFileVO atchFile = collParam.getMemProfile();
List<Map<String, Object>> movieMapList = (List<Map<String, Object>>) collParam.getMovieMap();
%>

<!-- ***** Main Banner Area Start ***** -->
<section class="section main-banner" id="top" data-section="section1">

  <div class="coll-detial-body">
      <div class="coll-head">
        <div class="background-container">
          <div class="background-frame">
            <div class="back-movie-poster">
              <div class="back-poster-image"><div class="shadow"></div></div>
            </div>

            <!-- 포문 반복 -->
            <%
				for (int i=0; i<10; i++) {
					Map<String, Object> movieMap = movieMapList.get(i);
					PosterVO poster = (PosterVO) movieMap.get("poster");
					if (poster == null)
						continue;
			%>
			
            <div class="back-poster-image-wrapper">
              <div class="shadow-wrapper" style=" background-image: url(<%=poster.getPosterImg()%>)"><div class="shadow"></div></div>
            </div>
            
            <% } %>
            
        </div>
        <div class="coll-title">
        <!-- 컬렉션 이름 -->
          <div class="text-wrapper"><%=coll.getClTitle()%></div>
          <div class="coll-user">
            <!-- 유저 프로필 -->
            <% if (atchFile != null) { // 유저 프로필 있으면 %>
            <img class="user-profile" src="<%=atchFile.getMempPath()%>" />
            <% } else { // 없으면 기본 이미지%>
            <img class="user-profile" src="../images/pf/user-icon.png" />
            <% } %>
            <!-- 유저 닉네임 -->
            <div class="text-wrapper-2"><%=mem.getMemNcnm()%></div>
          </div>
        </div>
        <div class="like">
          <div class="like-icon"><img class="union" src="../images/icons/like.png" /></div>
          <!-- 좋아요 갯수 -->
          <div class="text-wrapper-3"><%=coll.getLikeCnt()%></div>
        </div>
      </div>
      <div class="movie-list">

        <!-- 포문 -->
        <%
		for (Map<String, Object> movieMap : movieMapList) {
			System.out.println("영화 가져옵니다.");
			PosterVO poster = (PosterVO) movieMap.get("poster");
			if(poster==null){
				System.out.println("포스터가 없습니다.");
				continue;
			}
			MovieInfoVO movie = (MovieInfoVO) movieMap.get("movie");
		%>
        <div class="movie">
          <div class="movie-poster">
            <!-- 포스터 이미지 -->
            <div class="poster-image" style="background-image: url(<%=poster.getPosterImg()%>)" ></div></div>
          <div class="movie-info">
            <!-- 영화 제목 -->
            <div class="movie-title"><div class="text-wrapper-4"><%=movie.getMvTitle()%></div></div>
            <div class="movie-grade">
              <img class="star-icon" src="../images/icons/star.png" />
              <!-- 평점 -->
              <div class="text-wrapper-5"><%=movie.getGradeAvg() / 10%></div>
            </div>
          </div>
        </div>
        <% } %>
        
      </div>
    </div>



<style>
:root {
  --primary: rgba(231, 29, 29, 1);
  --black: rgba(0, 0, 0, 1);
  --white: rgba(255, 255, 255, 1);
  --star: rgba(241, 197, 40, 1);
  --body-regular-font-family: "RopaSans-Regular", Helvetica;
  --body-regular-font-weight: 400;
  --body-regular-font-size: 16px;
  --body-regular-letter-spacing: 0px;
  --body-regular-line-height: 150%;
  --body-regular-font-style: normal;
  --poster-mini-shadow: 4px 4px 4px 0px rgba(196, 196, 196, 0.5), -4px -3px 4px 0px rgba(196, 196, 196, 0.2),
    4px -2px 4px 0px rgba(196, 196, 196, 0.2);
}

.coll-detial-body {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 32px;
  position: relative;
  background-color: #ffffff;
}

.coll-detial-body .coll-head {
  display: flex;
  flex-direction: column;
  height: 524px;
  align-items: center;
  gap: 10px;
  position: relative;
  align-self: stretch;
  width: 100%;
}

.coll-detial-body .background-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 10px;
  padding: 0px 10px;
  align-self: stretch;
  width: 100%;
  background-color: #848485;
  align-items: center;
  position: relative;
  flex: 1;
  flex-grow: 1;
}

.coll-detial-body .background-frame {
  display: inline-flex;
  margin-left: -255.5px;
  margin-right: -255.5px;
  align-items: center;
  position: relative;
  flex: 1;
  flex-grow: 1;
}

.coll-detial-body .back-movie-poster {
  display: flex;
  width: 365px;
  height: 523px;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
}

.coll-detial-body .back-poster-image {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  flex: 1;
  align-self: stretch;
  flex-grow: 1;
  background-image: url(./img/back-poster-image-8.png);
  background-size: cover;
  background-position: 50% 50%;
}

.coll-detial-body .shadow {
  position: relative;
  flex: 1;
  align-self: stretch;
  width: 100%;
  flex-grow: 1;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 0%,
    rgba(169.29, 169.29, 169.29, 0.09) 16.5%,
    rgba(99.17, 99.17, 99.17, 0.17) 30%,
    rgba(40.73, 40.73, 40.73, 0.32) 46.5%,
    rgba(0, 0, 0, 0.43) 64%,
    rgba(0, 0, 0, 0.49) 75.5%,
    rgba(0, 0, 0, 0.73) 95%
  );
}

.coll-detial-body .back-poster-image-wrapper {
  display: flex;
  width: 365px;
  height: 523px;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  margin-left: -183px;
}

.coll-detial-body .shadow-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  flex: 1;
  align-self: stretch;
  flex-grow: 1;
  background-image: url(./img/image.png);
  background-size: cover;
  background-position: 50% 50%;
}




.coll-detial-body .coll-title {
  display: inline-flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: center;
  gap: 8px;
  padding: 40px 80px;
  position: absolute;
  top: 332px;
  left: 0;
}

.coll-detial-body .text-wrapper {
  position: relative;
  width: fit-content;
  margin-top: -1px;
  font-family: "Roboto-ExtraBold", Helvetica;
  font-weight: 800;
  color: var(--white);
  font-size: 52px;
  letter-spacing: -0.3px;
  line-height: normal;
  white-space: nowrap;
}

.coll-detial-body .coll-user {
  display: inline-flex;
  align-items: flex-end;
  justify-content: center;
  gap: 8px;
  padding: 0px 8px;
  position: relative;
  flex: 0 0 auto;
}

.coll-detial-body .user-profile {
  position: relative;
  width: 43px;
  height: 43px;
  object-fit: cover;
}

.coll-detial-body .text-wrapper-2 {
  font-family: "Roboto-Thin", Helvetica;
  font-weight: 100;
  color: var(--white);
  font-size: 32px;
  position: relative;
  width: fit-content;
  letter-spacing: -0.3px;
  line-height: normal;
  white-space: nowrap;
}

.coll-detial-body .like {
  display: inline-flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-end;
  gap: 8px;
  padding: 32px 80px;
  position: absolute;
  top: 371px;
  left: 1302px;
}

.coll-detial-body .like-icon {
  position: relative;
  width: 50px;
  height: 50px;
}

.coll-detial-body .union {
  position: absolute;
  width: 50px;
  height: 47px;
  top: 0;
  left: 0;
}

.coll-detial-body .text-wrapper-3 {
  position: relative;
  width: fit-content;
  font-family: "Roboto-Medium", Helvetica;
  font-weight: 500;
  color: #ffffff;
  font-size: 16px;
  text-align: center;
  letter-spacing: -0.3px;
  line-height: normal;
  white-space: nowrap;
}

.coll-detial-body .movie-list {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  justify-content: center;
  gap: 32px 32px;
  padding: 16px 0px;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
  overflow-x: scroll;
}

.coll-detial-body .movie {
  display: inline-flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  position: relative;
  flex: 0 0 auto;
}

.coll-detial-body .movie-poster {
  display: flex;
  width: 243px;
  height: 363px;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: var(--poster-mini-shadow);
}

.coll-detial-body .movie-info {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.coll-detial-body .movie-title {
  display: flex;
  align-items: center;
  gap: 10px;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.coll-detial-body .text-wrapper-4 {
  margin-top: -1px;
  font-family: "Roboto-Medium", Helvetica;
  font-weight: 500;
  color: #000000;
  font-size: 27px;
  text-align: center;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  position: relative;
  width: fit-content;
  letter-spacing: -0.3px;
  line-height: normal;
  white-space: nowrap;
}

.coll-detial-body .movie-grade {
  display: flex;
  align-items: center;
  gap: 4px;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.coll-detial-body .star-icon {
  position: relative;
  width: 20px;
  height: 20px;
}

.coll-detial-body .text-wrapper-5 {
  margin-top: -1px;
  font-family: "Roboto-Light", Helvetica;
  font-weight: 300;
  color: #555765;
  font-size: 19px;
  text-align: center;
  position: relative;
  width: fit-content;
  letter-spacing: -0.3px;
  line-height: normal;
  white-space: nowrap;
}

.coll-detial-body .poster-image {
  position: relative;
  flex: 1;
  align-self: stretch;
  flex-grow: 1;
  background-size: cover;
  background-position: 50% 50%;
}


</style>

<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/lightbox.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/video.js"></script>
<script src="assets/js/slick-slider.js"></script>
<script src="assets/js/custom.js"></script>
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






</body>
</html>