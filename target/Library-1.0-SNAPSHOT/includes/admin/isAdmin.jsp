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
