<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setContentType("text/html");
    HttpSession httpSession = request.getSession(true);
    httpSession.removeAttribute("name");
    httpSession.removeAttribute("id");
    httpSession.removeAttribute("cart");
    httpSession.removeAttribute("type");
    httpSession.setMaxInactiveInterval(0);
    httpSession.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
</html>
