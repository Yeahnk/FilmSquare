<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(function(){
	$('#btn-kakaopay').click(function(){
		$.ajax({
			url:'kakaopay',
			dataType:'json',
			success:function(data){
				// 카카오페이 API로부터 받은 응답 데이터 활용
				var tid = data.tid; // 결제 고유 번호
				var redirectUrl = data.next_redirect_pc_url; // 결제 페이지로 이동할 URL
				
				// 여기에서 tid 또는 redirectUrl을 활용하여 필요한 작업 수행
				alert("결제 고유 번호: " + tid);
				
				// 예를 들어 결제 페이지로 이동하는 경우
				// window.location.href = redirectUrl;
			},
			error: function(error){
				alert(JSON.stringify(error));
			}
		});
	});
});

</script>



</body>
</html>