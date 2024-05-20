<%@page import="admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 페이지</title>
<link rel="icon" type="image/x-icon"
	href="adminViews/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="adminViews/css/styles.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<%

	 
	int mCnt = request.getAttribute("mCnt") == null ? 0 : (int) request.getAttribute("mCnt"); 
	int fCnt = request.getAttribute("fCnt") == null ? 0 : (int) request.getAttribute("fCnt"); 
	int rptCnt = request.getAttribute("rptCnt") == null ? 0 : (int) request.getAttribute("rptCnt"); 
	int qnaCnt = request.getAttribute("qnaCnt") == null ? 0 : (int) request.getAttribute("qnaCnt"); 






    AdminVO av = (AdminVO) session.getAttribute("LOGIN_ADMIN");
    if (av == null) {
%>

	<script>
	
	alert("관리자 로그인을 해주세요.");
	console.log("관리자 로그인을 해주세요.");
	
	</script>
<%
response.sendRedirect(request.getContextPath() + "/admin");
        return;
    }
%>

<style>


/* 관리자 메인화면 CSS */

body h1:first-child {
	position: relative;
	bottom: 140px;
	right: 200px;
}

.resume-section-content-home {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	align-content: center;
	justify-content: flex-end;
	flex-direction: column;
	bottom: 10px;
	gap: 70px;
}

.resume-section-content-home {
	max-width: 3000px;
    height: 800px;
    width: 2300px;
    left: 200px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
}

#charts {
	display: flex;
	flex-wrap: nowrap;
	justify-content: center;
	gap: 20px;
	flex-direction: row; /* 세로 방향으로 변경 */
	max-height: 300px;
	max-width: 400px;
	margin-left: 50px;
	margin-right: 100px;
}


#admin-container {
	max-width: 600px;
    height: 300px;
    margin: auto;
    padding: 10px;
    font-size: xx-small;
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    justify-content: center;
}

.admin-section {
	margin-bottom: 10px;
}

#admin-text {
	position: relative;
	left: 60px;
	top: 60px;
}

h5 {
	width: 300px;
}

.numnum {
	right: 0;
	font-weight: bold;
	color: salmon;
	font-size: xx-large;

}



/* 관리자 회원관리 */

#memManage {

	display: flex;
	
}

#memFrame {
	height: 600px;
	width: 1200px;
}

.p-0 {
	position: relative;

}

.bg-primary {
    --bs-bg-opacity: 1;
    background-color:black !important; */
}

.text-primary {
    --bs-text-opacity: 1;
    color: salmon !important;
}

</style>


</head>




