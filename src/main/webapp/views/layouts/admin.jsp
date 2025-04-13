<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">
    <%--    <link rel="shortcut icon" href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.min.css">--%>

    <link href="${pageContext.request.contextPath}/assets/libs/simple-datatables/style.css" rel="stylesheet"
          type="text/css"/>
    <!-- App css -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css"/>
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
                    <a class=" btn btn-sm btn-soft-primary" href="#" role="button"><i
                            class="fas fa-plus me-2"></i>New Task</a>
                    <!-- <h5 class="mb-0 fw-semibold text-truncate">Good Morning, James!</h5> -->
                    <!-- <h6 class="mb-0 fw-normal text-muted text-truncate fs-14">Here's your overview this week.</h6> -->
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
                        <img src="assets/images/flags/us_flag.jpg" alt="" class="thumb-sm rounded-circle">
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#"><img src="/assets/images/flags/us_flag.jpg" alt=""
                                                               height="15" class="me-2">English</a>
                        <a class="dropdown-item" href="#"><img src="/assets/images/flags/spain_flag.jpg" alt=""
                                                               height="15" class="me-2">Spanish</a>
                        <a class="dropdown-item" href="#"><img src="/assets/images/flags/germany_flag.jpg" alt=""
                                                               height="15" class="me-2">German</a>
                        <a class="dropdown-item" href="#"><img src="/images/flags/french_flag.jpg" alt=""
                                                               height="15" class="me-2">French</a>
                    </div>
                </li><!--end topbar-language-->

                <li class="topbar-item">
                    <a class="nav-link nav-icon" href="javascript:void(0);" id="light-dark-mode">
                        <i class="iconoir-half-moon dark-mode"></i>
                        <i class="iconoir-sun-light light-mode"></i>
                    </a>
                </li>

                <li class="dropdown topbar-item">
                    <a class="nav-link dropdown-toggle arrow-none nav-icon" data-bs-toggle="dropdown" href="#"
                       role="button" aria-haspopup="false" aria-expanded="false" data-bs-offset="0,19">
                        <i class="iconoir-bell"></i>
                        <span class="alert-badge"></span>
                    </a>
                    <div class="dropdown-menu stop dropdown-menu-end dropdown-lg py-0">

                        <h5 class="dropdown-item-text m-0 py-3 d-flex justify-content-between align-items-center">
                            Notifications <a href="#" class="badge text-body-tertiary badge-pill">
                            <i class="iconoir-plus-circle fs-4"></i>
                        </a>
                        </h5>
                        <ul class="nav nav-tabs nav-tabs-custom nav-success nav-justified mb-1" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link mx-0 active" data-bs-toggle="tab" href="#All" role="tab"
                                   aria-selected="true">
                                    All <span class="badge bg-primary-subtle text-primary badge-pill ms-1">24</span>
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link mx-0" data-bs-toggle="tab" href="#Projects" role="tab"
                                   aria-selected="false" tabindex="-1">
                                    Projects
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link mx-0" data-bs-toggle="tab" href="#Teams" role="tab"
                                   aria-selected="false" tabindex="-1">
                                    Team
                                </a>
                            </li>
                        </ul>
                        <div class="ms-0" style="max-height:230px;" data-simplebar>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="All" role="tabpanel"
                                     aria-labelledby="all-tab" tabindex="0">
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">2 min ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-wolf fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Your order is placed</h6>
                                                <small class="text-muted mb-0">Dummy text of the printing and
                                                    industry.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">10 min ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-apple-swift fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Meeting with designers
                                                </h6>
                                                <small class="text-muted mb-0">It is a long established fact that a
                                                    reader.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">40 min ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-birthday-cake fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">UX 3 Task complete.</h6>
                                                <small class="text-muted mb-0">Dummy text of the printing.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">1 hr ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-drone fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Your order is placed</h6>
                                                <small class="text-muted mb-0">It is a long established fact that a
                                                    reader.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">2 hrs ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-user fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Payment Successfull</h6>
                                                <small class="text-muted mb-0">Dummy text of the printing.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                </div>
                                <div class="tab-pane fade" id="Projects" role="tabpanel"
                                     aria-labelledby="projects-tab" tabindex="0">
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">40 min ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-birthday-cake fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">UX 3 Task complete.</h6>
                                                <small class="text-muted mb-0">Dummy text of the printing.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">1 hr ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-drone fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Your order is placed</h6>
                                                <small class="text-muted mb-0">It is a long established fact that a
                                                    reader.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">2 hrs ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-user fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Payment Successfull</h6>
                                                <small class="text-muted mb-0">Dummy text of the printing.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                </div>
                                <div class="tab-pane fade" id="Teams" role="tabpanel" aria-labelledby="teams-tab"
                                     tabindex="0">
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">1 hr ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-drone fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Your order is placed</h6>
                                                <small class="text-muted mb-0">It is a long established fact that a
                                                    reader.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                    <!-- item-->
                                    <a href="#" class="dropdown-item py-3">
                                        <small class="float-end text-muted ps-2">2 hrs ago</small>
                                        <div class="d-flex align-items-center">
                                            <div
                                                    class="flex-shrink-0 bg-primary-subtle text-primary thumb-md rounded-circle">
                                                <i class="iconoir-user fs-4"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2 text-truncate">
                                                <h6 class="my-0 fw-normal text-dark fs-13">Payment Successfull</h6>
                                                <small class="text-muted mb-0">Dummy text of the printing.</small>
                                            </div><!--end media-body-->
                                        </div><!--end media-->
                                    </a><!--end-item-->
                                </div>
                            </div>

                        </div>
                        <!-- All-->
                        <a href="pages-notifications.html" class="dropdown-item text-center text-dark fs-13 py-2">
                            View All <i class="fi-arrow-right"></i>
                        </a>
                    </div>
                </li>

                <li class="dropdown topbar-item">
                    <a class="nav-link dropdown-toggle arrow-none nav-icon" data-bs-toggle="dropdown" href="#"
                       role="button" aria-haspopup="false" aria-expanded="false" data-bs-offset="0,19">
                        <img src="assets/images/users/avatar-1.jpg" alt="" class="thumb-md rounded-circle">
                    </a>
                    <div class="dropdown-menu dropdown-menu-end py-0">
                        <div class="d-flex align-items-center dropdown-item py-2 bg-secondary-subtle">
                            <div class="flex-shrink-0">
                                <img src="assets/images/users/avatar-1.jpg" alt="" class="thumb-md rounded-circle">
                            </div>
                            <div class="flex-grow-1 ms-2 text-truncate align-self-center">
                                <h6 class="my-0 fw-medium text-dark fs-13">William Martin</h6>
                                <small class="text-muted mb-0">Front End Developer</small>
                            </div><!--end media-body-->
                        </div>
                        <div class="dropdown-divider mt-0"></div>
                        <small class="text-muted px-2 pb-1 d-block">Account</small>
                        <a class="dropdown-item" href="pages-profile.html"><i
                                class="las la-user fs-18 me-1 align-text-bottom"></i> Profile</a>
                        <a class="dropdown-item" href="pages-faq.html"><i
                                class="las la-wallet fs-18 me-1 align-text-bottom"></i> Earning</a>
                        <small class="text-muted px-2 py-1 d-block">Settings</small>
                        <a class="dropdown-item" href="pages-profile.html"><i
                                class="las la-cog fs-18 me-1 align-text-bottom"></i>Account Settings</a>
                        <a class="dropdown-item" href="pages-profile.html"><i
                                class="las la-lock fs-18 me-1 align-text-bottom"></i> Security</a>
                        <a class="dropdown-item" href="pages-faq.html"><i
                                class="las la-question-circle fs-18 me-1 align-text-bottom"></i> Help Center</a>
                        <div class="dropdown-divider mb-0"></div>
                        <a class="dropdown-item text-danger" href="auth-login.html"><i
                                class="las la-power-off fs-18 me-1 align-text-bottom"></i> Logout</a>
                    </div>
                </li>
            </ul><!--end topbar-nav-->
        </nav>
        <!-- end navbar-->
    </div>
