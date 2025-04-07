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
    </div>

    <%--    <div class="container" style="background-color:#f1f1f1">--%>
    <%--        <button type="button" class="cancelbtn">Cancel</button>--%>
    <%--        <span class="psw">Forgot <a href="#">password?</a></span>--%>
    <%--    </div>--%>
</form>
</body>
</html>
