<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    <a class="nav-link" href="#">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Forum</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">My Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Office Hours</a>
                </li>
            </ul>
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="signInButton"
                >
                    Sign in
                </button>
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="signUpButton"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    Sign up
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                    <li><a class="dropdown-item" href="#">Setting</a></li>
                    <li><a class="dropdown-item" href="#">Admin dashboard</a></li>
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>