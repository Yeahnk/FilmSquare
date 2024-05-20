<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function pay(){
		var lostpay = $("input[name=Lost_Pay]:checked").val();
			if(lostpay == 'direct'){
				lostpay = $("#paybox").val();
				lostpay = lostpay.replace("direct", "");
				lostpay = lostpay.replace(",", "");
			}  // 결제금액 직접입력한 칸 숫자만 걸러주기
			
			var id = '';  // 테스트여서 id를 직접 입력
			// ajax로 회원정보를 받아온뒤 이름 연락처 주소 추출
			$.ajax({
				url: "el/paymember",
				contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				data: {"id":id},
				type: 'POST',
				success: function(data){
					alert("통신성공");
					
					var IMP = window.IMP;
					var code = "";
					IMP.init(code);
					IMP.request_pay(
							{  // name과 amount만 있어도 결제 진행가능
								pg: 'kakao',  // pg사 선택(kakao,kakaopay 둘다 가능)
								pay_method: 'card',
								merchant_uid: 'merchant_' + new Date().getTime(),  // 주문번호
								name: '사례금',  // 상품명
								amount: lostpay,
								buyer_name: data[0].name,
								buyer_name: data[0].email,
								buyer_name: data[0].contact,
							},
							function(rsp){
								if(rsp.success){  // 결제성공
									var msg = '결제 완료';
									var result = {
											"PayCode":rsp.merchant_uid,  // PayCode  가맹점에서 생성/관리하는 고유 주문번호
											"Pay_Way":rsp.pay_method,  // Pay_Way  결제수단
											"Pay_Amount":rsp.paid_amount,  // Pay_Amount  결제금액
											"Pay_State":rsp.status,  // Pay_State  결제상태
											"Pay_Date":getFormatDate(new Date()),  // 결제승인시각
											"Id":id
											}  // result
											// 서버로 결제테이블 정보 전송
											$.ajax({
												url:"",
												dataType:'json',
												contentType:'application/json;charset=UTF-8',
												data:JSON.stringify(result),
												type:'POST',
												success:function(data){
													console.log(data);
												}
											});
											alert("결제성공");
											addboard();  // 전송
									} // 결제성공
								else{  // 결제 실패
										var msg = '결제실패 에러내용'+rsp.error_msg;
										alert(msg);
								}
							}  // function(rsp)	
					
					);  // IMP.request
					return true;
				},  // 가장 처음 ajax 성공
				error: function(){
					alert("통신에러");
				}
			});  // 가장 처음 ajax
			
	}  // pay

</script>
</body>
</html>