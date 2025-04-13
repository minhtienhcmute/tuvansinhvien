<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box d-md-flex justify-content-md-between align-items-center">
            <h4 class="page-title">Contacts</h4>
            <div class="">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="#">Dastone</a>
                    </li><!--end nav-item-->
                    <li class="breadcrumb-item"><a href="#">Apps</a>
                    </li><!--end nav-item-->
                    <li class="breadcrumb-item active">Contacts</li>
                </ol>
            </div>
        </div><!--end page-title-box-->
    </div><!--end col-->
</div>
<!--end row-->


<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h4 class="card-title">Contacts</h4>
                    </div><!--end col-->
                    <div class="col-auto">
                        <div class="row g-2">
                            <div class="col-auto">
                                <a class="btn bg-primary-subtle text-primary dropdown-toggle d-flex align-items-center arrow-none"
                                   data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false"
                                   aria-expanded="false" data-bs-auto-close="outside">
                                    <i class="iconoir-filter-alt me-1"></i> Filter
                                </a>
                                <div class="dropdown-menu dropdown-menu-start">
                                    <div class="p-2">
                                        <div class="form-check mb-2">
                                            <input type="checkbox" class="form-check-input" checked id="filter-all">
                                            <label class="form-check-label" for="filter-all">
                                                All
                                            </label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input type="checkbox" class="form-check-input" checked id="filter-one">
                                            <label class="form-check-label" for="filter-one">
                                                New
                                            </label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input type="checkbox" class="form-check-input" checked id="filter-two">
                                            <label class="form-check-label" for="filter-two">
                                                Active
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" checked id="filter-three">
                                            <label class="form-check-label" for="filter-three">
                                                Inactive
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->

                            <div class="col-auto">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#addRoleModal"><i class="fa-solid fa-plus me-1"></i> Add Role
                                </button>

                                <a href="role?action=add"
                                   class="btn btn-primary"><i class="fa-solid fa-plus me-1"></i> Add Role
                                </a>

                            </div><!--end col-->
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end card-header-->
            <div class="card-body">

                <jsp:include page="${view}"/>
            </div>
        </div>
    </div> <!-- end col -->
</div>
<!-- end row -->
<script>
    <%--$(document).ready(function () {--%>
    <%--    $('#myTable').DataTable({--%>
    <%--        processing: true,--%>
    <%--        serverSide: true,--%>
    <%--        ajax: {--%>

    <%--            url: '${pageContext.request.contextPath}/admin/role?action=view&type=api',  // Đường dẫn đến Servlet API--%>
    <%--            dataSrc: 'data'           // Dữ liệu trả về là mảng (array)--%>
    <%--        },--%>
    <%--        columns: [--%>
    <%--            {data: 'role_name'},--%>
    <%--            {data: 'permissions'}--%>
    <%--        ]--%>
    <%--    });--%>
    <%--});--%>
</script>