<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
		id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath()%>/admin/logout.do"> <span
			class="d-block d-lg-none">Film Square</span> <span
			class="d-none d-lg-block"><img
				class="img-fluid img-profile rounded-circle mx-auto mb-2"
				src="adminViews/assets/img/logo_white.png" alt="..." /></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#about">홈으로</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#memManage">회원관리</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#reportManage">신고관리</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#eboardManage">에디터 게시판</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#qboardManage">문의관리</a></li>
			</ul>
		</div>
	</nav>


	<!-- Page Content-->
	<div class="container-fluid p-0">
		<!-- 메인화면-->
		<section class="resume-section" id="about">
			<div class="resume-section-content-home">
				<h1 class="mb-1">
					관리자님<span class="text-primary">환영합니다!</span>
				</h1>
				<div id="charts">

					<canvas class="charts" id="genderChart" width="400" height="400"></canvas>


					<canvas class="charts" id="chart" width="200" height="100"></canvas>

					<div id="admin-text" class="charts">
						<h5>금일 회원가입자&nbsp;&nbsp;:&nbsp;&nbsp;<span class="numnum">01명</span></h5>
						<br>
						<h5>미처리 신고내역&nbsp;&nbsp;:&nbsp;&nbsp;<span class="numnum">40건</span></h5>
						<br>
						<h5>미처리 문의내역&nbsp;&nbsp;:&nbsp;&nbsp;<span class="numnum">38건</span></h5>

					</div>

				</div>
			</div>
		</section>



		<hr class="m-0" />
		<!-- 회원관리-->
		<section class="resume-section" id="memManage">
			<div class="resume-section-content">
				<h2 class="mb-5" id="memberList">회원관리</h2>
				<!-- 회원관리 내용 시작 -->
				
				<iframe id="memFrame" src="<%=request.getContextPath()%>/admin/mboard/list.do" height="100%" style="overflow: hidden;"></iframe>
				
				<!-- 회원관리 내용 끝 -->
			</div>
		</section>
		
		
		<hr class="m-0" />
		<!-- 신고관리-->
		<section class="resume-section" id="reportManage">
			<div class="resume-section-content">
				<h2 class="mb-5">신고관리</h2>
				
				<iframe id="memFrame" src="<%=request.getContextPath()%>/admin/mvcReport/list.do" height="100%" style="overflow: hidden;"></iframe>
				
			</div>
		</section>
		
		
		
		<hr class="m-0" />
		<!-- 에디터 게시판 -->
		<section class="resume-section" id="eboardManage">
			<div class="resume-section-content">
				<h2 class="mb-5">에디터 게시판</h2>
				
				<iframe id="memFrame" src="<%=request.getContextPath()%>/admin/eboard/list.do" height="100%" style="overflow: hidden;"></iframe>
				
				
			</div>
		</section>
		<hr class="m-0" />
		
		
		<!-- 문의 관리 -->
		<section class="resume-section" id="qboardManage">
			<div class="resume-section-content">
				<h2 class="mb-5">문의 관리</h2>
				
				<iframe id="memFrame" src="<%=request.getContextPath()%>/admin/qboard/list.do" height="100%" style="overflow: hidden;"></iframe>
				
				
			</div>
		</section>
		<hr class="m-0" />
		<!-- Awards-->

	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script src="js/scripts.js"></script>
	<script>
	
		// Get the canvas element
		var ctx = document.getElementById('genderChart').getContext('2d');

		// Replace these values with your actual data
		var maleCount = 120; // 남자 회원수
		var femaleCount = 140; // 여자 회원수

		// Calculate the percentage for each gender
		var totalMembers = maleCount + femaleCount;
		var malePercentage = (maleCount / totalMembers) * 100;
		var femalePercentage = (femaleCount / totalMembers) * 100;

		// Define the data for the chart
		var data = {
			labels : [ '남성', '여성' ],
			datasets : [ {
				data : [ malePercentage, femalePercentage ],
				backgroundColor : [ '#3498db', '#e74c3c' ], // Blue for Male, Red for Female
				hoverBackgroundColor : [ '#2980b9', '#c0392b' ]
			// Hover colors
			} ]
		};

		// Set up options for the chart
		var options = {
			responsive : true,
			maintainAspectRatio : false,
			cutoutPercentage : 50,
			legend : {
				position : 'bottom',
			},
			tooltips : {
				callbacks : {
					label : function(tooltipItem, data) {
						var dataset = data.datasets[tooltipItem.datasetIndex];
						var total = dataset.data.reduce(function(previousValue,
								currentValue, currentIndex, array) {
							return previousValue + currentValue;
						});
						var currentValue = dataset.data[tooltipItem.index];
						var percentage = ((currentValue / total) * 100)
								.toFixed(2);
						return currentValue + ' (' + percentage + '%)';
					}
				}
			}
		};

		// Create the gender distribution donut chart
		var genderChart = new Chart(ctx, {
			type : 'doughnut',
			data : data,
			options : options
		});
		
		
		
		// 차트3
		
		 var ctx = document.getElementById('chart').getContext('2d');

  // Replace these values with your actual data
  var daysOfWeek = ['월', '화', '수', '목', '금', '토', '일'];
  var reviewCounts = [10, 5, 8, 15, 20, 12, 18]; // Replace with the actual count of reviews for each day
  var visitorCounts = [50, 30, 40, 60, 80, 55, 70]; // Replace with the actual count of visitors for each day

  // Define the data for the chart
  var data = {
    labels: daysOfWeek,
    datasets: [
      {
        label: '주간 리뷰 수',
        data: reviewCounts,
        fill: false,
        borderColor: '#2ecc71', // Green color for review count
        pointBackgroundColor: '#2ecc71', // Green color for the data points
        pointRadius: 5,
        pointHoverRadius: 10,
      },
      {
        label: '주간 방문자 수',
        data: visitorCounts,
        fill: false,
        borderColor: '#9b59b6', // Purple color for visitor count
        pointBackgroundColor: '#9b59b6', // Purple color for the data points
        pointRadius: 5,
        pointHoverRadius: 10,
      }
    ]
  };

  // Set up options for the chart
  var options = {
    responsive: true,
    maintainAspectRatio: false,
    legend: {
      display: true,
    },
    scales: {
      xAxes: [{
        scaleLabel: {
          display: true,
          labelString: 'Day of the Week',
        },
      }],
      yAxes: [{
        scaleLabel: {
          display: true,
          labelString: 'Count',
        },
        ticks: {
          beginAtZero: true,
        },
      }],
    },
    tooltips: {
      mode: 'index',
      callbacks: {
        label: function (tooltipItem, data) {
          return data.datasets[tooltipItem.datasetIndex].label + ': ' + tooltipItem.yLabel;
        }
      }
    },
  };

  // Create the line chart
  var chart = new Chart(ctx, {
    type: 'line',
    data: data,
    options: options
  });
		
		
	</script>
</body>
</html>