<%@ page import="auth.GooglePoJo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JSP - Client Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
</head>
<body>
<h1><%= "Hello Client!" %>
</h1>


<br/>
<span class="text-success">Hello Servlet</span>
<%GooglePoJo gp = (GooglePoJo) request.getAttribute("pojo"); %>
<div style="width:400px;margin:auto;padding-top:30px;">
    <table class="table table-bordered">
        <tr>
            <td>User ID</td>
            <td><%=gp.getId()%>
            </td>
        </tr>
        <tr>
            <td>Name</td>
            <td><%=gp.getName()%>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td><%=request.getAttribute("name")%>
            </td>
        </tr>


    </table>
</div>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>