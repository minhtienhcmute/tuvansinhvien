<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống tư vấn sinh viên</title>
    <meta content="Hệ thống tư vấn sinh viên" name="description"/>
    <meta content="" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Bootstrap CSS -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon1.ico">
    <link href="${pageContext.request.contextPath}/assets/libs/simple-datatables/style.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/ckeditor5/ckeditor5.css" rel="stylesheet" type="text/css"/>
    <%--    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>--%>
    <script src="${pageContext.request.contextPath}/ckeditor5/ckeditor5.umd.js"></script>
    <%--    <script src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>
    <%--    <script src="https://cdn.ckbox.io/ckbox/2.6.1/ckbox.js" crossorigin></script>--%>
    <%--    <script src="${pageContext.request.contextPath}/assets/js/main.js" crossorigin></script>--%>
</head>
<body>

<!-- Include the Navigation Bar -->
<jsp:include page="/views/client/client-navbar.jsp"/>

<div class="container">

    <div class="page-wrapper">
        <div class="page-content mx-0">
            <div class="container-fluid">
                <jsp:include page="/views/partials/client-breadscrum.jsp"/>

                <c:choose>
                    <c:when test="${not empty contentPage}">
                        <jsp:include page="${contentPage}"/>
                    </c:when>
                    <c:otherwise>
                        <%-- Nếu không truyền gì thì mặc định include trang welcome.jsp --%>
                        Missing content page
                    </c:otherwise>
                </c:choose>

            </div>


        </div>
    </div>


    <%--</div>--%>

</div>
<!-- Include the Footer -->
<jsp:include page="/views/client/client-footer.jsp"/>

<script src="${pageContext.request.contextPath}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>


<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
</html>