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

	<div class="coll-body">
		<div class="coll-head">
			<div class="coll-back-container">
				<div class="coll-back-frame">

					<%
						for (int i=0; i<10; i++) {
							Map<String, Object> movieMap = movieMapList.get(i);
							PosterVO poster = (PosterVO) movieMap.get("poster");
							if (poster == null)
								continue;
					%>

					<div class="back-movie-poster">
						<img class="back-poster-image" src="<%=poster.getPosterImg()%>">
					</div>

					<%
						}
					%>


				</div>
			</div>

			<div class="coll-title">
				<div class="coll-title-text">
					<%=coll.getClTitle()%>
				</div>
				<div class="coll-user">
					<%
						if (atchFile != null) {
					%>
					<img class="user-profile" src="<%=atchFile.getMempPath()%>">
					<%
						} else {
					%>
					<img class="user-profile" src="../images/pf/bom.jpg">
					<%
						}
					%>
					<div class="user-nick"><%=mem.getMemNcnm()%></div>
				</div>
			</div>
			<div class="coll-like">
				<div class="like-icon">
					<img class="like-img"
						src="<%=request.getContextPath()%>/WebContent/images/icons/like.png">
				</div>
				<div class="like-count"><%=coll.getLikeCnt()%></div>
			</div>

		</div>

		<div class="movie-list">

			<%
				for (Map<String, Object> movieMap : movieMapList) {
				PosterVO poster = (PosterVO) movieMap.get("poster");
				MovieInfoVO movie = (MovieInfoVO) movieMap.get("movie");
				if (poster == null)
					continue;
			%>
			<div class="movie">
				<div class="movie-poster">
					<img class="movie-poster-image" src="<%=poster.getPosterImg()%>">
				</div>
				<div class="movie-info">
					<div class="movie-title">
						<div class="movie-title-text"><%=movie.getMvTitle()%></div>
					</div>
					<div class="movie-grade">
						<img class="star-image" src="./images/icons/star.png">
						<div class="movie-grade-content"><%=movie.getGradeAvg() / 10%></div>
					</div>
				</div>
			</div>

			<%
				}
			%>



		</div>
	</div>

</section>
<style>
.star-image {
	width: 20px;
	height: 20px;
}

.movie-grade-content {
	color: #555765;
	text-align: center;
	font-family: Roboto;
	font-size: 19px;
	font-style: normal;
	font-weight: 300;
	line-height: normal;
	letter-spacing: -0.3px;
}

.movie-grade {
	display: flex;
	align-items: center;
	gap: 4px;
	align-self: stretch;
}

.movie-title-text {
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
	overflow: hidden;
	color: #000;
	text-align: center;
	text-overflow: ellipsis;
	font-family: Roboto;
	font-size: 27px;
	font-style: normal;
	font-weight: 500;
	line-height: normal;
	letter-spacing: -0.3px;
}

.movie-title {
	display: flex;
	align-items: center;
	gap: 10px;
	align-self: stretch;
}

.movie-info {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 4px;
	align-self: stretch;
}

.movie-poster-image {
	flex: 1 0 0;
	align-self: stretch;
}

.movie-poster {
	display: flex;
	width: 243px;
	height: 363px;
	justify-content: center;
	align-items: center;
	gap: 10px;
	border-radius: 8px;
	/* poster-mini-shadow */
	box-shadow: 4px 4px 4px 0px rgba(196, 196, 196, 0.50), -4px -3px 4px 0px
		rgba(196, 196, 196, 0.20), 4px -2px 4px 0px rgba(196, 196, 196, 0.20);
}

.movie {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.movie-list {
	display: flex;
	padding: 16px 0px;
	justify-content: center;
	align-items: flex-start;
	align-content: flex-start;
	gap: 32px;
	align-self: stretch;
	flex-wrap: wrap;
}

.like-count {
	color: #FFF;
	text-align: center;
	font-family: Roboto;
	font-size: 16px;
	font-style: normal;
	font-weight: 500;
	line-height: normal;
	letter-spacing: -0.3px;
}

.like-img {
	width: 50px;
	height: 47px;
	left: 0px;
	top: 0px;
	position: absolute;
	border: 4px
}

.like-icon {
	width: 50px;
	height: 50px;
}

.coll-like {
	display: flex;
	padding: 32px 80px;
	flex-direction: column;
	justify-content: flex-end;
	align-items: center;
	gap: 8px;
}

.user-nick {
	color: var(- -White, #FFF);
	font-family: Roboto;
	font-size: 32px;
	font-style: normal;
	font-weight: 100;
	line-height: normal;
	letter-spacing: -0.3px;
}

.user-profile {
	width: 43px;
	height: 43px;
	border-radius: 43px;
}

.coll-user {
	display: flex;
	padding: 0px 8px;
	justify-content: center;
	align-items: flex-end;
	gap: 8px;
}

.coll-title-text {
	color: var(- -White, #FFF);
	font-family: Roboto;
	font-size: 52px;
	font-style: normal;
	font-weight: 800;
	line-height: normal;
	letter-spacing: -0.3px;
}

.coll-title {
	display: flex;
	padding: 40px 80px;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	gap: 8px;
	position: absolute;
	bottom: 0px;
}

.coll-body {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 32px;
	align-self: stretch;
}

.coll-head {
	display: flex;
	height: 524px;
	flex-direction: column;
	align-items: center;
	gap: 10px;
	align-self: stretch;
}

.coll-back-container {
	display: flex;
	padding: 0px 10px;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 10px;
	flex: 1 0 0;
	align-self: stretch;
}

.coll-back-frame {
	display: flex;
	align-items: center;
	gap: -183px;
	flex: 1 0 0;
}

.back-movie-poster {
	display: flex;
	width: 365px;
	height: 523px;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.back-poster-image {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 10px;
	flex: 1 0 0;
	align-self: stretch;
}
</style>