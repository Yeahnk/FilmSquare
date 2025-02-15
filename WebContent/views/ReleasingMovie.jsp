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
	<div class="content">
		<div class="calendar">
			<div class="title">
				<a
					href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month - 1%>">&lt;</a>
				<label><%=year%>. <%=month%></label> <a
					href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month + 1%>">&gt;</a>
			</div>

			<table>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
				<tr>
					<%
						// 1일 이전
					for (int i = 1; i < week; i++) {
						out.print("<td></td>");
					}

					// 1일에서 말일
					int lastDay = cal.getActualMaximum(Calendar.DATE);
					for (int i = 1; i <= lastDay; i++) {
						LocalDate theDay = LocalDate.of(year, month, i);
						out.print("<td>");

						if (posterMap.containsKey(theDay)) { // 해당 날짜에 개봉 예정작 있는지 확인
							PosterVO poster = posterMap.get(theDay);

							System.out.println(theDay);
					%>

					<a
						href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month%>&date=<%=i%>">
						<img alt="" src="<%=poster.getPosterImg()%>">
					</a>

					<%
						} else {
					%>
						<a href="<%=request.getContextPath()%>/releasingCal.do?year=<%=year%>&month=<%=month%>&date=<%=i%>"><%=i%></a>
					<%
						}

						out.print("</td>");

						if (lastDay != i && (++week) % 7 == 1) {
							out.print("</tr><tr>");
						}
					}

					// 말일 이후
					for (int j = (week - 1) % 7; j < 6; j++) {
						out.print("<td></td>");
					}
					
					%>
				</tr>
			</table>
		</div>
		
		<div class="container-movieinfo">

			<div class="date-title">
				<div class="date-text">
					<%=year%>.<%=month%>.<%=date%>
					개봉 예정작
				</div>
			</div>

			<div class="movie-list-container">

				<%
					for (ReleasingMovieVO movie : releaseMovieList) {
					String movieTitle = movie.getMvTitle();
					PosterVO poster = posterController.getPosterByMvId(movie.getMvId().intValue());
					String posterSrc = poster.getPosterImg();
				%>

				<div class="movie-container">
					<div class="movie-poster-container">
						<div class="movie-poster">
							<a href="#">
								<img id="poster-img" src="<%=posterSrc%>">
							</a>
						</div>
					</div>
					<div class="movie-title-container">
						<div class="movie-title-text">
							<a href="#">
								<%=movieTitle%>
							</a>
						</div>
					</div>
				</div>
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
</section>
<!-- ***** Main Banner Area End ***** -->
<style type="text/css">
.content {
	width: 100%;
	height: 100%;
	justify-content: center;
	align-items: center;
	gap: 10px;
	display: inline-flex;
}

.calendar {
	margin: 30px auto;
}

.calendar .title {
	height: 37px;
	line-height: 37px;
	text-align: center;
	font-weight: 600;
}

.calendar table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.calendar table td {
	padding: 4px;
	text-align: center;
	height: 150px;
	width: 100px;
}

.calendar img {
	height: 150px;
	width: 100px;
}

.container-movieinfo {
	width: 100%;
	height: 100%;
	padding-left: 32px;
	padding-right: 32px;
	padding-top: 40px;
	padding-bottom: 40px;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 36px;
	display: inline-flex;
}

.date-title {
	width: 100%;
	height: 100%;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 36px;
	display: inline-flex;
}

.date-text {
	text-align: center;
	color: black;
	font-size: 31px;
	font-family: Roboto;
	font-weight: 700;
	word-wrap: break-word;
}

.movie-list-container {
	display: inline-flex;
	height: 100%;
	padding-top: 16px;
	padding-bottom: 16px;
	justify-content: flex-start;
	align-items: flex-start;
	gap: 32px;
}

.movie-container {
	width: 100%;
	height: 100%;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	gap: 10px;
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	gap: 10px;
}

.movie-poster-container {
	width: 100%;
	height: 100%;
	border-radius: 8px;
	justify-content: center;
	align-items: center;
	display: inline-flex;
	border-radius: 8px;
	overflow: hidden;
}

.movie-poster {
	width: 216px;
	height: 320px;
	position: relative;
}

.movie-title-container {
	justify-content: flex-start;
	align-items: center;
	gap: 10px;
	display: inline-flex;
}

.movie-title-text {
	text-align: center;
	color: black;
	font-size: 20px;
	font-family: Roboto;
	font-weight: 800;
	word-wrap: break-word;
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