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
    <c:choose>
        <c:when test="${empty menu.getChildren()}">
            <c:if test="${empty menu.getPermission() or (userPermissions != null and userPermissions.contains(menu.getPermission()))}">
                <a class="nav-link" href="${pageContext.request.contextPath}${menu.getUrl()}">
                    <i class="${menu.getIcon()} menu-icon"></i>
                    <span>${menu.getTitle()}</span>
                </a>
            </c:if>
            <%--            <a class="nav-link" href="${pageContext.request.contextPath}${menu.getUrl()}">--%>
            <%--                <i class="${menu.getIcon()} menu-icon"></i>--%>
            <%--                <span>${menu.getTitle()}</span>--%>
            <%--            </a>--%>
        </c:when>
        <c:otherwise>
            <c:if test="${empty menu.getPermission() or (userPermissions != null and userPermissions.contains(menu.getPermission()))}">
                <a class="nav-link" href="#${menu.getUrl()}"
                   data-bs-toggle="collapse" role="button"
                   aria-expanded="false"
                   aria-controls="${menu.getUrl()}"
                >
                    <i class="${menu.getIcon()} menu-icon"></i>
                    <span>${menu.getTitle()}</span>
                </a>

                <div class="collapse" id="${menu.getUrl()}">
                    <ul class="nav flex-column">
                        <c:forEach var="subMenu" items="${menu.getChildren()}">
                            <c:if test="${empty subMenu.getPermission() or (userPermissions != null and userPermissions.contains(subMenu.getPermission()))}">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/${subMenu.getUrl()}">
                                            ${subMenu.getTitle()}
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul><!--end nav-->
                </div>

            </c:if>

        </c:otherwise>
    </c:choose>
</li>


