<%@page import="collection.vo.CollcontentVO"%>
<%@page import="collection.service.CollcontentServiceImpl"%>
<%@page import="collection.service.ICollcontentService"%>
<%@page import="member.vo.AtchFileVO"%>
<%@page import="member.servive.AtchFileServiceImpl"%>
<%@page import="member.servive.IAtchFileService"%>
<%@page import="member.servive.MemberServiceImpl"%>
<%@page import="member.servive.IMemberService"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="collection.vo.CollectionVO"%>
<%@page import="collection.service.CollectionServiceImpl"%>
<%@page import="collection.service.ICollectionService"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="movie.vo.PosterVO"%>
<%@page import="movie.service.PosterServiceImpl"%>
<%@page import="movie.service.IPosterService"%>
<%@page import="movie.service.MovieInfoServiceImpl"%>
<%@page import="movie.service.IMovieInfoService"%>
<%@page import="java.util.List"%>
<%@page import="movie.vo.MovieInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Actor&family=Alef:wght@700&family=Ropa+Sans&display=swap" rel="stylesheet">
  </head>
  <%
  int clId = 181;
  IMovieInfoService movieService = MovieInfoServiceImpl.getInstance();
  IPosterService posterService = PosterServiceImpl.getInstance();
  ICollectionService collService = CollectionServiceImpl.getInstance();
  IMemberService memService = MemberServiceImpl.getInstance();
  IAtchFileService fileService = AtchFileServiceImpl.getInstance();
  ICollcontentService collContService = CollcontentServiceImpl.getInstance();
  %>
  <body>
      <div class="navbar">
      <%@include file="./include/header.jsp"%>
      </div>
    <div class="main-lala">
      <div class="frame">
        <div class="main-image" style="background-image: url(./images/design/lalalend.jpg)"><div class="div">FILM SQUARE</div></div>
      </div>
  
      
      
      
      
      <div class="box-office">
        <div class="BOX-OFFICE">BOX <br />OFFICE</div>
   
      <div class="overlap-group">
        <div class="frame-2">
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1044" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/31/tn_DPK021635.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1055" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/30/tn_DPF028589.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1045" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/29/tn_DPF028544.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=8683" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/28/tn_DPK021550.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=8681" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/27/tn_DPF028476.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1243" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/24/tn_DPK021396.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1058" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/30/tn_DPK021611.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1833" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/04/33/tn_DPF013070.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1237" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/28/tn_DPK021524.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1330" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/05/15/tn_DPK014533.jpg)"></a>
        <%
        	List<MovieInfoVO> movieList = movieService.getBoxOffice();
        	for(int i=0; i<3; i++){
        		MovieInfoVO aMovie = movieList.get(i); 	
        		PosterVO poster = posterService.getPosterByMvId(aMovie.getMvId());
        %>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=<%= aMovie.getMvId()%>" class="frame-3" style="background-image: url(<%=poster.getPosterImg()%>)"></a>
        <%
        	}        
        %>
        
        </div>
      </div>
    </div>
    
    
      <div class="box-office">
        <div id="netflixTxt" class="BOX-OFFICE2">NET <br />FLIX</div>
      <div id="netflixBox" class="overlap-group">
        <div class="frame-0">
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1259" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/17/tn_DPK021132.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1171" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/72/tn_DPK019135.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=7065" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/03/27/tn_DPF011002.JPG)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=3583" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/05/37/tn_DPF019427.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=8225" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/19/tn_DPK021206.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1383" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/04/78/tn_DPF015197.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1705" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/04/55/tn_DPK012953.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=2091" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/02/90/tn_DPF007914.JPG)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1261" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/14/tn_DPF027719.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1103" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/99/tn_DPF027038.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1111" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/97/tn_DPF026895.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=8204" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/17/tn_DPK021117.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=7224" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/02/70/tn_DPF006830.JPG)"></a>
      </div>
    </div>
    </div>
    
    
 
      <div class="box-office">
        <div id="watchaTxt" class="BOX-OFFICE">WATCHA</div>
   
      <div id="watchaBox" class="overlap-group">
        <div class="frame-2">
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1171" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/72/tn_DPK019135.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=8362" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/76/tn_DPK019303.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=2178" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/03/82/tn_DPK07435A.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1925" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/01/66/tn_DPK005480.JPG)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1095" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/05/tn_DPF027332.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1833" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/04/33/tn_DPF013070.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1160" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/76/tn_DPF025679.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=7222" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/04/99/tn_DPF016691.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1114" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/94/tn_DPF026742.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1267" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/12/tn_DPF027618.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1833" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/04/33/tn_DPF013070.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1237" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/28/tn_DPK021524.jpg)"></a>
          <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1330" class="frame-3" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/05/15/tn_DPK014533.jpg)"></a>
        
        </div>
      </div>
    </div>
    
    
    
    
      <div class="box-office">
        <div id="disneyTxt" class="BOX-OFFICE2">DISNEY <br />PLUS</div>
      <div id="disneyBox" class="overlap-group">
        <div class="frame-0">
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1091" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/06/tn_DPF027387.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=2101" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/02/92/tn_DPF008097.JPG)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=10315" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/94/tn_DPF026691.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1089" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/08/tn_DPF027453.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1254" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/18/tn_DPF027905.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=8267" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/15/tn_DPF027768.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1111" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/97/tn_DPF026895.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=8204" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/17/tn_DPK021117.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=7224" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/02/70/tn_DPF006830.JPG)"></a>
		   <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=2091" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/02/90/tn_DPF007914.JPG)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1261" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/18/14/tn_DPF027719.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1103" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/99/17/99/tn_DPF027038.jpg)"></a>
		  <a href="<%=request.getContextPath() %>/movieDetail.do?mvId=1383" class="frame-33" style="background-image: url(http://file.koreafilm.or.kr/thm/02/00/04/78/tn_DPF015197.jpg)"></a>
      </div>
    </div>
      </div>
    
    <div class="webgin">
        <div class="overlap">
          <div class="FILM-s-CHOICE-wrapper">
            <div class="FILM-s-CHOICE">FILM’S<br />CHOICE</div>
          </div>
          <div class="overlap-2">
            <a class="frame-8" style="background-image: url(./images/yen/dtl_thum.png)"></a>
            <div class="frame-9">
              <div class="text-wrapper-2">에디터 무진</div>
              <div class="text-wrapper-3">헤어질 결심</div>
              <p class="p">
                해준(박해일 분)의 마을을 사로잡은 것은 서래(탕웨이 분)의 아름다운 외모만이 아니다.
                외국인에게만 느낄 수 있는 이질적인 감정,
                서래가 가까스로 꺼낸 서투른 한국어가 머릿속에 스며드는 동안 
                해준은 자기도 모르게 그녀에게 빠져들고 있었다.
              </p>
            </div>
          </div>
        </div>
      </div>
      <%
      CollectionVO coll = collService.getACollection(new CollectionVO(new BigDecimal(clId)));
      MemberVO mem = memService.getAMember(new MemberVO(coll.getMemId()));
      AtchFileVO file = fileService.getAFile(mem.getMemId());
      List<CollcontentVO> collContList = collContService.getCollContentList(new CollcontentVO(coll.getClId()));
      %>
      <div class="collection">
        <div class="div-wrapper"><div class="text-wrapper-4">COLLECTION</div></div>
        <div class="frame-10">
          <div class="frame-11">
            <div class="text-wrapper-5"><%=coll.getClTitle() %></div>
            <div class="text-wrapper-6"><%=mem.getMemNcnm() %></div>
          </div>
          <% if(file!=null){ // 파일이 있으면 출력 %>
          <div class="frame-12" style="
          background-image: url(<%=file.getMempPath()%>)"></div>
          <%} else { // 없으면 기본 이미지 출력 %>
          <div class="frame-12" style="
          background-image: url(./images/pf/user-icon.png)"></div>
          <%} %>
        </div>
        <div class="frame-13">

