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
<form id="categoryForm" action="department?action=edit" method="post">
    <input type="hidden" name="id" value="${department.id}"/> <!-- chỉ dùng nếu là edit -->
    <input type="hidden" name="csrfToken" value="${csrfToken}">

    <div class="row">
        <div class="col-lg-12">
            <div class="mb-3 row">
                <label for="name-input" class="col-sm-2 col-form-label text-end">Department name</label>
                <div class="col-sm-10">
                    <input required name="name" class="form-control" type="text"
                           value="${department.name}" placeholder="Input department name" id="name-input">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="example-password-input" class="col-sm-2 col-form-label text-end">Description</label>
                <div class="col-sm-10">
                    <input value="${department.description}" name="desc" class="form-control" type="text"
                           placeholder="Input description" id="example-password-input">
                </div>
            </div>
        </div>


    </div>
    <div class="row">
        <div class="col-sm-12 ms-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="department" class="btn btn-danger">Cancel</a>
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



