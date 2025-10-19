<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 13/4/2025
  Time: 9:21 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/views/partials/message-box.jsp"></jsp:include>
<div class="mb-3">

    <form action="${pageContext.request.contextPath}/admin/question" method="GET">
        <%--        <c:set var="status" value="0"/>--%>

        <%--        <c:if test="${(param.status != '0' && param.status != null )}">--%>
        <%--            <input value="${status}" type="hidden" name="status" class="form-control">--%>
        <%--        </c:if>--%>
        <%--        <c:if test="${param.department_id != null}">--%>
        <%--            <input value="${param.department_id}" type="hidden" name="department_id" class="form-control">--%>
        <%--        </c:if>--%>
        <%--        <input value="1" type="hidden" name="page" class="form-control">--%>
        <%--        <input value="${empty param.perPage ? 5 : param.perPage}" type="hidden" name="perPage" class="form-control">--%>

        <div class="row">
            <div class="col-3">
                <select class="form-select" id="status" name="status">

                    <option ${(param.status == '0' || param.status == null )? 'selected' : ''} value="0" selected>
                        Waiting answer
                    </option>
                    <option  ${param.status == '1' ? 'selected' : ''} value="1">Answered</option>
                    <option  ${param.status == '2' ? 'selected' : ''} value="2">Rejected</option>
                </select>
            </div>
            <div class="col-3">
                <select class="form-select" id="department" name="department">
                    <option value="" selected>-- All department --</option>

                    <c:forEach var="department" items="${departments}">
                        <c:set var="isSelected" value="false"/>
                        <c:if test="${param.department == department.id}">
                            <c:set var="isSelected" value="true"/>
                        </c:if>
                        <option ${isSelected ? 'selected' : ''}
                                value="${department.id}">${department.name}</option>
                    </c:forEach>
                </select>

            </div>

            <div class="col-3">
                <select class="form-select" id="category" name="category">
                    <option value="" selected>-- All category --</option>

                    <c:forEach var="category" items="${categories}">
                        <c:set var="isSelected" value="false"/>
                        <c:if test="${param.category == category.id}">
                            <c:set var="isSelected" value="true"/>
                        </c:if>
                        <option ${isSelected ? 'selected' : ''}
                                value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>

            </div>
            <div class="col-3">
                <button type="submit" class="btn bg-primary-subtle text-primary  d-flex  align-items-center "><i
                        class="iconoir-filter-alt me-1"></i> Filter
                </button>
            </div>
        </div>
    </form>
</div>
<div class="table-responsive">
    <table class="table datatable" id="datatable_2">
        <thead class="table-light">
        <tr>
            <th>Avatar</th>
            <%--            <th>Asked By</th>--%>
            <th>Email</th>
            <th>Title</th>
            <th>Department</th>
            <th>Category</th>
            <th>Status</th>
            <th>Created at</th>
            <th>Updated at</th>
            <th class="text-end">Action</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="question" items="${questions}">
            <tr>
                <td>
                    <jsp:include page="/views/partials/user-avatar.jsp">
                        <jsp:param name="avatarUrl" value="${question.user.avatar}"/>
                    </jsp:include>


                        <%--                    <img src="${pageContext.request.contextPath}/${avatarUrl}" alt="avatar-${question.user.name}"--%>
                        <%--                         class="thumb-md d-inline rounded-circle me-1">--%>
                        <%--                    <p class="d-inline-block align-middle mb-0">--%>
                        <%--                        <span class="font-13 fw-medium">${question.user.name}</span>--%>
                        <%--                    </p>--%>
                </td>
                    <%--                <td class="ps-0">${question.user.name}--%>
                    <%--                <td>${question.user.email}</td>--%>
                    <%--                <td>${question.title}</td>--%>


                <td><c:out value="${question.user.email}" default="-"/></td>
                <td><c:out value="${question.title}" default="(no title)"/></td>
                <td>
                    <span class="badge bg-primary ">${question.department.name}</span>
                </td>
                <td>
                    <span class="badge bg-info">${question.category.name}</span>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${question.status == 0}">
                        <span class="badge bg-warning-subtle text-warning">
                            Waiting Answer
                        </span>
                        </c:when>
                        <c:when test="${question.status == 1}">
                            <span class="badge bg-success-subtle text-success">Answered</span>
                        </c:when>
                        <c:when test="${question.status == 2}">
                        <span class="badge bg-danger-subtle text-danger">
                           Rejected
                        </span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary">Unknown</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <td><fmt:formatDate value="${question.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${question.updated_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td class="text-center">
                    <a href="question?id=${question.id}"><i class="las la-info-circle text-secondary fs-18"></i></a>
                        <%--                    <a href="user?action=edit&id=${user.id}"><i class="las la-pen text-secondary fs-18"></i></a>--%>
                        <%--                    <form action="user?action=delete" method="post" style="display: inline;"--%>
                        <%--                          id="deleteForm-${user.id}">--%>
                        <%--                        <input type="hidden" name="id" value="${user.id}">--%>
                        <%--                        <button type="button" class="btn btn-link p-0" onclick="confirmDelete(${user.id})">--%>
                        <%--                            <i class="las la-trash-alt text-secondary fs-18"></i>--%>
                        <%--                        </button>--%>
                        <%--                    </form>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%--                    <button type="button" class="btn btn-sm btn-primary csv">Export CSV</button>--%>
    <%--                    <button type="button" class="btn btn-sm btn-primary sql">Export SQL</button>--%>
    <%--                    <button type="button" class="btn btn-sm btn-primary txt">Export TXT</button>--%>
    <%--                    <button type="button" class="btn btn-sm btn-primary json">Export JSON</button>--%>
</div>

<script>

</script>