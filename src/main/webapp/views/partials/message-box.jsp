<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 13/4/2025
  Time: 10:20 am
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty param.success}">
    <div class="mb-3 alert alert-success alert-dismissible fade show shadow-sm border-theme-white-2" role="alert">
        <div class="d-inline-flex justify-content-center align-items-center thumb-xs bg-success rounded-circle mx-auto me-1">
            <i class="fas fa-check align-self-center mb-0 text-white "></i>
        </div>
        <c:out value="${param.success}"/>
            <%--            ${param.success}--%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<!-- Error message -->
<c:if test="${not empty param.error}">
    <div class="mb-3 alert alert-danger alert-dismissible fade show shadow-sm border-theme-white-2" role="alert">
        <div class="d-inline-flex justify-content-center align-items-center thumb-xs bg-danger rounded-circle mx-auto me-1">
            <i class="fas fa-xmark align-self-center mb-0 text-white "></i>
        </div>
        <c:out value="${param.error}"/>
            <%--            ${param.param}--%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
