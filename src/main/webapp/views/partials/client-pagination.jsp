<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="perPageOptions" value="${[5,10,15,20,25]}"/>
<c:set var="pageRange" value="2"/>

<c:set var="query" value=""/>
<c:if test="${not empty param.category}">
    <c:set var="query" value="${query}&category=${fn:escapeXml(param.category)}"/>
</c:if>
<c:if test="${not empty param.tab}">
    <c:set var="query" value="${query}&tab=${fn:escapeXml(param.tab)}"/>
</c:if>
<c:if test="${not empty param.department_id}">
    <c:set var="query" value="${query}&department_id=${fn:escapeXml(param.department_id)}"/>
</c:if>

<c:if test="${not empty param.keyword}">
    <c:set var="query" value="${query}&keyword=${fn:escapeXml(param.keyword)}"/>
</c:if>

<c:set var="perPage" value="${empty param.perPage ? '5' : param.perPage}"/>


<c:set var="query" value="${query}&perPage=${perPage}"/>

<div class="row">
    <div class="col-4">
        <div class="datatable-dropdown">
            <label>
                <select class="datatable-selector" name="perPage">
                    <c:forEach var="item" items="${perPageOptions}">
                        <option value="${item}" ${item == param.perPage ?'selected' :''}>${item}</option>
                    </c:forEach>
                </select> entries per page
            </label>
        </div>
    </div>
    <div class="col-8">
        <c:if test="${totalPage > 0 }">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <!-- First & Prev -->
                        <%--                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">--%>
                        <%--                        <a class="page-link" href="${pageContext.request.contextPath}?page=1${query}"--%>
                        <%--                           aria-label="First">«</a>--%>
                        <%--                    </li>--%>
                        <%--                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">--%>
                        <%--                        <a class="page-link" href="${pageContext.request.contextPath}?page=${currentPage - 1}${query}"--%>
                        <%--                           aria-label="Previous">&lsaquo;</a>--%>
                        <%--                    </li>--%>
                    <c:if test="${currentPage != 1 && currentPage - 1 > 0}">
                        <a class="page-link" href="${pageContext.request.contextPath}?page=${currentPage - 1}${query}"
                           aria-label="Previous">«</a>
                    </c:if>
                    <!-- Always show first page -->
                    <li class="page-item ${currentPage == 1 ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}?page=1${query}">1</a>
                    </li>

                    <!-- Left dots -->
                    <c:if test="${currentPage - pageRange > 2}">
                        <li class="page-item disabled"><span class="page-link">...</span></li>
                    </c:if>
                    <c:set var="beginPage" value="${currentPage - pageRange}"/>
                    <c:if test="${beginPage < 2}">
                        <c:set var="beginPage" value="2"/>
                    </c:if>

                    <c:set var="endPage" value="${currentPage + pageRange}"/>
                    <c:if test="${endPage > totalPage - 1}">
                        <c:set var="endPage" value="${totalPage - 1}"/>
                    </c:if>
                    <!-- Pages around current -->
                    <c:forEach begin="${beginPage}" end="${endPage}" var="i">
                        <c:if test="${i > 1 && i < totalPage}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}?page=${i}${query}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <!-- Right dots -->
                    <c:if test="${currentPage + pageRange < totalPage - 1}">
                        <li class="page-item disabled"><span class="page-link">...</span></li>
                    </c:if>

                    <!-- Always show last page (if more than 1 page) -->
                    <c:if test="${totalPage > 1}">
                        <li class="page-item ${currentPage == totalPage ? 'active' : ''}">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}?page=${totalPage}${query}">${totalPage}</a>
                        </li>
                    </c:if>

                    <!-- Next & Last -->
                        <%--                    <li class="page-item ${currentPage == totalPage ? 'disabled' : ''}">--%>
                        <%--                        <a class="page-link" href="${pageContext.request.contextPath}?page=${currentPage + 1}${query}"--%>
                        <%--                           aria-label="Next">&rsaquo;</a>--%>
                        <%--                    </li>--%>

                    <c:if test="${totalPage != currentPage && totalPage-currentPage > 0}">

                        <li class="page-item ${currentPage == totalPage ? 'disabled' : ''}">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}?page=${currentPage + 1}${query}"
                               aria-label="Last">»</a>
                        </li>
                    </c:if>
                </ul>
            </nav>

        </c:if>
    </div>
</div>

<script nonce="${cspNonce}">
    $(document).ready(function () {
        $('select[name="perPage"]').on('change', function () {
            const perPage = $(this).val();
            const url = new URL(window.location.href);
            const params = url.searchParams;

            // Gán hoặc cập nhật perPage
            params.set('perPage', perPage);

            // Reset page về 1
            params.set('page', 1);

            // Chuyển hướng với URL mới
            window.location.href = url.toString();
        });
    });
</script>