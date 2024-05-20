package util;

import com.google.gson.Gson;

public class MyUtil {


    // PosterVO 리스트를 JSON 형태로 변환하는 메서드
    public static String convertObjectToJson(Object object) {
        Gson gson = new Gson();
        return gson.toJson(object);
    }

}
