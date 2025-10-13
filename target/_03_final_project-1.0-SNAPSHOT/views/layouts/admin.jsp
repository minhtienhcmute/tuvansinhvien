<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-startbar="light" data-bs-theme="light">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JSP - Admin Page</title>
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description"/>
    <meta content="" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon1.ico">
    <%--    <link rel="shortcut icon" href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.min.css">--%>

    <link href="${pageContext.request.contextPath}/assets/libs/simple-datatables/style.css" rel="stylesheet"
          type="text/css"/>
    <%--    <link href="${pageContext.request.contextPath}/assets/libs/mobius1-selectr/selectr.min.css" rel="stylesheet"--%>
    <%--          type="text/css"/>--%>
    <link href="${pageContext.request.contextPath}/assets/libs/huebee/huebee.min.css" rel="stylesheet" type="text/css"/>

    <!-- App css -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/ckeditor5/ckeditor5.css" rel="stylesheet" type="text/css"/>
    <%--    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>--%>
    <script src="${pageContext.request.contextPath}/ckeditor5/ckeditor5.umd.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>

    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>--%>
</head>
<body>
<div class="topbar d-print-none">
    <div class="container-fluid">
        <nav class="topbar-custom d-flex justify-content-between" id="topbar-custom">
            <ul class="topbar-item list-unstyled d-inline-flex align-items-center mb-0">
                <li>
                    <button class="nav-link mobile-menu-btn nav-icon" id="togglemenu">
                        <i class="iconoir-menu"></i>
                    </button>
                </li>
                <li class="mx-2 welcome-text">
                    <%--                    <a class=" btn btn-sm btn-soft-primary" href="#" role="button"><i--%>
                    <%--                            class="fas fa-plus me-2"></i>New Task</a>--%>
                    <h5 class="mb-0 fw-semibold text-truncate">Xin chào, ${sessionScope.user.name}!</h5>
                    <h6 class="mb-0 fw-normal text-muted text-truncate fs-14"></h6>
                </li>

            </ul>
            <ul class="topbar-item list-unstyled d-inline-flex align-items-center mb-0">
                <li class="hide-phone app-search">
                    <form role="search" action="#" method="get">
                        <input type="search" name="search" class="form-control top-search mb-0"
                               placeholder="Search here...">
                        <button type="submit"><i class="iconoir-search"></i></button>
                    </form>
                </li>
                <li class="dropdown">
                    <a class="nav-link dropdown-toggle arrow-none nav-icon" data-bs-toggle="dropdown" href="#"
                       role="button" aria-haspopup="false" aria-expanded="false" data-bs-offset="0,19">
                        <img src="${pageContext.request.contextPath}/assets/images/flags/us_flag.jpg" alt=""
                             class="thumb-sm rounded-circle">
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#"><img
                                src="${pageContext.request.contextPath}/assets/images/flags/us_flag.jpg" alt=""
                                height="15" class="me-2">English</a>
                        <a class="dropdown-item" href="#"><img
                                src="${pageContext.request.contextPath}/assets/images/flags/spain_flag.jpg" alt=""
                                height="15" class="me-2">Spanish</a>
                        <a class="dropdown-item" href="#"><img
                                src="${pageContext.request.contextPath}/assets/images/flags/germany_flag.jpg" alt=""
                                height="15" class="me-2">German</a>
                        <a class="dropdown-item" href="#"><img
                                src="${pageContext.request.contextPath}/images/flags/french_flag.jpg" alt=""
                                height="15" class="me-2">French</a>
                    </div>
                </li><!--end topbar-language-->

                <li class="topbar-item">
                    <a class="nav-link nav-icon" href="javascript:void(0);" id="light-dark-mode">
                        <i class="iconoir-half-moon dark-mode"></i>
                        <i class="iconoir-sun-light light-mode"></i>
                    </a>
                </li>

                <c:if test="${not empty sessionScope.user}">
                    <div class="dropdown topbar-item">
                        <a class="nav-link dropdown-toggle arrow-none nav-icon" data-bs-toggle="dropdown" href="#"
                           role="button" aria-haspopup="false" aria-expanded="false" data-bs-offset="0,19">

                            <jsp:include page="/views/partials/user-avatar.jsp">
                                <jsp:param name="avatarUrl" value="${sessionScope.user.avatar}"/>
                            </jsp:include>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end py-0">
                            <div class="d-flex align-items-center dropdown-item py-2 bg-secondary-subtle">
                                <div class="flex-shrink-0">
                                    <jsp:include page="/views/partials/user-avatar.jsp">
                                        <jsp:param name="avatarUrl" value="${sessionScope.user.avatar}"/>
                                    </jsp:include>
                                </div>
                                <div class="flex-grow-1 ms-2 text-truncate align-self-center">
                                    <h6 class="my-0 fw-medium text-dark fs-13">${sessionScope.user.name}</h6>
                                </div><!--end media-body-->
                            </div>
                            <div class="dropdown-divider mt-0"></div>
                            <small class="text-muted px-2 pb-1 d-block">Account</small>
                            <a class="dropdown-item" href="pages-profile.html"><i
                                    class="las la-user fs-18 me-1 align-text-bottom"></i>
                                Profile</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}"><i
                                    class="las la-arrow-left me-1 align-text-bottom"></i>
                                Quay về trang người dùng
                            </a>
                                <%--                            <small class="text-muted px-2 py-1 d-block">Settings</small>--%>
                                <%--                            <a class="dropdown-item" href="pages-profile.html"><i--%>
                                <%--                                    class="las la-cog fs-18 me-1 align-text-bottom"></i>Account Settings</a>--%>
                                <%--                            <a class="dropdown-item" href="pages-profile.html"><i--%>
                                <%--                                    class="las la-lock fs-18 me-1 align-text-bottom"></i>--%>
                                <%--                                Security</a>--%>
                                <%--                            <a class="dropdown-item" href="pages-faq.html"><i--%>
                                <%--                                    class="las la-question-circle fs-18 me-1 align-text-bottom"></i> Help Center</a>--%>
                                <%--                            <div class="dropdown-divider mb-0"></div>--%>
                            <div class="dropdown-divider mb-0"></div>
                            <a class="dropdown-item text-danger"
                               href="${pageContext.request.contextPath}/logout"><i
                                    class="las la-power-off fs-18 me-1 align-text-bottom"></i> Logout</a>
                        </div>
                    </div>

                </c:if>

            </ul><!--end topbar-nav-->
        </nav>
        <!-- end navbar-->
    </div>
