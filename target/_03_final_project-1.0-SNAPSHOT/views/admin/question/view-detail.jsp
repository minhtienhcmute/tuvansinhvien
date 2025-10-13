<%--
  Created by IntelliJ IDEA.
  User: vomin
  Date: 12/4/2025
  Time: 9:01 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/views/partials/message-box.jsp"></jsp:include>


<div class="row mt-3">
    <!-- VOTE + AVATAR -->
    <div class="col-1 align-items-center d-flex flex-column gap-2">
        <jsp:include page="/views/partials/user-avatar.jsp">
            <jsp:param name="avatarUrl" value="${question.user.avatar}"/>
        </jsp:include>
        <small class="text-muted text-center">${question.user.name}</small>

        <%--        <div class="my-2">--%>
        <%--            <i class="bi bi-caret-up-fill fs-4 text-secondary"></i><br/>--%>
        <%--            <span class="fw-bold">${question.vote_cnt}</span><br/>--%>
        <%--            <i class="bi bi-caret-down-fill fs-4 text-secondary"></i>--%>
        <%--        </div>--%>
        <%--        <small class="text-muted">vote</small>--%>
    </div>

    <!-- NỘI DUNG CHÍNH -->
    <div class="col-md-11">
        <div class="row d-flex">
            <div class="col-8">
                <h5 class="mb-2 flex-grow-1 me-3 fw-bold">${question.title}</h5>
                <div class="">
                    <span class="badge bg-primary">${question.category.name}</span>
                    <span class="badge bg-info">${question.department.name}</span>
                </div>

            </div>
            <div class="col-4 row  small text-muted">
                <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Người gửi:
                        </span>
                    <span class="col-7 text-dark text-start">
                        ${question.user.name}
                    </span>
                </div>

                <div class="row text-end">
                           <span class="col-5 fw-semibold">
                            Email:
                        </span>
                    <span class="col-7 text-dark text-start"><a
                            href="mailto:${question.user.email}">${question.user.email}</a></span>
                </div>


                <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Ngày gửi:
                        </span>
                    <span class="col-7 text-start">
                        <fmt:formatDate value="${question.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/>

                    </span>
                </div>
                <div class="row text-end">
                    <span class="col-5 text-end fw-semibold">Trạng thái:</span>
                    <c:set var="color"
                           value="${question.status == 0 ? 'warning' : question.status == 1 ? 'success' : 'danger'}"></c:set>
                    <c:set var="statusText"
                           value="${question.status == 0 ? 'Waiting answer' : question.status == 1 ? 'Answered' : 'Rejected'}"></c:set>
                    <span class="col-7 text-${color} fw-medium text-start">
                        ${statusText}
                    </span>
                </div>
            </div>
        </div>
        <!-- Nội dung câu hỏi -->
        <div class="mt-2">
            ${question.content}
        </div>

        <!-- Hành động -->
        <hr>
        <div class="d-flex justify-content-between gap-2">
            <div class="d-flex gap-5 text-muted">
                <div>
                    <i class="iconoir-eye me-1"></i> <!-- icon mắt -->
                    <small class="text-muted">${question.views} lượt xem</small>
                </div>


            </div>
            <c:if test="${canReject && question.status == 0}">
                <button type="button" class="btn btn-danger btn-sm"
                        data-bs-toggle="modal" data-bs-target="#rejectModal">
                    Reject
                </button>
            </c:if>
            <c:if test="${not empty question.reason}">
                <div class="d-flex align-items-center text-danger">
                    <i class="iconoir-warning-triangle me-1"></i> <!-- icon cảnh báo -->
                    <small>Reason reject: ${question.reason}</small>
                </div>
            </c:if>
            <div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModal"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" role="document">
                    <form action="question?action=reject" method="POST" class="modal-content">
                        <input type="hidden" name="question_id" value="${question.id}">
                        <div class="modal-header">
                            <h6 class="modal-title" id="rejectModalLabel">Reason reject</h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body">
                         <textarea required class="form-control" name="reason" rows="4"
                                   placeholder="Input reason"></textarea>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="mr-2 btn btn-danger">Submit</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>

                    </form>
                </div><!--end modal-dialog-->
            </div><!--end modal-->
        </div>

    </div>
</div>
<div class="card mt-3">
    <div class="card-header">
        <h4 class="card-title">Trả lời:</h4>
    </div>
    <div class="card-body">
        <form action="question?action=answer" method="post">
            <div class="row">
                <input type="hidden" name="question_id" value="${question.id}">
                <div class="col-1 align-items-center d-flex flex-column gap-2">
                    <jsp:include page="/views/partials/user-avatar.jsp">
                        <jsp:param name="avatarUrl" value="${sessionScope.user.avatar}"/>
                    </jsp:include>
                    <small class="text-muted text-center">${sessionScope.user.name}</small>
                </div>
                <div class="col-11">
                    <textarea id="editorAnswer" class="form-control" rows="5" name="content"></textarea>
                    <div class="mt-3 d-flex justify-content-end gap-3">
                        <c:if test="${canAnswer && question.status != 2}">
                            <button type="submit" class="btn btn-success">Gửi trả lời</button>
                        </c:if>
                        <a href="question" class="btn btn-danger">Hủy</a>

                    </div>
                </div>
            </div>

        </form>
    </div>
