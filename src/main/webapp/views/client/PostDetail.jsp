<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Question Page with JSP and Bootstrap</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS for minor adjustments -->
  <style>
    .question-card {
      margin-bottom: 20px;
    }
    .vote-section {
      text-align: center;
      padding: 10px;
    }
    .tag {
      background-color: #e0e0e0;
      padding: 5px 10px;
      border-radius: 15px;
      margin-right: 5px;
      font-size: 0.9em;
    }
    .sidebar {
      padding: 0px 20px 20px 20px;
    }
    .halloween-bg {
      background-image: url('https://example.com/halloween-background.jpg'); /* Replace with actual image URL */
      background-size: cover;
      background-position: center;
      height: 300px;
      color: white;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 20px;
      margin-top: 20px;
    }
    .halloween-bg h5 {
      margin: 0;
    }
    .halloween-bg ul {
      list-style: none;
      padding: 0;
    }
    .halloween-bg ul li {
      margin-bottom: 5px;
    }
  </style>
</head>
<body>
<!-- Include the Navigation Bar -->
<jsp:include page="client-navbar.jsp"/>

<!-- Main Content -->
<div class="container mt-4">
  <div class="row">
    <!-- Question Post -->
    <div class="col-md-9">
      <div class="card question-card">
        <div class="card-body d-flex">
          <div class="vote-section me-3">
            <h5>5</h5>
            <p class="text-muted">vote</p>
          </div>
          <div class="flex-grow-1">
            <h5 class="card-title">10 Kids Unaware of Their Halloween Costume</h5>
            <p class="card-text">
              DONEC sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget tortor risus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; DONEC velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. DONEC sollicitudin molestie malesuada.
              <br><br>
              VESTIBULUM ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; DONEC velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
              <br><br>
              VIVAMUS magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Sed porttitor lectus nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. VIVAMUS suscipit tortor eget felis porttitor volutpat. Quisque velit nisi, pretium ut lacinia in.
            </p>
            <div class="mb-2">
              <span class="tag">Không có khi</span>
              <span class="tag">Anh văn đầu ra</span>
            </div>
            <div class="d-flex justify-content-between">
              <span class="text-muted">5 vote • 256 views</span>
              <div>
                <button class="btn btn-outline-primary btn-sm me-2">Nhóm cũ khi</button>
                <button class="btn btn-outline-primary btn-sm">Anh văn đầu ra</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Answer Section -->
      <div class="card question-card">
        <div class="card-body d-flex">
          <div class="vote-section me-3">
            <h5>5</h5>
            <p class="text-muted">vote</p>
          </div>
          <div class="flex-grow-1">
            <h5 class="card-title">Trả lời của hội</h5>
            <p class="card-text">
              <strong>Võ Minh Thiên</strong> • Posted on: 20 Nov @ 9:45am
              <br><br>
              DONEC sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget tortor risus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; DONEC velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. DONEC sollicitudin molestie malesuada.
              <br><br>
              VESTIBULUM ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; DONEC velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
              <br><br>
              VIVAMUS magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Sed porttitor lectus nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. VIVAMUS suscipit tortor eget felis porttitor volutpat. Quisque velit nisi, pretium ut lacinia in.
            </p>
            <div class="mb-2">
              <span class="tag bg-primary text-white">API Means</span>
              <span class="text-muted">Faster good consectetur sed, convallis at tellus. Curabitur aliquet quam id dooooooo dweeds. Curabitur aliquet quam id</span>
            </div>
            <div class="d-flex justify-content-between">
              <span class="text-muted">5 vote • 256 views</span>
              <div>
                <button class="btn btn-outline-primary btn-sm me-2">Nhóm cũ khi</button>
                <button class="btn btn-outline-primary btn-sm">Anh văn đầu ra</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Sidebar -->
    <div class="col-md-3 sidebar">
      <!-- Ask a Question Button -->
      <div class="mb-3">
        <a href="#" class="btn btn-primary w-100">+ Ask a question</a>
      </div>

      <!-- Categories -->
      <div class="mb-4">
        <h5>Categories</h5>
        <select class="form-select">
          <option>Introduction</option>
          <option selected>Lookup Order</option>
          <option>List Page Templates</option>
          <option>Homepage Templates</option>
          <option>Section Templates</option>
          <option>Single Page Templates</option>
          <option>Content Templates</option>
        </select>
      </div>

      <!-- Related Questions -->
      <div>
        <h5>Câu hỏi liên quan</h5>
        <ul class="list-group">
          <li class="list-group-item">Item One</li>
          <li class="list-group-item">Item Two</li>
          <li class="list-group-item">Item Three</li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- Halloween Background Section -->
<div class="halloween-bg">
  <div>
    <h5>LOOKER: 4,200+ LOVE</h5>
  </div>
  <div>
    <h5>OOH HAL IDN goan</h5>
    <ul>
      <li>Farm Care</li>
      <li>Tom Tee</li>
      <li>Tona Tacos</li>
    </ul>
  </div>
</div>

<!-- Include the Footer -->
<jsp:include page="client-footer.jsp"/>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>