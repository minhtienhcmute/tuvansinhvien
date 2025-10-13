<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:choose>
    <c:when test="${not empty param.avatarUrl}">
        <c:set var="resolvedAvatarUrl" value="${param.avatarUrl}"/>
    </c:when>
    <c:otherwise>
        <c:set var="resolvedAvatarUrl"
               value="${pageContext.request.contextPath}/assets/images/users/avatar-default.png"/>
    </c:otherwise>
</c:choose>

<img src="${resolvedAvatarUrl}" width="40" alt="avatar-user"
     class="thumb-md d-inline rounded-circle me-1"/>
