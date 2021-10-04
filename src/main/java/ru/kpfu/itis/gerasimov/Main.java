package ru.kpfu.itis.gerasimov;

import ru.kpfu.itis.gerasimov.net.HttpClientImplementation;

import java.util.HashMap;
import java.util.Map;

public class Main {

    public static void main(String[] args) {
////        try {
////            URL url = new URL("http://jsonplaceholder.typicode.com/posts?userId=1");
////            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//////            HashMap<String, String> parameters = new HashMap<>();
//////            parameters.put("key", "value");
//////            connection.setDoOutput(true);
//////            try (DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())) {
//////                outputStream.writeBytes("userId=1");
//////            }
////            connection.setRequestMethod("GET");
////            connection.setRequestProperty("Content-Type", "application/json");
////            connection.setConnectTimeout(5000);
////            connection.setReadTimeout(5000);
////            try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
////                StringBuilder content = new StringBuilder();
////                String input;
////                while ((input = reader.readLine()) != null) {
////                    content.append(input);
////                }
////                System.out.println(content);
////            }
////            connection.disconnect();
////        } catch (IOException e) {
////            e.printStackTrace();
////        }
//
//        try {
//            URL postURL = new URL("https://reqres.in/api/register");
//            HttpURLConnection postConnection = (HttpURLConnection) postURL.openConnection();
//
//            postConnection.setRequestMethod("POST");
//            postConnection.setRequestProperty("Content-Type", "application/json; utf-8");
//            postConnection.setRequestProperty("Accept", "application/json");
//
//            postConnection.setDoOutput(true);
//            String jsonInputString = "\"email\": \"test\", \"password\": \"test\"";
//            try(OutputStream outputStream = postConnection.getOutputStream()) {
//                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
//                outputStream.write(input);
//            }
//
//            try (BufferedReader reader = new BufferedReader(new InputStreamReader(postConnection.getInputStream(),
//                    StandardCharsets.UTF_8))) {
//                StringBuilder content = new StringBuilder();
//                String input;
//                while ((input = reader.readLine()) != null) {
//                    content.append(input);
//                }
//                System.out.println(content);
//            }
//        } catch (MalformedURLException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        Map<String, String> header = new HashMap<>();
        Map<String, String> params = new HashMap<>();
        header.put("Accept", "application/json");
        header.put("Content-Type", "application/json");
        params.put("foo1", "bar1");
        params.put("foo2", "bar2");
        HttpClientImplementation httpClientImplementation = new HttpClientImplementation();

//        System.out.println(httpClientImplementation.get("https://postman-echo.com/get", header, params));
        System.out.println(httpClientImplementation.post("https://postman-echo.com/post", header, params));
    }
}