<!--             for문 돌려 4번 출력 -->
		<%
		int index = 0;
		for( int i=0; i<4; i++){
			CollcontentVO collCont = collContList.get(index++);
			MovieInfoVO movie = movieService.getAMovie(collCont.getMvId().intValue());
			PosterVO poster = posterService.getPosterByMvId(movie.getMvId());
			if(poster==null){
				i--;
				continue;
			}
		%>
          <a class="frame-14" href="<%=request.getContextPath() %>/movieDetail.do?mvId=<%= movie.getMvId()%>" style="background-image: url( <%=poster.getPosterImg()%> )"></a>
         <% } %>
        </div>
      </div>
   </div>
<script>
    window.addEventListener("scroll", function() {
    	console.log("scrolled!!")
        var header = document.querySelector(".navbar");

        // Add the sticky-header class when scrolling down
        if (window.pageYOffset > 0) {
            header.classList.add("sticky-header");
        } else {
            // Remove the sticky-header class when at the top of the page
            header.classList.remove("sticky-header");
        }
    });
</script>


  </body>
</html>

<style>
:root {
    --primary: rgba(231, 29, 29, 1);
    --black: rgba(0, 0, 0, 1);
    --white: rgba(255, 255, 255, 1);
    --star: rgba(241, 197, 40, 1);
    --body-regular-font-family: 'Ropa Sans', sans-serif;
    --body-regular-font-weight: 400;
    --body-regular-font-size: 16px;
    --body-regular-letter-spacing: 0px;
    --body-regular-line-height: 150%;
    --body-regular-font-style: normal;
    --poster-mini-shadow: 4px 4px 4px 0px rgba(196, 196, 196, 0.5), -4px -3px 4px 0px rgba(196, 196, 196, 0.2),
      4px -2px 4px 0px rgba(196, 196, 196, 0.2);
    --variable-collection-gray: rgba(123, 123, 123, 1);
    --variable-collection-stroke: var(--variable-collection-gray);
    --variable-collection-light-gary: rgba(196, 196, 196, 1);
  }

