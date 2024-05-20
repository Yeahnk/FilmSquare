package vod.controller;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONObject;

@WebServlet("/kakaoPayment")
public class kakaoPayment extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//
//        try {
//            // 카카오페이 API 호출
//            String result = callKakaoPaymentApi();
//
//            // 결과를 클라이언트에 전송
//            response.getWriter().write(result);
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().write("Error occurred: " + e.getMessage());
//        }
//    }
//
//    private String callKakaoPaymentApi() throws URISyntaxException, IOException {
//        // 카카오페이 API URL
//        URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
//
//        // 헤더 설정
//        Map<String, String> headers = new HashMap<>();
//        headers.put("Authorization", "KakaoAK ffb415ac962af875bcece2313525df4b");
//        headers.put("Content-Type", "application/x-www-form-urlencoded");
//
//        // 요청 파라미터 설정
//        Map<String, String> params = new HashMap<>();
//        params.put("cid", "TC0ONETIME");
//        params.put("partner_order_id", "partner_order_id");
//        params.put("partner_user_id", "partner_user_id");
//        params.put("item_name", "초코파이");
//        params.put("quantity", "1");
//        params.put("total_amount", "2200");
//        params.put("vat_amount", "200");
//        params.put("tax_free_amount", "0");
//        params.put("approval_url", "https://developers.kakao.com/success");
//        params.put("fail_url", "https://developers.kakao.com/fail");
//        params.put("cancel_url", "https://developers.kakao.com/cancel");
//
//        // HttpClient 생성
//        HttpClient httpClient = HttpClients.createDefault();
//
//        // POST 요청 설정
//        HttpPost httpPost = new HttpPost(uri);
//        for (Map.Entry<String, String> entry : headers.entrySet()) {
//            httpPost.addHeader(entry.getKey(), entry.getValue());
//        }
//        httpPost.setEntity(new StringEntity(buildQueryString(params), StandardCharsets.UTF_8));
//
//        // API 호출 및 응답 수신
//        HttpResponse response = httpClient.execute(httpPost);
//        String result = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
//
//        return result;
//    }
//
//    private String buildQueryString(Map<String, String> params) {
//        StringBuilder queryString = new StringBuilder();
//        for (Map.Entry<String, String> entry : params.entrySet()) {
//            if (queryString.length() > 0) {
//                queryString.append("&");
//            }
//            queryString.append(entry.getKey()).append("=").append(entry.getValue());
//        }
//        return queryString.toString();
//    }
}
