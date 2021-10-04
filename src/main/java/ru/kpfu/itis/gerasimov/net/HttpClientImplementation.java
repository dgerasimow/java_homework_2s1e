package ru.kpfu.itis.gerasimov.net;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

public class HttpClientImplementation implements HttpClient {

    @Override
    public String get(String url, Map<String, String> headers, Map<String, String> params) {
        try {

            URL getURL = new URL(makeURLWithParams(params, url));
            HttpURLConnection getConnection = (HttpURLConnection) getURL.openConnection();
            for (String key :
                    headers.keySet()) {
                getConnection.setRequestProperty(key, headers.get(key));
            }

            getConnection.setRequestMethod("GET");

            getConnection.setConnectTimeout(5000);
            getConnection.setReadTimeout(5000);

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(getConnection.getInputStream()))) {
                StringBuilder content = new StringBuilder();
                String input;
                while ((input = reader.readLine()) != null) {
                    content.append(input);
                }
                getConnection.disconnect();
                return content.toString();
            }

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "null";
    }

    @Override
    public String post(String url, Map<String, String> headers, Map<String, String> params) {
        try {
            URL postURL = new URL(url);
            HttpURLConnection postConnection = (HttpURLConnection) postURL.openConnection();
            postConnection.setRequestMethod("POST");

            for (String key :
                    headers.keySet()) {
                postConnection.setRequestProperty(key, headers.get(key));
            }

            int kostilCounter = 1;
            String jsonInputString = "{";
            for (String key :
                    params.keySet()) {
                jsonInputString += "\""+ key + "\"" +":" + "\"" + params.get(key) + "\"";
                if (kostilCounter < params.keySet().size()) {
                    jsonInputString += ",";
                } else {
                    jsonInputString += "}";
                }
                kostilCounter++;
            }

            postConnection.setDoOutput(true);
            try (OutputStream outputStream = postConnection.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                outputStream.write(input, 0, input.length);
            }

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(postConnection.getInputStream(),
                    StandardCharsets.UTF_8))) {
                StringBuilder content = new StringBuilder();
                String input;
                while ((input = reader.readLine()) != null) {
                    content.append(input);
                }
                return content.toString();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String makeURLWithParams(Map<String, String> params, String url) {
        url += "?";
        for (String key :
                params.keySet()) {
            url += key + "=" + params.get(key) + "&";
        }
        return url;
    }
}
