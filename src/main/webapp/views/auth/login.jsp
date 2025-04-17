<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 17/3/2025
  Time: 6:39 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
    <%--    <script src="https://apis.google.com/js/platform.js" async defer></script>--%>
    <%--    <meta name="google-signin-scope" content="profile email">--%>
    <%--    <meta name="google-signin-client_id"--%>
    <%--          content="1092313228817-qhcl8pag3fgd19hfck31ailnc08ipncm.apps.googleusercontent.com">--%>
    <title>Login</title>

</head>
<body>
<form action="login" method="post">
    <%--    <div class="imgcontainer">--%>
    <%--        <img src="img_avatar2.png" alt="Avatar" class="avatar">--%>
    <%--    </div>--%>
    <%--    <div class="g-signin2" data-onsuccess="onSignIn"></div>--%>
    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/_03_final_project_war_exploded/auth/callback&response_type=code&client_id=1092313228817-qhcl8pag3fgd19hfck31ailnc08ipncm.apps.googleusercontent.com&approval_prompt=force">Login
        With Gmail</a>
    <a href="https://accounts.google.com/o/oauth2/auth?scope=openid profile email&redirect_uri=http://localhost:8080/_03_final_project_war_exploded/auth/callback&response_type=code&client_id=1092313228817-qhcl8pag3fgd19hfck31ailnc08ipncm.apps.googleusercontent.com&approval_prompt=force">Login
        With Gmail</a>
    <div class="container">
        <label for="uname"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="uname" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>
        <a href="https://accounts.google.com/o/oauth2/auth?
	scope=email&redirect_uri=http://localhost:8080/_03_final_project_war_exploded/auth/callback&response_type=code&client_id=1092313228817-qhcl8pag3fgd19hfck31ailnc08ipncm.apps.googleusercontent.com&approval_prompt=force">
            <button type="submit">Login</button>
            <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>
        </a>
    </div>
</form>
<div class="container-xxl">
    <div class="row vh-100 d-flex justify-content-center">
        <div class="col-12 align-self-center">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-4 mx-auto">
                        <div class="card">
                            <div class="card-body p-0 bg-black auth-header-box rounded-top">
                                <div class="text-center p-3">
                                    <a href="index.html" class="logo logo-admin">
                                        <img src="assets/images/logo-sm.png" height="50" alt="logo"
                                             class="auth-logo">
                                    </a>
                                    <h4 class="mt-3 mb-1 fw-semibold text-white fs-18">Let's Get Started
                                        Dastone</h4>
                                    <p class="text-muted fw-medium mb-0">Sign in to continue to Dastone.</p>
                                </div>
                            </div>
                            <div class="card-body">
                                <form class="my-4" action="https://mannatthemes.com/dastone-bs5/default/index.html">
                                    <div class="form-group mb-2">
                                        <label class="form-label" for="username">Username</label>
                                        <input type="text" class="form-control" id="username" name="username"
                                               placeholder="Enter username">
                                    </div><!--end form-group-->

                                    <div class="form-group">
                                        <label class="form-label" for="userpassword">Password</label>
                                        <input type="password" class="form-control" name="password"
                                               id="userpassword" placeholder="Enter password">
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
                                                <button class="btn btn-primary" type="button">Log In <i
                                                        class="fas fa-sign-in-alt ms-1"></i></button>
                                            </div>
                                        </div><!--end col-->
                                    </div> <!--end form-group-->
                                </form><!--end form-->
                                <div class="text-center  mb-2">
                                    <p class="text-muted">Don't have an account ? <a href="auth-register.html"
                                                                                     class="text-primary ms-2">Free
                                        Resister</a></p>
                                    <h6 class="px-3 d-inline-block">Or Login With</h6>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <a href="#"
                                       class="d-flex justify-content-center align-items-center thumb-md bg-blue-subtle text-blue rounded-circle me-2">
                                        <i class="fab fa-facebook align-self-center"></i>
                                    </a>
                                    <a href="#"
                                       class="d-flex justify-content-center align-items-center thumb-md bg-info-subtle text-info rounded-circle me-2">
                                        <i class="fab fa-twitter align-self-center"></i>
                                    </a>
                                    <a href="#"
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
    </div><!--end row-->
</div><!-- c
</form>
</body>
</html>
