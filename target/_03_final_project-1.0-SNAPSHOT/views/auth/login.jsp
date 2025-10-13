<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row d-flex justify-content-center">
    <div class="col-12 align-self-center">
        <div class="card-body">
            <div class="row">
                <div class="col-4 mx-auto">
                    <jsp:include page="/views/partials/message-box.jsp"></jsp:include>

                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Login</h4>
                        </div>
                        <div class="card-body">
                            <form class="mb-4" action="login" method="POST">
                                <input type="hidden" name="redirectUri" value="${param.redirect_uri}">

                                <div class="form-group mb-2">
                                    <label class="form-label" for="username">Email</label>
                                    <input type="text" class="form-control" id="username" name="email"
                                           placeholder="Enter email">
                                </div><!--end form-group-->

                                <div class="form-group">
                                    <label class="form-label" for="password">Password</label>
                                    <input type="password" class="form-control" name="password"
                                           id="password" placeholder="Enter password">
                                </div><!--end form-group-->

                                <div class="form-group row mt-3">
                                    <div class="col-sm-6">
                                        <div class="form-check form-switch form-switch-primary">
                                            <input class="form-check-input" type="checkbox"
                                                   id="customSwitchPrimary">
                                            <label class="form-check-label" for="customSwitchPrimary">Remember
                                                me</label>
                                        </div>
                                    </div><!--end col-->
                                    <div class="col-sm-6 text-end">
                                        <a href="auth-recover-pw.html" class="text-muted font-13"><i
                                                class="dripicons-lock"></i> Forgot password?</a>
                                    </div><!--end col-->
                                </div><!--end form-group-->

                                <div class="form-group mb-0 row">
                                    <div class="col-12">
                                        <div class="d-grid mt-3">
                                            <button class="btn btn-primary" type="submit">Log In <i
                                                    class="fas fa-sign-in-alt ms-1"></i></button>
                                        </div>
                                    </div><!--end col-->
                                </div> <!--end form-group-->
                            </form><!--end form-->
                            <div class="text-center  mb-2">
                                <%--                                    <p class="text-muted">Don't have an account ? <a href="auth-register.html"--%>
                                <%--                                                                                     class="text-primary ms-2">Free--%>
                                <%--                                        Resister</a></p>--%>
                                <h6 class="px-3 d-inline-block">Or Login With</h6>
                            </div>
                            <div class="d-flex justify-content-center">
                                <%--                                    <a href="#"--%>
                                <%--                                       class="d-flex justify-content-center align-items-center thumb-md bg-blue-subtle text-blue rounded-circle me-2">--%>
                                <%--                                        <i class="fab fa-facebook align-self-center"></i>--%>
                                <%--                                    </a>--%>
                                <%--                                    <a href="#"--%>
                                <%--                                       class="d-flex justify-content-center align-items-center thumb-md bg-info-subtle text-info rounded-circle me-2">--%>
                                <%--                                        <i class="fab fa-twitter align-self-center"></i>--%>
                                <%--                                    </a>--%>
                                <a href="${googleLoginUrl}"
                                   class="d-flex justify-content-center align-items-center thumb-md bg-danger-subtle text-danger rounded-circle">
                                    <i class="fab fa-google align-self-center"></i>
                                </a>
                            </div>
                        </div><!--end card-body-->
                    </div><!--end card-->
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end card-body-->
    </div><!--end col-->
</div>
<!--end row-->
<!-- c

