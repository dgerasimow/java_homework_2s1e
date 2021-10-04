<%--
  Created by IntelliJ IDEA.
  User: thw1zard
  Date: 22.09.2021
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page</title>
</head>
<body>
<%
    String user = null;
    String sessionUser = (String) session.getAttribute("username");
    if (sessionUser == null) {
        response.sendRedirect("login.html");
    } else {
        user = sessionUser;
    }

    String cookieUser = null;
    String sessionId = null;
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("username".equals(c.getName())) cookieUser = c.getValue();
            if ("JSESSIONID".equals(c.getName())) sessionId = c.getValue();
        }
    } else {
        sessionId = session.getId();
    }
%>

<h3>
    Hello, <%=user%>! Login Successful
    <br>
    Session ID = <%=sessionId%>
    Cookie Username = <%=cookieUser%>
</h3>
</body>
</html>
