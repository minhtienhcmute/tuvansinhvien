<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <jsp:include page="/views/partials/message-box.jsp"></jsp:include>
    <div class="col-md-9  mb-3">
        <form action="${pageContext.request.contextPath}" method="GET">
            <c:set var="tab" value="recent"/>

            <c:if test="${param.tab != null && param.tab != 'recent'}">
                <c:set var="tab" value="${param.tab}"/>
            </c:if>
            <input value="${tab}" type="hidden" name="tab" class="form-control">
            <c:if test="${param.department_id != null}">
                <input value="${param.department_id}" type="hidden" name="department_id" class="form-control">
            </c:if>
            <%--            <c:if test="${param.page != null}">--%>
            <input value="1" type="hidden" name="page" class="form-control">
            <%--            </c:if>--%>
            <input value="${empty param.perPage ? 5 : param.perPage}" type="hidden" name="perPage" class="form-control">

            <div class="row">
                <div class="col-5">
                    <select class="form-select" id="category" name="category">
                        <option value="" selected>-- All category --</option>

                        <c:forEach var="category" items="${categories}">
                            ${param.category} - ${category.id}

                            <c:set var="isSelected" value="false"/>
                            <%--                            <c:set var="categoryInt" value="number ${param.category}"/>--%>
                            <fmt:parseNumber var="categoryInt" type="number" value="${param.category}"/>
                            <c:if test="${categoryInt == category.id}">
                                <c:set var="isSelected" value="true"/>
                            </c:if>
                            <option ${isSelected ? 'selected' : ''}
                                    value="${category.id}">${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-5">
                    <div class="input-group">
                        <%--                        <input value="${param.keyword}" type="text" name="keyword" class="form-control"--%>
                        <%--                               placeholder="Search...">--%>


                        <input
                                value="<c:out value='${param.keyword}' default=''/>"
                                type="text"
                                name="keyword"
                                class="form-control"
                                placeholder="Search..."
                        >
                    </div>

                </div>
                <div class="col-2">
                    <button type="submit" class="align-items-end btn btn-primary">Search</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-3 ">
        <a href="${pageContext.request.contextPath}/question?action=add" class="btn btn-success w-100 " type="button">+
            Ask a question</a>
    </div>
</div>
<div class="row">
    <div class="col-md-9">
        <ul class="nav nav-tabs mb-3 " role="tablist">
            <c:set var="queryStr" value=""/>
            <c:if test="${not empty param.category}">
                <c:set var="queryStr" value="${queryStr}&category=${fn:escapeXml(param.category)}"/>
            </c:if>
            <c:if test="${not empty param.department_id}">
                <c:set var="queryStr" value="${queryStr}&department_id=${fn:escapeXml(param.department_id)}"/>
            </c:if>
            <c:if test="${not empty param.keyword}">
                <c:set var="queryStr" value="${queryStr}&keyword=${fn:escapeXml(param.keyword)}"/>
            </c:if>
            <c:if test="${not empty param.page}">
                <c:set var="queryStr" value="${queryStr}&page=1"/>
            </c:if>
            <c:if test="${not empty param.perPage}">
                <c:set var="queryStr" value="${queryStr}&perPage=${fn:escapeXml(param.perPage)}"/>
            </c:if>

            <li class="nav-item">
                <c:set var="isActiveTabRecent" value="${param.tab == 'recent' || param.tab==null}"/>

                <a class="nav-link ${isActiveTabRecent ? 'active' : ''}"
                   href="${pageContext.request.contextPath}?tab=recent${queryStr}">Newest
                    questions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.tab == 'most_view' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}?tab=most_view${queryStr}">Most Viewed</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.tab == 'highest_vote' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}?tab=highest_vote${queryStr}">Highest
                    Vote</a>
            </li>
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link" href="#">Unanswered</a>--%>
            <%--            </li>--%>
        </ul>
        <div class="tab-content mb-3">
            <div class="tab-panel active" id="home" role="tabpanel">
                <c:if test="${empty questions}">
                    <div class="card">
                        <div class="mb-0 card-body border-dashed border-theme-color rounded">
                            <p class="mb-0 text-muted text-center">No data available</p>
                        </div>
                    </div>
                </c:if>
                <c:forEach var="question" items="${questions}">


                    <div class="card ">
                        <div class="card-body">
                                <%--                            <div class="vote-section me-3">--%>
                                <%--                                <h5>${question.vote_cnt}</h5>--%>
                                <%--                                <p class="text-muted">vote</p>--%>
                                <%--                            </div>--%>


                                <%--                            <div class="flex-grow-1">--%>
                                <%--                                <h5 class="card-title">${question.title}</h5>--%>
                                <%--                                <p class="card-text">${question.content}</p>--%>
                                <%--                                    &lt;%&ndash;                                <p class="card-text">&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;                                <c:out value="${question.content}" escapeXml="false"/>&ndash;%&gt;--%>
                                <%--                                    &lt;%&ndash;                                </p>&ndash;%&gt;--%>
                                <%--                                <div class="mb-2">--%>
                                <%--                                        &lt;%&ndash;                                    <span class="tag">${question.category.name}</span>&ndash;%&gt;--%>
                                <%--                                    <span class="badge bg-info">${question.category.name}</span>--%>
                                <%--                                </div>--%>
                                <%--                                <div class="d-flex justify-content-between">--%>
                                <%--                                    <span class="text-muted">256 views</span>--%>
                                <%--                                    <a href="#" class="text-primary">Xem chi tiết</a>--%>
                                <%--                                </div>--%>
                                <%--                            </div>--%>
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
                                            <h5 class="mb-2 flex-grow-1 me-3 fw-bold">
                                                    <%--                                                <a href="${pageContext.request.contextPath}/question?id=${question.id}">--%>
                                                    <%--                                                        ${question.title}--%>
                                                    <%--                                                </a>--%>
                                                <a href="${pageContext.request.contextPath}/question?id=<c:out value='${question.id}' />">
                                                    <c:out value="${question.title}"/>
                                                </a>
                                            </h5>
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
                                    <hr>
                                    <div class="d-flex justify-content-between gap-2">
                                        <div class="d-flex gap-5 text-muted">
                                            <div>
                                                <i class="iconoir-eye me-1"></i> <!-- icon mắt -->
                                                <small class="text-muted">${question.views} lượt xem</small>
                                            </div>


                                        </div>
                                        <div>
                                            <a href="${pageContext.request.contextPath}/question?id=${question.id}"
                                               class="text-primary">Xem chi tiết</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>

        <jsp:include page="/views/partials/client-pagination.jsp"></jsp:include>

    </div>
    <div class="col-md-3 ">
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