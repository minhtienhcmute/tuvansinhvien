<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JSP - Admin Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
</head>
<body>
<h1><%= "Hello Admin!" %>
</h1>
<br/>
<span class="text-success bg-secondary" >Hello Servlet</span>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>