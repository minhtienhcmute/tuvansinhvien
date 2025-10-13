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

<!--end row-->


<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <div class="row align-items-center">
                    <jsp:include page="/views/partials/card-header.jsp"></jsp:include>
                    <div class="col-auto">
                        <div class="row g-2">
                            <div class="col-auto">
                                <c:choose>

                                    <c:when test="${empty param.action && canAdd}">
                                        <a href="role?action=add"
                                           class="btn btn-primary"><i class="fa-solid fa-plus me-1"></i> Add Role
                                        </a>
                                    </c:when>


                                </c:choose>


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
