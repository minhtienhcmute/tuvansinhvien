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
<jsp:include page="/views/partials/message-box.jsp"></jsp:include>

<c:set var="avatarUrl"
       value="${question.user.avatar != null ? question.user.avatar : 'assets/images/users/avatar-1.jpg'}"/>

<div class="row mt-3">
    <!-- VOTE + AVATAR -->
    <div class="col-md-1 text-center">
        <img src="${pageContext.request.contextPath}/${avatarUrl}" width="40" alt="avatar-${question.user.name}"
             class="thumb-md d-inline rounded-circle me-1">
        <div class="my-2">
            <i class="bi bi-caret-up-fill fs-4 text-secondary"></i><br/>
            <span class="fw-bold">${question.vote_cnt}</span><br/>
            <i class="bi bi-caret-down-fill fs-4 text-secondary"></i>
        </div>
        <small class="text-muted">vote</small>
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
                    <span class="col-7 text-start">${fn:substring(question.created_at, 0, 10)} ${fn:substring(question.created_at, 11, 16)}</span>
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
        <div>
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
                <%--                <div>--%>
                <%--                    <i class="iconoir-eye me-1"></i> <!-- icon mắt -->--%>
                <%--                    <small class="text-muted">${question.views} lượt xem</small>--%>
                <%--                </div>--%>
            </div>
            <button class="btn btn-danger" onclick="showRejectModal()">Từ chối</button>

        </div>

    </div>
</div>
<div class="card mt-3">
    <div class="card-header">
        <h4 class="card-title">Trả lời:</h4>
    </div>
    <div class="card-body">
        <form action="question?action=add" method="post">
            <div class="row">
                <input type="hidden" name="question_id" value="${question.id}">
                <div class="col-1 align-items-center d-flex flex-column gap-2">
                    <img src="${pageContext.request.contextPath}/${avatarUrl}" width="40"
                         alt="avatar-${question.user.name}"
                         class="thumb-md d-inline rounded-circle">
                    <small class="text-muted text-center">Võ Minh Tiến</small>
                </div>
                <div class="col-11">
                    <textarea id="editorAnswer" class="form-control" rows="5" name="content"></textarea>
                    <div class="mt-3 d-flex justify-content-end gap-3">
                        <button type="submit" class="btn btn-success">Gửi trả lời</button>
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
                <c:set var="avatarReplyer"
                       value="${comment.user.avatar != null ? comment.user.avatar : 'assets/images/users/avatar-1.jpg'}"/>
                <div class="row mb-3">
                    <div class="col-md-1 text-center">
                        <img src="${pageContext.request.contextPath}/${avatarReplyer}" width="40"
                             alt="avatar-${comment.user.name}"
                             class="thumb-md d-inline rounded-circle me-1">
                        <div class="my-2">
                            <i class="bi bi-caret-up-fill fs-4 text-secondary"></i><br/>
                            <span class="fw-bold">${comment.vote_cnt}</span><br/>
                            <i class="bi bi-caret-down-fill fs-4 text-secondary"></i>
                        </div>
                        <small class="text-muted">vote</small>

                    </div>

                    <!-- NỘI DUNG CHÍNH -->
                    <div class="col-md-11">
                        <div class="row d-flex">
                            <div class="col-8">
                                <div>
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
                                    <span class="col-7 text-start">${fn:substring(comment.created_at, 0, 10)} ${fn:substring(comment.created_at, 11, 16)}</span>
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


<div class="modal fade" id="rejectModal" tabindex="-1" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rejectModalLabel">Lý do từ chối câu hỏi </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>

            </div>

            <div class="modal-body">
                <textarea class="form-control" name="rejectReason" rows="4"
                          placeholder="Nhập lý do từ chối..."></textarea>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-danger">Xác nhận từ chối</button>
            </div>

        </form>
    </div>
</div>

<script>
    const {
        ClassicEditor,
        Essentials,
        Paragraph,
        Bold,
        Italic
    } = CKEDITOR;

    ClassicEditor
        .create(document.querySelector('#editorAnswer'), {
            licenseKey: 'GPL', // Or 'GPL'.
            plugins: [Essentials, Paragraph, Bold, Italic],
            toolbar: ['bold', 'italic', 'underline', 'link', 'undo', 'redo', 'clear', 'fullscreen', 'insertImage', 'insertUnorderedList', 'insertOrderedList'],
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

