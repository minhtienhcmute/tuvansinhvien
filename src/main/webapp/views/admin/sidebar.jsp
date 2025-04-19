<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 6/4/2025
  Time: 8:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="startbar d-print-none">
    <!--start brand-->
    <div class="brand">
        <a href="index.html" class="logo">
                <span>
                    <img src="${pageContext.request.contextPath}/assets/images/logo-sm.png" alt="logo-small"
                         class="logo-sm">
                </span>
            <span class="">
                    <img src="${pageContext.request.contextPath}/assets/images/logo-light.png" alt="logo-large"
                         class="logo-lg logo-light">
                    <img src="${pageContext.request.contextPath}/assets/images/logo-dark.png" alt="logo-large"
                         class="logo-lg logo-dark">
                </span>
        </a>
    </div>
    <!--end brand-->
    <!--start startbar-menu-->
    <div class="startbar-menu">
        <div class="startbar-collapse" id="startbarCollapse" data-simplebar>
            <div class="d-flex align-items-start flex-column w-100">
                <!-- Navigation -->
                <ul class="navbar-nav mb-auto w-100">
                    <c:forEach var="menuItem" items="${menus}">
                    <c:choose>
                    <c:when test="${not empty menuItem.getGroupTitle()}">
                    <li class="menu-label mt-2">
                        <span>${menuItem.getGroupTitle()}</span>
                    </li>
                    <c:forEach var="child" items="${menuItem.getChildren()}">
                        <c:set var="menu" value="${child}" scope="request"/>
                        <jsp:include page="/views/admin/menu-item.jsp"/>
                    </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <c:set var="menu" value="${menuItem}" scope="request"/>
                        <jsp:include page="/views/admin/menu-item.jsp"/>
                    </c:otherwise>
                    </c:choose>


                    </c:forEach>

            </div>
        </div><!--end startbar-collapse-->
    </div><!--end startbar-menu-->
</div>

