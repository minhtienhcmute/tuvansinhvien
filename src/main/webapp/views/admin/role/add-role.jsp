<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 12/4/2025
  Time: 9:01 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/views/partials/message-box.jsp"></jsp:include>
<form id="permissionForm" action="role?action=add" method="post">
    <%--    <div class="row">--%>
    <input type="hidden" name="action" value="add"/> <!-- hoặc value="add" -->
    <%--     <input type="hidden" name="id" value="${role.id}" /> <!-- chỉ dùng nếu là edit -->--%>
    <div class="mb-3 row">
        <label for="horizontalInput1" class="col-sm-2 col-form-label">Name</label>
        <div class="col-sm-10">
            <input required name="name" type="text" class="form-control" id="horizontalInput1"
                   placeholder="Enter name role">
        </div>
    </div>
    <div class="mb-3 row">
        <div class="table-responsive">
            <table class="table mb-0">
                <thead class="table-light">
                <tr>
                    <th>Module</th>
                    <th>Authorization</th>
                    <th>Check All</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="entry" items="${groupedPermissions}">
                    <tr>
                        <td><label class="col-form-label form-label control-label">${entry.key}</label></td>
                        <td>
                            <c:forEach var="perm" items="${entry.value}">

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" name="permission[]" type="checkbox"
                                           id="inlineCheckbox-${perm.id}" value="${perm.id}">
                                    <label class="form-check-label"
                                           for="inlineCheckbox-${perm.id}">${perm.action}</label>
                                </div>
                            </c:forEach>
                        </td>
                        <td>
                            <input class="form-check-input" name="permission[]" type="checkbox"
                                   id="inlineCheckbox">
                            <label class="form-check-label"
                                   for="inlineCheckbox">Check all</label>
                        </td>
                    </tr>

                </c:forEach>

                <%--                <tr>--%>
                <%--                    <th scope="row">5</th>--%>
                <%--                    <td>Jacob</td>--%>
                <%--                    <td>XYZ@Example.com</td>--%>
                <%--                    <td><span class="badge bg-transparent border border-warning text-warning">Personal</span></td>--%>
                <%--                </tr>--%>
                </tbody>
            </table><!--end /table-->
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 ms-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="role" class="btn btn-danger">Cancel</a>
        </div>
    </div>


</form>

<script>

    $('#btnSave').click(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/role?action=add',
            method: 'POST',
            data: $('#permissionForm').serialize(),
            success: function (response) {
                if (response.status === 'success') {
                    alert(response.message);
                    $('#formModal').modal('hide');
                    // reload lại table chẳng hạn
                } else {
                    console.log(response.message);
                    // $('#errorBox').text(response.message).show();
                }
            },
            error: function () {
                // $('#errorBox').text('Có lỗi xảy ra, vui lòng thử lại.').show();
            }
        });
    })


</script>
