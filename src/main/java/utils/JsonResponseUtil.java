package utils;

import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class JsonResponseUtil {
    private static final Gson gson = new Gson();

    public static void sendSuccess(HttpServletResponse response, String message) throws IOException {
        sendJson(response, "success", message);
    }

    public static void sendError(HttpServletResponse response, String message) throws IOException {
        sendJson(response, "error", message);
    }

    public static void sendJson(HttpServletResponse response, String status, String message) throws IOException {
        Map<String, Object> jsonResponse = new HashMap<>();
        jsonResponse.put("status", status);
        jsonResponse.put("message", message);
        sendJson(response, jsonResponse);
    }

    public static void sendJson(HttpServletResponse response, Map<String, Object> jsonMap) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String json = gson.toJson(jsonMap);
        response.getWriter().write(json);
    }


}
