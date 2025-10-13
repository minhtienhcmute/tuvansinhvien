<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="${pageContext.request.contextPath}/assets/images/logos/hcmute-logo.jpg" alt="Logo"
                 height="50" alt="" class="me-1">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}">Trang chủ</a>
                </li>
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link" href="#">Forum</a>--%>
                <%--                </li>--%>
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link" href="#">My Profile</a>--%>
                <%--                </li>--%>
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link" href="#">Office Hours</a>--%>
                <%--                </li>--%>

            </ul>

            <c:if test="${!hideAuthButton}">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
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
                                <c:if test="${sessionScope.user.type == 1}">
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin"><i
                                            class="las la-tools me-1 align-text-bottom"></i>
                                        Admin dashboard</a>
                                </c:if>

                                    <%--                                <small class="text-muted px-2 py-1 d-block">Settings</small>--%>
                                    <%--                                <a class="dropdown-item" href="pages-profile.html"><i--%>
                                    <%--                                        class="las la-cog fs-18 me-1 align-text-bottom"></i>Account Settings</a>--%>
                                    <%--                                <a class="dropdown-item" href="pages-profile.html"><i--%>
                                    <%--                                        class="las la-lock fs-18 me-1 align-text-bottom"></i>--%>
                                    <%--                                    Security</a>--%>
                                    <%--                                <a class="dropdown-item" href="pages-faq.html"><i--%>
                                    <%--                                        class="las la-question-circle fs-18 me-1 align-text-bottom"></i> Help Center</a>--%>

                                <div class="dropdown-divider mb-0"></div>

                                <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i
                                        class="las la-power-off fs-18 me-1 align-text-bottom"></i> Logout</a>
                            </div>
                        </div>

                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary dropdown-toggle"
                           type="button" id="signInButton"
                        >
                            Sign in
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </div>
</nav>