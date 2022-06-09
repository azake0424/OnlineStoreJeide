<%--
  Created by IntelliJ IDEA.
  User: zangar
  Date: 09.06.2022
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("isAdmin") != null){
        boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (!isAdmin) {
            response.sendRedirect("/login.jsp");
        }
    } else {
        response.sendRedirect("/login.jsp");
    }

%>
