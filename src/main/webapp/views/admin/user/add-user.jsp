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
<form id="permissionForm" action="user?action=add" method="post">
    <input type="hidden" name="csrfToken" value="${csrfToken}">

    <div class="row">
        <div class="col-lg-12">
            <div class="mb-3 row">
                <label for="email-input" class="col-sm-2 col-form-label text-end">Email</label>
                <div class="col-sm-10">
                    <input required pattern=".+@gmail\.com" name="email" class="form-control" type="email"
                           id="email-input">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="example-password-input" class="col-sm-2 col-form-label text-end">Password</label>
                <div class="col-sm-10">
                    <input required name="password" class="form-control" type="password" id="example-password-input">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="example-tel-input" class="col-sm-2 col-form-label text-end">Name</label>
                <div class="col-sm-10">
                    <input required class="form-control" type="tel" name="name" id="example-tel-input">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label text-end">Select user type</label>
                <div class="col-sm-10">
                    <select name="type" id="select-user-type" class="form-select"
                            aria-label="Example select with button addon">
                        <option value="0" selected>Choose...</option>
                        <option value="1">Admin</option>
                        <option value="0">Client</option>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label text-end">Select role</label>
                <div class="col-sm-10">
                    <select name="roles[]" class="form-select" multiple id="selectRole">
                        <option value="" data-clear="true">-- Không chọn vai trò nào --</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.id}">${role.name}</option>
                        </c:forEach>

                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label text-end">Select department</label>
                <div class="col-sm-10">
                    <select name="departments[]" class="form-select" multiple id="selectDepartment">
                        <option value="" data-clear="true">-- Không chọn phòng ban nào --</option>
                        <c:forEach var="department" items="${departments}">
                            <option value="${department.id}">${department.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

        </div>


    </div>
    <div class="row">
        <div class="col-sm-12 ms-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="user" class="btn btn-danger">Cancel</a>
        </div>
    </div>
</form>
<script>
    function clearOnSpecialOption(selectId) {
        const select = document.getElementById(selectId);
        select.addEventListener('change', function () {
            const selected = Array.from(select.selectedOptions);
            const clearOption = selected.find(opt => opt.dataset.clear === 'true');

            if (clearOption) {
                // Bỏ chọn tất cả
                Array.from(select.options).forEach(opt => opt.selected = false);
            }
        });
    }

    clearOnSpecialOption('selectRole');
    clearOnSpecialOption('selectDepartment');

</script>



