
<%@page import="movie.service.ReleasingMovieServiceImpl"%>
<%@page import="movie.service.IReleasingMovieService"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="movie.vo.CalendarVO"%>
<%@page import="movie.vo.PosterVO"%>
<%@page import="movie.controller.PosterController"%>
<%@page import="movie.vo.ReleasingMovieVO"%>
<%@page import="movie.controller.ReleasingMovieController"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<!-- ***** Main Banner Area Start ***** -->
<section class="section main-banner" id="top" data-section="section1">
	<%
		ReleasingMovieController releasingMovieController = new ReleasingMovieController();
	IReleasingMovieService releasingMovieService = ReleasingMovieServiceImpl.getInstance();
	PosterController posterController = new PosterController();

	Calendar cal = Calendar.getInstance();

	// 시스템 오늘 날짜
	int ty = cal.get(Calendar.YEAR);
	int tm = cal.get(Calendar.MONTH) + 1;
	int td = cal.get(Calendar.DATE);

	CalendarVO calVo = (CalendarVO) request.getAttribute("calVo");

	int year = calVo.getDate().getYear();
	int month = calVo.getDate().getMonthValue();
	int date = calVo.getDate().getDayOfMonth();

	// 캘린더 설정
	cal.set(year, month - 1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH) + 1;

	int week = cal.get(Calendar.DAY_OF_WEEK);

	// 날짜마다 대표 포스터 담아줄 map 객체
	Map<LocalDate, PosterVO> posterMap = new HashMap<>();

	List<Map<LocalDate, List<ReleasingMovieVO>>> releasingList = calVo.getReleasingList();

	for (Map<LocalDate, List<ReleasingMovieVO>> dateMovieMap : releasingList) {

		// 키세트 가져옴
		Set<LocalDate> keySet = dateMovieMap.keySet();
		// 키세트를 이용해 저장된 맵 전부 꺼내기
		for (LocalDate indexDate : keySet) {
			List<ReleasingMovieVO> releaseMovieList = dateMovieMap.get(indexDate);
			// 각 날짜에 저장된 개봉 예정작 리스트에서 포스터 하나씩 포스터 맵에 날짜, 포스터 vo 담아줌
			for (ReleasingMovieVO movie : releaseMovieList) {
		PosterVO poster = posterController.getPosterByMvId(movie.getMvId().intValue());
		if (poster != null) {
			posterMap.put(indexDate, poster);
		}
			}
		}

	}

	List<ReleasingMovieVO> releaseMovieList = releasingMovieService.getReleaseList(calVo.getDate());
	%>


