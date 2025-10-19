<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống tư vấn sinh viên</title>
    <meta content="404 - Not found" name="description"/>
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

    <%--    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>--%>
    <script src="${pageContext.request.contextPath}/ckeditor5/ckeditor5.umd.js"></script>
    <%--    <script src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>--%>
    <%--    <script src="https://code.jquery.com/jquery-3.7.1.js"--%>
    <%--            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="--%>
    <%--            crossorigin="anonymous"></script>--%>
    <script src="https://code.jquery.com/jquery-3.7.1.js" nonce="${cspNonce}"></script>
</head>
<body>

<!-- Include the Navigation Bar -->
<jsp:include page="/views/client/client-navbar.jsp"/>

<div class="container">

    <div class="page-wrapper">
        <div class="container-xxl">
            <div class="row vh-100 d-flex justify-content-center">
                <div class="col-12 align-self-center">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 mx-auto">
                                <div class="card">
                                    <div class="card-body p-0 bg-black auth-header-box rounded-top">
                                        <div class="text-center p-3">
                                            <a href="${pageContext.request.contextPath}"
                                               class="logo logo-admin">
                                                <%--                                        <img src="assets/images/logo-sm.png" height="50" alt="logo" class="auth-logo">--%>
                                            </a>
                                            <h4 class="mt-3 mb-1 fw-semibold text-white fs-18">Oops! Sorry page
                                                does not
                                                found</h4>
                                            <p class="text-muted fw-medium mb-0">Go back</p>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="ex-page-content text-center">
                                            <h1 class="my-2">404!</h1>
                                            <h5 class="fs-16 text-muted mb-3">Somthing went wrong</h5>
                                        </div>
                                        <a class="btn btn-primary w-100"
                                           href="${pageContext.request.contextPath}">Back to
                                            home <i class="fas fa-redo ms-1"></i></a>
                                    </div><!--end card-body-->
                                </div><!--end card-->
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end card-body-->
                </div><!--end col-->
            </div><!--end row-->
        </div>

    </div>
</div>
<jsp:include page="/views/client/client-footer.jsp"/>

<script src="${pageContext.request.contextPath}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>