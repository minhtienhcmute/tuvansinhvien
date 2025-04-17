<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Questions with JSP and Bootstrap</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for minor adjustments -->
    <style>
        .question-card {
            margin-bottom: 20px;
        }
        .tag {
            background-color: #e0e0e0;
            padding: 5px 10px;
            border-radius: 15px;
            margin-right: 5px;
            font-size: 0.9em;
        }
        .status-waiting {
            background-color: #ffc107; /* Yellow for Waiting */
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9em;
        }
        .status-accepted {
            background-color: #28a745; /* Green for Accepted */
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9em;
        }
        .status-rejected {
            background-color: #dc3545; /* Red for Rejected */
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9em;
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
            <a class="nav-link" href="editprofile.jsp">Edit profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="#">My questions</a>
        </li>
    </ul>

    <!-- Questions List -->
    <div class="card question-card">
        <div class="card-body">
            <div class="d-flex justify-content-between">
                <h5 class="card-title">10 Kids Unaware of Their Halloween Costume</h5>
                <span class="text-muted">23 hour ago</span>
            </div>
            <p class="card-text">
                I'm trying to integrate Prisma with Nuxt 3 but facing issues. I'm trying to integrate Prisma with Nuxt 3 b
            </p>
            <div class="mb-2">
                <span class="tag">Không có khi</span>
                <span class="tag">Anh văn đầu ra</span>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <span class="text-muted">5 Vote</span>
                    <span class="text-muted ms-3">256 views</span>
                </div>
                <div class="d-flex align-items-center">
                    <span class="status-waiting me-2">Đang đợi</span>
                    <a href="questionpage.jsp" class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </div>

    <div class="card question-card">
        <div class="card-body">
            <div class="d-flex justify-content-between">
                <h5 class="card-title">10 Kids Unaware of Their Halloween Costume</h5>
                <span class="text-muted">23/02/2025 15:30PM</span>
            </div>
            <p class="card-text">
                I'm trying to integrate Prisma with Nuxt 3 but facing issues. I'm trying to integrate Prisma with Nuxt 3 b
            </p>
            <div class="mb-2">
                <span class="tag">Không có khi</span>
                <span class="tag">Anh văn đầu ra</span>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <span class="text-muted">5 Vote</span>
                    <span class="text-muted ms-3">256 views</span>
                </div>
                <div class="d-flex align-items-center">
                    <span class="status-accepted me-2">Đã trả lời</span>
                    <a href="questionpage.jsp" class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </div>

    <div class="card question-card">
        <div class="card-body">
            <div class="d-flex justify-content-between">
                <h5 class="card-title">10 Kids Unaware of Their Halloween Costume</h5>
                <span class="text-muted">24/02/2025 10:00AM</span>
            </div>
            <p class="card-text">
                I'm trying to integrate Prisma with Nuxt 3 but facing issues. I'm trying to integrate Prisma with Nuxt 3 b
            </p>
            <div class="mb-2">
                <span class="tag">Không có khi</span>
                <span class="tag">Anh văn đầu ra</span>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <span class="text-muted">5 Vote</span>
                    <span class="text-muted ms-3">256 views</span>
                </div>
                <div class="d-flex align-items-center">
                    <span class="status-rejected me-2">Đã từ chối</span>
                    <a href="questionpage.jsp" class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include the Footer -->
<jsp:include page="client-footer.jsp"/>

<c:forEach var="question" items="${questions}">
    <div class="card question-card">
        <div class="card-body">
            <div class="d-flex justify-content-between">
                <h5 class="card-title">${question.title}</h5>
                <span class="text-muted">${question.timestamp}</span>
            </div>
            <p class="card-text">${question.description}</p>
            <div class="mb-2">
                <c:forEach var="tag" items="${question.tags}">
                    <span class="tag">${tag}</span>
                </c:forEach>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <span class="text-muted">${question.votes} Vote</span>
                    <span class="text-muted ms-3">${question.views} views</span>
                </div>
                <div class="d-flex align-items-center">
                    <span class="status-${question.status} me-2">
                        <c:choose>
                            <c:when test="${question.status == 'waiting'}">Đang đợi</c:when>
                            <c:when test="${question.status == 'accepted'}">Đã trả lời</c:when>
                            <c:when test="${question.status == 'rejected'}">Đã từ chối</c:when>
                        </c:choose>
                    </span>
                    <a href="questionpage.jsp?id=${question.id}" class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>