<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 12/4/2025
  Time: 9:01 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/views/partials/message-box.jsp"></jsp:include>
<div class="row">
    <div class="col-md-9">
        <div class="card">
            <div class="card-body d-flex">
                <div class="row mt-3">
                    <!-- VOTE + AVATAR -->
                    <div class="col-1 align-items-center d-flex flex-column gap-2">
                        <jsp:include page="/views/partials/user-avatar.jsp">
                            <jsp:param name="avatarUrl" value="${question.user.avatar}"/>
                        </jsp:include>
                        <small class="text-muted text-center">${question.user.name}</small>

                        <%--        <div class="my-2">--%>
                        <%--            <i class="bi bi-caret-up-fill fs-4 text-secondary"></i><br/>--%>
                        <%--            <span class="fw-bold">${question.vote_cnt}</span><br/>--%>
                        <%--            <i class="bi bi-caret-down-fill fs-4 text-secondary"></i>--%>
                        <%--        </div>--%>
                        <%--        <small class="text-muted">vote</small>--%>
                    </div>

                    <!-- NỘI DUNG CHÍNH -->
                    <div class="col-md-11">
                        <div class="row d-flex">
                            <div class="col-8">
                                <h5 class="mb-2 flex-grow-1 me-3 fw-bold">${question.title}</h5>
                                <div class="">
                                    <span class="badge bg-primary">${question.category.name}</span>
                                    <span class="badge bg-info">${question.department.name}</span>
                                </div>

                            </div>
                            <div class="col-4 row  small text-muted">
                                <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Người gửi:
                        </span>
                                    <span class="col-7 text-dark text-start">
                                        ${question.user.name}
                                    </span>
                                </div>

                                <div class="row text-end">
                           <span class="col-5 fw-semibold">
                            Email:
                        </span>
                                    <span class="col-7 text-dark text-start"><a
                                            href="mailto:${question.user.email}">${question.user.email}</a></span>
                                </div>


                                <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Ngày gửi:
                        </span>
                                    <span class="col-7 text-start">
                        <fmt:formatDate value="${question.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/>

                    </span>
                                </div>
                                <div class="row text-end">
                                    <span class="col-5 text-end fw-semibold">Trạng thái:</span>
                                    <c:set var="color"
                                           value="${question.status == 0 ? 'warning' : question.status == 1 ? 'success' : 'danger'}"></c:set>
                                    <c:set var="statusText"
                                           value="${question.status == 0 ? 'Waiting answer' : question.status == 1 ? 'Answered' : 'Rejected'}"></c:set>
                                    <span class="col-7 text-${color} fw-medium text-start">
                                        ${statusText}
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- Nội dung câu hỏi -->
                        <div class="mt-2">
                            ${question.content}
                        </div>

                        <!-- Hành động -->
                        <hr>
                        <div class="d-flex justify-content-between gap-2">
                            <div class="d-flex gap-5 text-muted">
                                <div>
                                    <i class="iconoir-eye me-1"></i> <!-- icon mắt -->
                                    <small class="text-muted">${question.views} lượt xem</small>
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty comments}">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Danh sách câu trả lời:</h4>
                </div>
                <div class="card-body">
                    <c:forEach var="comment" items="${comments}">

                        <div class="row mb-3">
                            <div class="col-md-1 align-items-center d-flex flex-column gap-2 text-center">
                                <jsp:include page="/views/partials/user-avatar.jsp">
                                    <jsp:param name="avatarUrl" value="${comment.user.avatar}"/>
                                </jsp:include>
                                <small class="text-muted text-center">${comment.user.name}</small>
                                    <%--                        <div class="my-2">--%>
                                    <%--                            <i class="bi bi-caret-up-fill fs-4 text-secondary"></i><br/>--%>
                                    <%--                            <span class="fw-bold">${comment.vote_cnt}</span><br/>--%>
                                    <%--                            <i class="bi bi-caret-down-fill fs-4 text-secondary"></i>--%>
                                    <%--                        </div>--%>
                                    <%--                        <small class="text-muted">vote</small>--%>

                            </div>

                            <!-- NỘI DUNG CHÍNH -->
                            <div class="col-md-11">
                                <div class="row d-flex">
                                    <div class="col-8">
                                        <div class="bg-light rounded ms-n2 bg-light-alt p-3">
                                                ${comment.content}
                                        </div>
                                    </div>
                                    <div class="col-4 small text-muted">
                                        <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Người trả lời:
                        </span>
                                            <span class="col-7 text-dark text-start">
                                                    ${comment.user.name}
                                            </span>
                                        </div>

                                        <div class="row text-end">
                           <span class="col-5 fw-semibold">
                            Email:
                        </span>
                                            <span class="col-7 text-dark text-start"><a
                                                    href="mailto:${comment.user.email}">${comment.user.email}</a></span>
                                        </div>


                                        <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Ngày trả lời:
                        </span>
                                            <span class="col-7 text-start">
                                        <fmt:formatDate value="${comment.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </span>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </div>
            </div>

        </c:if>
    </div>
    <div class="col-md-3 ">
        <a href="${pageContext.request.contextPath}/question?action=add" class="btn btn-success w-100 mb-3"
           type="button">+
            Ask a question</a>
        <div>
            <c:set var="queryStrForDepart" value=""/>
            <c:if test="${not empty param.category}">
                <c:set var="queryStrForDepart" value="${queryStrForDepart}&category=${fn:escapeXml(param.category)}"/>
            </c:if>
            <c:if test="${not empty param.tab}">
                <c:set var="queryStrForDepart" value="${queryStrForDepart}&tab=${fn:escapeXml(param.tab)}"/>
            </c:if>

            <c:if test="${not empty param.keyword}">
                <c:set var="queryStrForDepart" value="${queryStrForDepart}&keyword=${fn:escapeXml(param.keyword)}"/>
            </c:if>

            <c:if test="${not empty param.page}">
                <c:set var="queryStrForDepart" value="${queryStrForDepart}&page=1"/>
            </c:if>
            <c:if test="${not empty param.perPage}">
                <c:set var="queryStrForDepart" value="${queryStrForDepart}&perPage=${fn:escapeXml(param.perPage)}"/>
            </c:if>


            <div class="list-group" id="list-tab" role="tablist">
                <a href="${pageContext.request.contextPath}?department=-1${queryStrForDepart}"
                   class="list-group-item list-group-item-action ${param.department_id == null ? 'active' : ''}"
                   aria-disabled="true" }>
                    All
                </a>
                <c:forEach var="department" items="${departments}">
                    <c:set var="isSelected" value="false"/>
                    <c:if test="${param.department_id == department.id}">
                        <c:set var="isSelected" value="true"/>
                    </c:if>
                    <a href="${pageContext.request.contextPath}?department_id=${department.id}${queryStrForDepart}"
                       class="list-group-item list-group-item-action ${isSelected ? 'active' : ''}">
                            ${department.name}
                    </a>
                </c:forEach>
            </div>
        </div>


    </div>

</div>