</div>

<c:if test="${not empty comments}">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Danh sách câu trả lời:</h4>
        </div>
        <div class="card-body">
            <c:forEach var="comment" items="${comments}">

                <div class="row mb-3">
                    <div class="col-md-1 align-items-center d-flex flex-column gap-2 text-center">
                        <jsp:include page="/views/partials/user-avatar.jsp">
                            <jsp:param name="avatarUrl" value="${comment.user.avatar}"/>
                        </jsp:include>
                        <small class="text-muted text-center">${comment.user.name}</small>
                            <%--                        <div class="my-2">--%>
                            <%--                            <i class="bi bi-caret-up-fill fs-4 text-secondary"></i><br/>--%>
                            <%--                            <span class="fw-bold">${comment.vote_cnt}</span><br/>--%>
                            <%--                            <i class="bi bi-caret-down-fill fs-4 text-secondary"></i>--%>
                            <%--                        </div>--%>
                            <%--                        <small class="text-muted">vote</small>--%>

                    </div>

                    <!-- NỘI DUNG CHÍNH -->
                    <div class="col-md-11">
                        <div class="row ">
                            <div class="col-8">
                                <div class="bg-light rounded ms-n2 bg-light-alt p-3">
                                        ${comment.content}
                                </div>
                            </div>
                            <div class="col-4 small text-muted">
                                <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Người trả lời:
                        </span>
                                    <span class="col-7 text-dark text-start">
                                            ${comment.user.name}
                                    </span>
                                </div>

                                <div class="row text-end">
                           <span class="col-5 fw-semibold">
                            Email:
                        </span>
                                    <span class="col-7 text-dark text-start"><a
                                            href="mailto:${comment.user.email}">${comment.user.email}</a></span>
                                </div>


                                <div class="row text-end">
                        <span class="col-5 fw-semibold">
                            Ngày trả lời:
                        </span>
                                    <span class="col-7 text-start">
                                        <fmt:formatDate value="${comment.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </span>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <hr>
            </c:forEach>
        </div>
    </div>

</c:if>


<script>
    const {
        ClassicEditor,
        Essentials,
        Paragraph,
        Bold,
        Italic, List,
        Image,
        Clear, Fullscreen,
    } = CKEDITOR;

    ClassicEditor
        .create(document.querySelector('#editorAnswer'), {
            // licenseKey: 'GPL', // Or 'GPL'.
            licenseKey: 'eyJhbGciOiJFUzI1NiJ9.eyJleHAiOjE3NDU5NzExOTksImp0aSI6ImY1MmZjZGMyLTI0YzAtNDYxNS1hN2Y0LTlhOWM2Yzk1NTA4MiIsInVzYWdlRW5kcG9pbnQiOiJodHRwczovL3Byb3h5LWV2ZW50LmNrZWRpdG9yLmNvbSIsImRpc3RyaWJ1dGlvbkNoYW5uZWwiOlsiY2xvdWQiLCJkcnVwYWwiLCJzaCJdLCJ3aGl0ZUxhYmVsIjp0cnVlLCJsaWNlbnNlVHlwZSI6InRyaWFsIiwiZmVhdHVyZXMiOlsiKiJdLCJ2YyI6IjAzMGI2OTJhIn0.13WnbXTKJ7WtkRf_Vl4M7mziSgoy2IJqAV2UVaInAEXeqE6gFICrKT0iXpUPyuc0PXkMjkhXDlyajgoID3FiJg',
            plugins: [Essentials, Paragraph, Bold, Italic],
            // toolbar: ['bold', 'italic', 'underline', 'link', 'undo', 'redo', 'clear', 'fullscreen', 'insertImage', 'insertUnorderedList', 'insertOrderedList'],
            toolbar: [
                'selectAll',
                'undo',
                'redo',
                'bold',
                'italic',
                // Nếu bạn dùng dạng menu thì giữ các dòng bên dưới
                // 'menuBar:accessibilityHelp',
                // 'menuBar:selectAll',
                // 'menuBar:undo',
                // 'menuBar:redo',
                // 'menuBar:bold',
                // 'menuBar:italic'
            ]
        })
        .catch(error => {
            console.error(error);
        });

    function showAnswerEditor() {
        // document.getElementById("answerEditor").classList.remove("d-none");
    }

    function hideAnswerEditor() {
        // document.getElementById("answerEditor").classList.add("d-none");
    }

    function showRejectModal() {
        // new bootstrap.Modal(document.getElementById('rejectModal')).show();
    }
</script>

