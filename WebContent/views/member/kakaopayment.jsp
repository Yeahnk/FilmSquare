<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<body>
<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>


<script>

	function kakaoPayment() {
		const settings = {
			"async" : true,
			"crossDomain" : true,
			"url" : "https://kapi.kakao.com/v1/payment/ready",
			"method" : "POST",
			"headers" : {
				"Authorization" : "KakaoAK ffb415ac962af875bcece2313525df4b",
				"Content-Type" : "application/x-www-form-urlencoded"
			},
			"data" : {
				"cid" : "TC0ONETIME",
				"partner_order_id" : "partner_order_id",
				"partner_user_id" : "partner_user_id",
				"item_name" : "초코파이",
				"quantity" : "1",
				"total_amount" : "2200",
				"vat_amount" : "200",
				"tax_free_amount" : "0",
				"approval_url" : "https://developers.kakao.com/success",
				"fail_url" : "https://developers.kakao.com/fail",
				"cancel_url" : "https://developers.kakao.com/cancel"
			}
		};
		$.ajax(settings).done(function(response) {
			console.log(response);
		});
	}

	kakaoPayment();
</script>


</body>
</html>