</div>
<%@include file="/views/admin/sidebar.jsp" %>
<div class="page-wrapper">

    <div class="page-content">
        <div class="container-fluid">
            <c:choose>
                <c:when test="${not empty contentPage}">
                    <jsp:include page="${contentPage}"/>
                </c:when>
                <c:otherwise>
                    <%-- Nếu không truyền gì thì mặc định include trang welcome.jsp --%>
                    <jsp:include page="/views/admin/menu-item.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
        <!--Start Rightbar-->
        <!--Start Rightbar/offcanvas-->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="Appearance" aria-labelledby="AppearanceLabel">
            <div class="offcanvas-header border-bottom justify-content-between">
                <h5 class="m-0 font-14" id="AppearanceLabel">Appearance</h5>
                <button type="button" class="btn-close text-reset p-0 m-0 align-self-center"
                        data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <h6>Account Settings</h6>
                <div class="p-2 text-start mt-3">
                    <div class="form-check form-switch mb-2">
                        <input class="form-check-input" type="checkbox" id="settings-switch1">
                        <label class="form-check-label" for="settings-switch1">Auto updates</label>
                    </div><!--end form-switch-->
                    <div class="form-check form-switch mb-2">
                        <input class="form-check-input" type="checkbox" id="settings-switch2" checked>
                        <label class="form-check-label" for="settings-switch2">Location Permission</label>
                    </div><!--end form-switch-->
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="settings-switch3">
                        <label class="form-check-label" for="settings-switch3">Show offline Contacts</label>
                    </div><!--end form-switch-->
                </div><!--end /div-->
                <h6>General Settings</h6>
                <div class="p-2 text-start mt-3">
                    <div class="form-check form-switch mb-2">
                        <input class="form-check-input" type="checkbox" id="settings-switch4">
                        <label class="form-check-label" for="settings-switch4">Show me Online</label>
                    </div><!--end form-switch-->
                    <div class="form-check form-switch mb-2">
                        <input class="form-check-input" type="checkbox" id="settings-switch5" checked>
                        <label class="form-check-label" for="settings-switch5">Status visible to all</label>
                    </div><!--end form-switch-->
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="settings-switch6">
                        <label class="form-check-label" for="settings-switch6">Notifications Popup</label>
                    </div><!--end form-switch-->
                </div><!--end /div-->
            </div><!--end offcanvas-body-->
        </div>
        <!--end Rightbar/offcanvas-->
        <!--end Rightbar-->
        <!--Start Footer-->
        <footer class="footer text-center text-sm-start d-print-none">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card mb-0 border-bottom-0 rounded-bottom-0">
                            <div class="card-body">
                                <p class="text-muted mb-0">
                                    ©
                                    <script> document.write(new Date().getFullYear()) </script>
                                    Dastone
                                    <span class="text-muted d-none d-sm-inline-block float-end">
                                            Design with
                                            <i class="iconoir-heart-solid text-danger align-middle"></i>
                                            by Mannatthemes</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<%--<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>--%>


<%--<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>


<script src="${pageContext.request.contextPath}/assets/libs/simple-datatables/umd/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/datatable.init.js"></script>

<script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script>
<script src="https://apexcharts.com/samples/assets/stock-prices.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pages/index.init.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>


</body>
</html>