a {
  text-decoration-line: none;
}
  
.main-lala {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    background-color: var(--black);
  }
  
  .main-lala .navbar {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    padding: 13px 20px;
    position: relative;
    width: 95%;
    flex: 0 0 auto;
	z-index: 100;
  }
  
  .main-lala .text-wrapper {
    position: relative;
    width: fit-content;
    margin-top: -1px;
    font-family: 'Actor', sans-serif;
    font-weight: 400;
    color: var(--white);
    font-size: 33px;
    letter-spacing: 0;
    line-height: 33px;
    white-space: nowrap;
  }
  
  .main-lala .frame {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    padding: 0px 20px 16px;
    position: relative;
    align-self: baseline;
    width: 101%;
    flex: 0 0 auto;
  }
  
  .main-lala .main-image {
    display: flex;
    height: 1021px;
    align-items: flex-start;
    justify-content: center;
    padding: 13px 16px;
    position: relative;
    align-self: stretch;
    width: 99%;
    background-size: cover;
    background-position: 50% 50%;
  }
  
  .main-lala .div {
    position: relative;
    width: fit-content;
    margin-top: -1px;
    font-family: 'Abril Fatface', serif;
    font-weight: 400;
    color: #ffffff;
    font-size: 281px;
    letter-spacing: 0;
    line-height: 224.8px;
    white-space: nowrap;
  }
  
  .main-lala .box-office {
    position: relative;
    align-self: stretch;
    width: 100%;
    height: 1021px;
    background-color: #ffffff;
    overflow: hidden;
    padding-bottom: 1075px;
    padding-top: 100px;
  }
  
  .main-lala .overlap-group {
    position: relative;
    width: 2155px;
    height: 1053px;
    top: 12px;
    left: -130px;
  }

  .main-lala .overlap-group2 {
    position: relative;
    width: 2155px;
    height: 1053px;
    top: 12px;
    left: +130px;
  }
  
  .main-lala .BOX-OFFICE {
    position: absolute;
    top: 0;
    left: 130px;
    font-family: 'Abril Fatface', serif;
    font-weight: 400;
    color: var(--black);
    font-size: 170px;
    letter-spacing: 0;
    line-height: 182.4px;
  }
  
  .main-lala .BOX-OFFICE2 {
    position: relative;
    left: 1400px;
    top: 0px;
    font-family: 'Abril Fatface', serif;
    font-weight: 400;
    color: var(--black);
    font-size: 170px;
    letter-spacing: 0;
    line-height: 150.4px;
  }
  
  .main-lala .frame-2 {
    display: flex;
    width: 5000px;
    align-items: center;
    gap: 32px;
    padding: 32px 200px;
    position: absolute;
    top: 150px;
    left: 28px;
    background-color: var(--black);
    transform: rotate(-7deg);
    overflow: hidden;
  }
  
  .main-lala .frame-0 {
    display: flex;
    width: 5000px;
    align-items: center;
    gap: 32px;
    padding: 32px 200px;
    position: absolute;
    top: 150px;
    left: 28px;
    background-color: var(--black);
    transform: rotate(+7deg);
    overflow: hidden;
  }
  
  .main-lala .frame-3 {
    position: relative;
    width: 320.28px;
    height: 480.42px;
    background-size: cover;
    background-position: 50% 50%;
  }
  
  .main-lala .frame-33 {
    position: relative;
    width: 320.28px;
    height: 480.42px;
    background-size: cover;
    background-position: 50% 50%;
  }
  
  
  
  
  .main-lala .webgin {
    position: relative;
    align-self: stretch;
    width: 100%;
    height: 960px;
    background-color: var(--black);
  }
  
  .main-lala .overlap {
    position: relative;
    width: 1850px;
    height: 1202px;
    top: 6px;
    left: 57px;
  }
  
  .main-lala .FILM-s-CHOICE-wrapper {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 10px;
    position: absolute;
    top: 0;
    left: 936px;
  }
  
  .main-lala .FILM-s-CHOICE {
    position: relative;
    width: fit-content;
    margin-top: 16px;
    font-family: 'Abril Fatface', serif;
    font-weight: 400;
    color: var(--white);
    font-size: 228px;
    text-align: right;
    letter-spacing: 0;
    line-height: 182.4px;
  }
  
  .main-lala .overlap-2 {
    position: absolute;
    width: 1840px;
    height: 1155px;
    top: 47px;
    left: 0;
  }
  
  .main-lala .frame-8 {
    position: absolute;
    width: 924px;
    height: 855px;
    top: 0;
    left: 0;
    background-image: url(./images/design/dtl_thum.png);
    background-size: cover;
    background-position: 50% 50%;
  }
  
  .main-lala .frame-9 {
    display: flex;
    flex-wrap: wrap;
    width: 1044px;
    align-items: flex-start;
    justify-content: flex-end;
    gap: 0px 0px;
    position: absolute;
    top: 557px;
    left: 754px;
  }
  
  .main-lala .text-wrapper-2 {
    width: 839px;
    margin-top: -1px;
    font-family: 'Actor', sans-serif;
    font-weight: 400;
    color: #ffffff;
    font-size: 36px;
    text-align: right;
    line-height: 43.2px;
    position: relative;
    letter-spacing: 0;
  }
  
  .main-lala .text-wrapper-3 {
    width: 205px;
    height: 42px;
    margin-top: -1px;
    font-family: 'Actor', sans-serif;
    font-weight: 400;
    color: #ffffff;
    font-size: 36px;
    text-align: right;
    line-height: 43.2px;
    white-space: nowrap;
    position: relative;
    letter-spacing: 0;
  }
  
  .main-lala .p {
    width: 839px;
    height: 215px;
    font-family: 'Actor', sans-serif;
    font-weight: 400;
    color: #ffffff;
    font-size: 36px;
    text-align: right;
    line-height: 43.2px;
    position: relative;
    letter-spacing: 0;
  }
  
  .main-lala .collection {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 32px;
    padding: 16px 0px 32px;
    position: relative;
    align-self: stretch;
    width: 100%;
    flex: 0 0 auto;
    background-color: var(--white);
  }
  
  .main-lala .div-wrapper {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 10px 64px;
    position: relative;
    flex: 0 0 auto;
  }
  
  .main-lala .text-wrapper-4 {
    position: relative;
    width: fit-content;
    margin-top: -1px;
    font-family: 'Abril Fatface', serif;
    font-weight: 400;
    color: var(--black);
    font-size: 228px;
    letter-spacing: 0;
    line-height: 182.4px;
    white-space: nowrap;
  }
  
  .main-lala .frame-10 {
    display: flex;
    align-items: flex-start;
    justify-content: flex-end;
    gap: 32px;
    padding: 0px 64px;
    position: relative;
    align-self: stretch;
    flex: 0 0 auto;
  }
  
  .main-lala .frame-11 {
    display: inline-flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: center;
    gap: 32px;
    position: relative;
    align-self: stretch;
    flex: 0 0 auto;
  }
  
  .main-lala .text-wrapper-5 {
    width: fit-content;
    font-family: 'Alef', sans-serif;
    font-weight: 700;
    color: #000000;
    font-size: 60px;
    line-height: 59.2px;
    white-space: nowrap;
    position: relative;
    letter-spacing: 0;
  }
  
  .main-lala .text-wrapper-6 {
    position: relative;
    width: fit-content;
    font-family: 'Alef', sans-serif;
    font-weight: 700;
    color: #7b7b7b;
    font-size: 40px;
    letter-spacing: 0;
    line-height: 42.4px;
    white-space: nowrap;
  }
  
  .main-lala .frame-12 {
    flex: 0 0 auto;
    border-radius: 100px;
    position: relative;
    background-size: cover;
    background-position: 50% 50%;
  }
  
  .main-lala .frame-13 {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 64px;
    position: relative;
    align-self: stretch;
    flex: 0 0 auto;
  }
  
  .main-lala .frame-14 {
    width: 380px;
    height: 543px;
    box-shadow: 0px 4px 4px #00000040;
    position: relative;
    background-size: cover;
    background-position: 50% 50%;
  }
  
  .sticky-header {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
}

.header-area .main-nav {
    min-height: 80px;
    background: transparent;
    background-color: black;
    min-height: 0;
    height: 69px;
    padding: 0;
    margin: 0;
}

.navbar {
    background-color: black;
    height: 70px;
    margin: 0;
}


    

a.frame-3 {
    display: inline-block;
    width: 100%;
    box-sizing: border-box;
    position: absolute;
    animation-name: flow-right-3;
    animation-duration: 80s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
}

@keyframes flow-right-3 {
    from {
        left: 0px;
    }
    to {
        left: -2000px;
    }
}

a.frame-33 {
    display: inline-block;
    width: 100%;
    box-sizing: border-box;
    position: absolute;
    animation-name: flow-right-33;
    animation-duration: 70s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
}

@keyframes flow-right-33 {
    from {
        right: 2000px;
    }
    to {
       	right: -1000px;
    }
}


#netflixTxt, #netflixBox {
	top: -115px;

}

#watchaTxt {
	top: -33px;

}

#watchaBox {
	top: -178px;

}

#disneyTxt, #disneyBox {
	top: -115px;

}

#disneyTxt {
	left: 1269px;

}

    
    

</style>

<%@include file="./include/footer.jsp"%>