</div>
<%@include file="/views/admin/sidebar.jsp" %>
<div class="page-wrapper">

    <div class="page-content">
        <div class="container-fluid">
            <jsp:include page="/views/partials/breadscrum.jsp"/>

            <c:choose>
                <c:when test="${not empty contentPage}">
                    <jsp:include page="${contentPage}"/>
                </c:when>
                <c:when test="${not empty param.error}">
                    <jsp:include page="/views/partials/message-box.jsp"></jsp:include>
                </c:when>
                <c:otherwise>

                    <%-- Nếu không truyền gì thì mặc định include trang welcome.jsp --%>
                    <%--                    <jsp:include page="/views/admin/menu-item.jsp"/>--%>
                </c:otherwise>
            </c:choose>
        </div>

        <jsp:include page="/views/partials/admin-footer.jsp"></jsp:include>
    </div>
</div>
<%--<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>--%>


<%--<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/assets/libs/mobius1-selectr/selectr.min.js"></script>--%>

<script src="${pageContext.request.contextPath}/assets/libs/huebee/huebee.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/simple-datatables/umd/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/datatable.init.js"></script>

<%--<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>--%>
<%--<script src="https://apexcharts.com/samples/assets/stock-prices.js"></script>--%>

<%--<script src="${pageContext.request.contextPath}/assets/js/pages/index.init.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/pages/forms-advanced.js"></script>--%>

<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>


</body>
</html>