<%@ page import="config.MenuItem" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    MenuItem menu = (MenuItem) request.getAttribute("menu");
    String collapseId = "";
    boolean hasChildren = false;

    if (request.getAttribute("menu") != null) {
        String title = menu.getTitle() != null ? menu.getTitle() : "";
        collapseId = "collapse_" + title.replaceAll("\\s+", "");
        hasChildren = menu.getChildren() != null && !menu.getChildren().isEmpty();
    }
%>

<li class="nav-item">
    <a class="nav-link ${hasChildren ? "" : "single-menu"}"
       href="${hasChildren ? '#' + collapseId : menu.getUrl()}"
            <c:if test="${hasChildren}">
                data-bs-toggle="collapse"
                role="button"
                aria-expanded="false"
                aria-controls="${collapseId}"
            </c:if>>
        <i class="${menu.getIcon()} menu-icon"></i>
        <span>${menu.getTitle()}</span>
    </a>

    <%--    <c:if test="${hasChildren}">--%>
    <%--        <div class="collapse" id="${collapseId}">--%>
    <%--            <ul class="nav flex-column">--%>
    <%--                <c:forEach var="child" items="${menu.getChildren()}">--%>
    <%--                    <c:set var="menu" value="${child}"/>--%>
    <%--                    <jsp:include page="menu-item.jsp"/>--%>
    <%--                </c:forEach>--%>
    <%--            </ul>--%>
    <%--        </div>--%>
    <%--    </c:if>--%>
</li>
