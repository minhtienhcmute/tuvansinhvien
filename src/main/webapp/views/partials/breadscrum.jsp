<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box d-md-flex justify-content-md-between align-items-center">
            <h4 class="page-title">${breadcrumbTitle}</h4>
            <div class="">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/admin">Trang chủ</a>
                    </li>
                    <c:forEach var="item" items="${breadcrumbItems}" varStatus="status">
                        <li class="breadcrumb-item ${status.last ? 'active' : ''}">
                            <c:choose>
                                <c:when test="${not empty item.url && !status.last}">
                                    <a href="${pageContext.request.contextPath}${item.url}">${item.label}</a>
                                </c:when>
                                <c:otherwise>
                                    ${item.label}
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:forEach>
                </ol>
            </div>
        </div>
    </div>
</div>