<div class="cal-body">
    <div class="title">
        <div class="text-wrapper">
            개봉 예정작 보기
        </div>
    </div>
    <div class="body">
        <div class="my-calendar">
            <div class="cal-yearnmonth">
                <div class="div-wrapper">
                    <a href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month - 1%>"><div class="div"> &lt; </div></a>
                </div>
                <div class="div-wrapper">
                    <div class="div"> <%=year%>. <%=month%> </div>
                </div>
                <div class="div-wrapper">
                    <a href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month + 1%>"><div class="div"> &gt;</div></a>
                </div>
            </div>

            <div class="cal-section">
                <div class="week-title">
                    <div class="cal-weekday">
                        <div class="text-wrapper-2">일</div>
                    </div>
                    <div class="cal-weekday">
                        <div class="text-wrapper-2">월</div>
                    </div>
                    <div class="cal-weekday">
                        <div class="text-wrapper-2">화</div>
                    </div>
                    <div class="cal-weekday">
                        <div class="text-wrapper-2">수</div>
                    </div>
                    <div class="cal-weekday">
                        <div class="text-wrapper-2">목</div>
                    </div>
                    <div class="cal-weekday">
                        <div class="text-wrapper-2">금</div>
                    </div>
                    <div class="cal-weekday">
                        <div class="text-wrapper-2">토</div>
                    </div>
                </div>
                <div class="week">
                    <% 
                    // 1일 이전 
                    for (int i=1; i < week; i++) { 
                    %>
                        <div class="date">
                            <div class="date-text">
                            </div>
                        </div>
                    <% 
                    } 
                    // 1일에서 말일 
                    int lastDay=cal.getActualMaximum(Calendar.DATE); 
                    for (int i=1; i <=lastDay; i++){ 
                        LocalDate theDay=LocalDate.of(year, month, i); 
                        
                        // 해당 날짜에 개봉 예정작 있는지 확인 
                        if (posterMap.containsKey(theDay)) { 
                            // 있으면 포스터 출력 
                            PosterVO poster=posterMap.get(theDay); 
//                             System.out.println(theDay+"에 개봉 예정작이 있어용");
                    %>
                        <a class="date-2" href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month%>&date=<%=i%>"
                        	style="background-image: url(<%=poster.getPosterImg()%>)">
                        </a>
                    <% } else { 
                        // 없으면 날짜 출력 
                    %>
                        <div class="date">
                            <a href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month%>&date=<%=i%>">
                                <div class="date-text"> <%=i%> </div>
                            </a>
                        </div>
                    <% } 

                        if (lastDay !=i && (++week) % 7==1) { //새로운 주 시작
                        %>
                        
                </div>
                <div class="week">
                    <% 
                        } 
                    } 
                    
                    // 말일 이후 
                    for (int j=(week - 1) % 7; j < 6; j++) { 
                        out.print("<td></td>"); // 빈날짜 출력
                    %>
                    <div class="date"></div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>



        <div class="releasing-movie">
            <div class="title-date">
                <!-- <img class="icon-frame" src="img/icon-frame.png" /> -->
                <div class="text-wrapper-3">
                    <%=year%>.<%=month%>.<%=date%> 개봉 예정작
                </div>
            </div>

            <div class="movie-list">
                <%
				for (ReleasingMovieVO movie : releaseMovieList) {
					String movieTitle = movie.getMvTitle();
					PosterVO poster = posterController.getPosterByMvId(movie.getMvId().intValue());
					String posterSrc = poster.getPosterImg();
				%>
                <a herf="<%=request.getContextPath()%>/movieDetail.do?mvId=<%=movie.getMvId().intValue()%>">
                    <div herf="<%=request.getContextPath()%>/movieDetail.do?mvId=<%=movie.getMvId().intValue()%>" class="movie">
                        <a class="movie-poster" herf="<%=request.getContextPath()%>/movieDetail.do?mvId=<%=movie.getMvId().intValue()%>" >
                            <div class="frame" style="background-image: url(<%=posterSrc%>)">
                            </div>
                        </a>
                        <div class="div-wrapper">
                            <div class="text-wrapper-4">
                                <%=movieTitle%>
                            </div>
                        </div>
                    </div>
                </a>
				<%
					}
					if(releaseMovieList==null || releaseMovieList.size()==0){
				%>
                <div> 개봉 예정작 정보가 없습니다. </div>
                <%
					}
				%>
            </div>
        </div>
    </div>
</div>    


<style>


@font-face {
  font-family: "title";
  src: url("../fonts/ONE Mobile Title OTF.otf");
}

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

.cal-body {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 40px 100px;
  position: relative;
  background-color: #ffffff;
}

.cal-body .title {
  display: flex;
  align-items: flex-start;
  gap: 40px;
  padding: 0px 0px 24px;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.cal-body .text-wrapper {
  position: relative;
  width: fit-content;
  margin-top: -1px;
  font-family: "Inter-SemiBold", Helvetica;
  font-weight: 600;
  color: var(--black);
  font-size: 32px;
  text-align: center;
  letter-spacing: -0.3px;
  line-height: normal;
}

.cal-body .body {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.cal-body .my-calendar {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 32px;
  padding: 16px 0px;
  position: relative;
  flex: 1;
  flex-grow: 1;
/*   overflow-x: scroll; */
}

.cal-body .cal-yearnmonth {
  display: inline-flex;
  align-items: flex-start;
  justify-content: center;
  gap: 20px;
  position: relative;
  flex: 0 0 auto;
}

.cal-body .div-wrapper {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  position: relative;
  flex: 0 0 auto;
}

.cal-body .div {
  margin-top: -1px;
  font-family: "Roboto-ExtraBold", Helvetica;
  font-weight: 800;
  font-size: 42px;
  line-height: normal;
  position: relative;
  width: fit-content;
  color: #000000;
  text-align: center;
  letter-spacing: -0.3px;
  white-space: nowrap;
}

.cal-body .cal-section {
  display: inline-flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  position: relative;
  flex: 0 0 auto;
}

.cal-body .week-title {
  width: 604px;
  height: 36px;
  gap: 10px;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  position: relative;
}

.cal-body .cal-weekday {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  flex: 1;
  align-self: stretch;
  flex-grow: 1;
  border-radius: 8px;
  overflow: hidden;
}

.cal-body .text-wrapper-2 {
  margin-top: -9px;
  margin-bottom: -7px;
  font-family: "Roboto-SemiBold", Helvetica;
  font-weight: 600;
  font-size: 20px;
  line-height: 52px;
  position: relative;
  width: fit-content;
  color: #000000;
  text-align: center;
  letter-spacing: -0.3px;
  white-space: nowrap;
}

.cal-body .week {
  width: 605px;
  height: 121px;
  gap: 4px;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  position: relative;
}

.cal-body .date {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  flex: 1;
  align-self: stretch;
  flex-grow: 1;
}

.cal-body .date-text {
  position: relative;
  width: fit-content;
  font-family: "Roboto-SemiBold", Helvetica;
  font-weight: 600;
  color: #000000;
  font-size: 20px;
  text-align: center;
  letter-spacing: -0.3px;
  line-height: 52px;
  white-space: nowrap;
}

.cal-body .date-text-2 {
  position: relative;
  width: fit-content;
  opacity: 0.7;
  font-family: "Roboto-SemiBold", Helvetica;
  font-weight: 600;
  color: #000000;
  font-size: 20px;
  text-align: center;
  letter-spacing: -0.3px;
  line-height: 52px;
  white-space: nowrap;
}

.cal-body .date-2 {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  flex: 1;
  align-self: stretch;
  flex-grow: 1;
  border-radius: 4px;
  box-shadow: 0px 4px 4px #00000040;
  background-size: cover;
  background-position: 50% 50%;
}

.cal-body .releasing-movie {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 36px;
  padding: 40px 32px;
  position: relative;
  flex: 1;
  align-self: stretch;
  flex-grow: 1;
  background-color: #ffffff;
}

.cal-body .title-date {
  display: inline-flex;
  align-items: flex-start;
  gap: 36px;
  position: relative;
  flex: 0 0 auto;
}

.cal-body .icon-frame {
  position: relative;
  width: 50px;
  height: 50px;
  object-fit: cover;
}

.cal-body .text-wrapper-3 {
  margin-top: -1px;
  font-family: "Roboto-Bold", Helvetica;
  font-weight: 700;
  font-size: 31px;
  line-height: normal;
  position: relative;
  width: fit-content;
  color: #000000;
  text-align: center;
  letter-spacing: -0.3px;
  white-space: nowrap;
}

.cal-body .movie-list {
  flex-wrap: wrap;
  align-items: flex-start;
  gap: 32px 32px;
  padding: 16px 0px;
  margin-right: -105.33px;
/*   overflow-x: scroll; */
  display: inline-flex;
  position: relative;
  flex: 0 0 auto;
}

.cal-body .movie {
  flex-direction: column;
  align-items: flex-start;
  justify-content: center;
  gap: 10px;
  display: inline-flex;
  position: relative;
  flex: 0 0 auto;
}

.cal-body .movie-poster {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  position: relative;
  flex: 0 0 auto;
  border-radius: 8px;
}

.cal-body .frame {
  position: relative;
  width: 215px;
  height: 300px;
  border-radius: 8px;
  background-size: cover;
  background-position: 50% 50%;
}

.cal-body .text-wrapper-4 {
  position: relative;
  width: fit-content;
  margin-top: -1px;
  font-family: "title";
  font-weight: 800;
  color: #000000;
  font-size: 30px;
  text-align: center;
  letter-spacing: -0.3px;
  line-height: normal;
  white-space: nowrap;
}

.cal-body .frame-wrapper {
  align-items: center;
  justify-content: center;
  gap: 10px;
  border-radius: 8px;
  overflow: hidden;
  display: inline-flex;
  position: relative;
  flex: 0 0 auto;
}

.cal-body .frame-2 {
  position: relative;
  width: 206.67px;
  height: 300px;
  background-image: url(./img/frame-8-2.png);
  background-size: cover;
  background-position: 50% 50%;
}

.cal-body .frame-3 {
  position: relative;
  width: 206.67px;
  height: 300px;
  background-size: cover;
  background-position: 50% 50%;
}




</style>


<%@include file="../include/footer.jsp"%>

<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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