<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile with JSP and Bootstrap</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS for minor adjustments -->
  <style>
    .avatar-section {
      text-align: center;
      margin-bottom: 20px;
    }
    .avatar-placeholder {
      width: 100px;
      height: 100px;
      border: 2px dashed #ccc;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 10px;
      font-size: 1.5rem;
      color: #ccc;
    }
    .form-label {
      font-weight: bold;
    }
  </style>
</head>
<body>
<!-- Include the Navigation Bar -->
<jsp:include page="client-navbar.jsp"/>

<!-- Main Content -->
<div class="container mt-4">
  <!-- Tabs -->
  <ul class="nav nav-tabs mb-3">
    <li class="nav-item">
      <a class="nav-link active" href="#">Edit profile</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">My questions</a>
    </li>
  </ul>

  <!-- Edit Profile Form -->
  <div class="card">
    <div class="card-body">
      <form action="updateProfile" method="post" enctype="multipart/form-data">
        <!-- Avatar Upload -->
        <div class="avatar-section">
          <div class="avatar-placeholder">✖</div>
          <label for="avatar" class="btn btn-outline-secondary">
            <span>Upload avatar</span>
            <input type="file" id="avatar" name="avatar" accept="image/*" style="display: none;">
          </label>
        </div>

        <!-- Form Fields -->
        <div class="mb-3">
          <label for="username" class="form-label">Username</label>
          <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
        </div>

        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
        </div>

        <div class="mb-3">
          <label for="fullName" class="form-label">Full Name</label>
          <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name">
        </div>

        <div class="mb-3">
          <label for="bio" class="form-label">Bio</label>
          <textarea class="form-control" id="bio" name="bio" rows="3" placeholder="Tell us about yourself"></textarea>
        </div>

        <!-- Save Button -->
        <div class="text-end">
          <button type="submit" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Include the Footer -->
<jsp:include page="client-footer.jsp"/>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>