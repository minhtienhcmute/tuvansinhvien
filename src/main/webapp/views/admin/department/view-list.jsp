<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 13/4/2025
  Time: 9:21 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/partials/message-box.jsp"></jsp:include>

<div class="table-responsive">
    <table class="table datatable" id="datatable_2">
        <thead class="table-light">
        <tr>
            <th>Department name</th>
            <th>Description</th>
            <th>Created at</th>
            <th>Updated at</th>
            <c:if test="${canEdit || canDelete}">
                <th class="text-center">Action</th>
            </c:if>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="department" items="${departments}">
            <tr>

                <td>${department.name}</td>
                <td>${department.description}</td>
                <td><fmt:formatDate value="${department.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${department.updated_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                <c:if test="${canEdit || canDelete}">
                    <td class="text-center">
                        <c:if test="${canEdit}">
                            <a href="department?action=edit&id=${department.id}"><i
                                    class="las la-pen text-secondary fs-18"></i>
                            </a>
                        </c:if>
                        <c:if test="${canDelete}">
                            <form action="department?action=delete" method="post"
                                  id="deleteForm-${department.id}">
                                <input type="hidden" name="csrfToken" value="${csrfToken}">

                                <input type="hidden" name="id" value="${department.id}">
                                <button type="button" class="btn btn-link p-0"
                                        onclick="confirmDelete(${department.id})">
                                    <i class="las la-trash-alt text-secondary fs-18"></i>
                                </button>
                            </form>
                        </c:if>
                    </td>
                </c:if>
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
    function confirmDelete(userId) {
        // Hiển thị hộp thoại confirm
        if (confirm("Bạn có chắc chắn muốn xóa phòng ban này không?")) {
            // Nếu người dùng chọn OK, submit form
            document.getElementById("deleteForm-" + userId).submit();
        }
    }
</script>