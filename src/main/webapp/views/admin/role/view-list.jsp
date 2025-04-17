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
<jsp:include page="/views/partials/message-box.jsp"></jsp:include>
<div class="table-responsive">
    <table class="table datatable" id="datatable_2">
        <thead class="table-light">
        <tr>
            <th>Role name</th>
            <th class="text-end">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${roles}">
            <tr>
                <td>${role.name}</td>
                <td class="text-end">
                    <a href="role?id=${role.id}"><i class="las la-info-circle text-secondary fs-18"></i></a>
                    <a href="role?action=edit&id=${role.id}"><i class="las la-pen text-secondary fs-18"></i></a>
                    <form action="role?action=delete&id=${role.id}" method="post" style="display: inline;"
                          id="deleteForm-${role.id}">

                        <button type="button" class="btn btn-link p-0" onclick="confirmDelete(${role.id})">
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
    function confirmDelete(roleId) {
        // Hiển thị hộp thoại confirm
        if (confirm("Bạn có chắc chắn muốn xóa role này không?")) {
            // Nếu người dùng chọn OK, submit form
            document.getElementById("deleteForm-" + roleId).submit();
        }
    }
</script>