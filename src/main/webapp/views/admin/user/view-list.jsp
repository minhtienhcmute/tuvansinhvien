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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/views/partials/message-box.jsp"></jsp:include>

<div class="table-responsive">
    <table class="table datatable" id="datatable_2">
        <thead class="table-light">
        <tr>
            <th>Email</th>
            <th>User name</th>
            <th>Type</th>
            <th>Login type</th>
            <th>Role</th>
            <th>Department</th>
            <th>Created at</th>
            <th class="text-end">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.email}</td>
                <td>${user.name}</td>
                <td>${user.type == 1 ? 'Admin' : 'Client'}</td> <!-- Giả sử type = 1 là Admin, còn lại là User -->
                <td>${user.google_id != null ? 'Google Login' : 'Regular Login'}</td>

                <!-- Hiển thị Role với Chip -->
                <td>
                    <c:forEach var="role" items="${user.roles}">
                        <span class="badge bg-primary ">${role.name}</span>
                    </c:forEach>
                </td>

                <!-- Hiển thị Department với Chip -->
                <td>
                    <c:forEach var="dept" items="${user.departments}">
                        <span class="badge bg-info">${dept.name}</span>
                    </c:forEach>
                </td>

                <!-- Định dạng Created at -->
                <td>${fn:substring(user.created_at, 0, 10)} ${fn:substring(user.created_at, 11, 16)}</td>
                <!-- Giả sử created_at có dạng YYYY-MM-DD HH:MM:SS -->

                <td class="text-end">
                        <%--                    <a href="user?id=${user.id}"><i class="las la-info-circle text-secondary fs-18"></i></a>--%>
                    <a href="user?action=edit&id=${user.id}"><i class="las la-pen text-secondary fs-18"></i></a>
                    <form action="user?action=delete" method="post" style="display: inline;"
                          id="deleteForm-${user.id}">
                        <input type="hidden" name="id" value="${user.id}">
                        <button type="button" class="btn btn-link p-0" onclick="confirmDelete(${user.id})">
                            <i class="las la-trash-alt text-secondary fs-18"></i>
                        </button>
                    </form>
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
    function confirmDelete(userId) {
        // Hiển thị hộp thoại confirm
        if (confirm("Bạn có chắc chắn muốn xóa user này không?")) {
            // Nếu người dùng chọn OK, submit form
            document.getElementById("deleteForm-" + userId).submit();
        }
    }
</script>