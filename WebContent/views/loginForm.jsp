<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../include/header.jsp"%>

<head>
    <style>
        /* 공통 스타일 */
        * {
            padding: 0;
            margin: 0;
            border: none;
        }

        body {
            font-size: 14px;
            font-family: 'Roboto', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #000000;
            
        }

        /* 로그인 폼 스타일 */
        .login-wrapper {
            width: 600px;
            height: 600px;
            padding: 60px;
            box-sizing: border-box;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* 가운데 정렬을 위해 추가 */
            margin-left: 10px; /* Adjust the value to your preference */
        }

        .login-wrapper>h2 {
            font-size: 24px;
            color: #6A24FE;
            margin-bottom: 40px;
        }

        #login-form>input {
            width: 100%;
            height: 48px;
            padding: 0 10px;
            box-sizing: border-box;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #F8F8F8;
        }

        #login-form>input::placeholder {
            color: #D2D2D2;
        }

        #login-form>input[type="submit"] {
            color: #fff;
            font-size: 16px;
            background-color: #6A24FE;
            margin-top: 20px;
            cursor: pointer;
            border: none;
            border-radius: 6px;
        }

        #login-form>input[type="submit"]:hover {
            background-color: #5121c2;
        }

        #login-form>input[type="checkbox"] {
            display: none;
        }

        #login-form>label {
            color: #999999;
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        #login-form input[type="checkbox"]+label {
            padding-left: 8px;
            background-repeat: no-repeat;
            background-size: 16px;
        }

        #login-form input[type="checkbox"]+label:before {
            content: '';
            display: inline-block;
            width: 16px;
            height: 16px;
            margin-right: 8px;
            background-image: url("checkbox.png");
        }

        #login-form input[type="checkbox"]:checked+label:before {
            background-image: url("checkbox-active.png");
        }

        .join {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            margin-top: 20px; /* 간격을 위한 margin-top 추가 */
        }

        .join button {
            border-radius: 10px;
            border: 1px solid black;
            width: 130px;
            padding: 6px 12px;
            background-color: white;
            font-size: 16px;
            margin: 0px 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .join button:hover {
            background-color: #f5f5f5;
        }

        /* 수정된 부분 */
        .loginBtn {
            display: flex;
            margin-top: 20px; /* 간격을 위한 margin-top 추가 */
        }

        .loginBtn img {
            width: 150px;
            height: auto;
            cursor: pointer;
            margin-right: 10px;
        }
         #emailModal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            z-index: 2;
        }

        #emailModalOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1;
        }
    </style>
    <meta charset="UTF-8">
    <title>Login</title>
</head>

<body>
    <div class="login-wrapper">
        <h2><img src="<%=request.getContextPath()%>/images/logo_black.png" alt="로고"></h2>
        <% String loginFail = (String)request.getAttribute("loginFail");
           if(loginFail != null && !loginFail.isEmpty()){ %>
            <p class="error-message"><%= loginFail %></p>
        <% } %>
        <form method="post" action="<%=request.getContextPath() %>/memLogin.do" id="login-form">
            <input type="text" name="memEmail" placeholder="Email">
            <input type="password" name="memPw" placeholder="Password">
            <label for="remember-check">
                <input type="checkbox" id="remember-check">Remember Me
            </label>
            <input type="submit" value="Login">
        </form>
        <div class="join">
            <button class="btnsearch" type="button" onclick="window.location.href='<%=request.getContextPath()%>/views/member/find.jsp'">이메일 찾기</button>
            <button class="btnsearch" type="button" onclick="window.location.href='<%=request.getContextPath()%>/views/member/find2.jsp'">비밀번호 찾기</button>
            <button class="btnsearch" type="button" onclick="window.location.href='<%=request.getContextPath()%>/views/member/joinForm.jsp'">회원가입</button>
        </div>
        <div class="loginBtn">
            <a href="javascript:kakaoLogin()"><img src="<%=request.getContextPath()%>/images/kakao_login_medium_narrow.png" alt="카카오"></a>
            <a href="#"><img src="<%=request.getContextPath()%>/images/btnG_완성형.png" alt="네이버"></a>
        </div>
    </div>
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init("ca85312fd4718194ae795cede6884ff8");
</script>


  


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


        
        
        
        

        
        function kakaoLogin() {
    		
          	Kakao.Auth.login({
//          	scope:'profile_nickname, profile_image, account_email, name, gender, age_range, birthday, phone_number, friends',
            success: function(authObj) {
            	console.log(authObj);
            	Kakao.API.request({
                	url:'/v2/user/me',
//              	success: res => {
//                  	const kakao_account = res.kakao_account;
//                  	console.log(kakao_account);
//                  	const kakao_account_mail = res.kakao_account.email;
//                  	console.log(res.kakao_account.email);
    				success: function(resp){
    					let info = resp.kakao_account;
    					console.log(info);
//     					let id = resp.id;
//     					age_range birthday account_email profile_image gender profile_nickname name phone_number friends
    					let data = {
    						token: Kakao.Auth.getAccessToken(),
//     						memId: id,

    						memNcnm: info.profile.nickname,
    						memBirthday: info.birthday,
    						memBirthyear: info.birthyear,
    						memGender: info.gender,
    						memName: info.name, 
    						memEmail: info.email,
    						memTelno: info.phone_number,
    						memFrom: "kakao"
    					};
    					
    					let ajax = new XMLHttpRequest();
    					
    					ajax.open('POST', '/FilmSquare/kakaoLogin.do');
    					ajax.setRequestHeader('Content-Type','application/json');
    					
    					ajax.onload = function(){
    						if(ajax.status == 200){
//     							console.log(200);
								if(ajax.responseText){
									location.href="main.do";
								}else{
									//인서트 실패시..
									alert('카카오 로그인에 실패했습니다.');
									location.href="memLogin.do";
								}
    						}else{
//     							console.log(2123231200);
    						}
    						
    					
    					}
    					console.log(data);
    					ajax.send(JSON.stringify(data));
    				}
    				
              });
            }
          });
        }

        



        


      </script>
    
</body>

</html>
