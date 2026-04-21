<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
    <jsp:include page="/views/partials/message-box.jsp"></jsp:include>
    <div class="card ">
        <div class="card-header ">
            <h4 class="card-title">Đặt câu hỏi</h4>
        </div>
        <div class="card-body">
            <div class="col-md-12">
                <form action="question?action=add" method="post">
                    <!-- Title -->
                    <input required type="hidden" class="form-control" name="id" value="${sessionScope.user.id}"
                    >
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input required type="text" class="form-control" id="title" name="title"
                               placeholder="Enter your question title">
                    </div>

                    <!-- Category -->
                    <div class="mb-3 row">
                        <div class="col-6">
                            <label for="category" class="form-label">Department</label>
                            <select class="form-select" id="department" name="department">
                                <option disabled>Select</option>
                                <c:forEach var="department" items="${departments}">
                                    <option value="${department.id}">${department.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-6">
                            <label for="category" class="form-label">Category</label>
                            <select class="form-select" id="category" name="category">
                                <option disabled>Select</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>

                            </select>
                        </div>

                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea rows="5" class="form-control h-500" id="description" name="content"></textarea>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    const {
        ClassicEditor,
        Essentials,
        Paragraph,
        Bold,
        Italic, List, Link,
        Image
    } = CKEDITOR;

    ClassicEditor
        .create(document.querySelector('#description'), {
             licenseKey: 'GPL',
           // licenseKey: 'eyJhbGciOiJFUzI1NiJ9.eyJleHAiOjE3NDU5NzExOTksImp0aSI6ImY1MmZjZGMyLTI0YzAtNDYxNS1hN2Y0LTlhOWM2Yzk1NTA4MiIsInVzYWdlRW5kcG9pbnQiOiJodHRwczovL3Byb3h5LWV2ZW50LmNrZWRpdG9yLmNvbSIsImRpc3RyaWJ1dGlvbkNoYW5uZWwiOlsiY2xvdWQiLCJkcnVwYWwiLCJzaCJdLCJ3aGl0ZUxhYmVsIjp0cnVlLCJsaWNlbnNlVHlwZSI6InRyaWFsIiwiZmVhdHVyZXMiOlsiKiJdLCJ2YyI6IjAzMGI2OTJhIn0.13WnbXTKJ7WtkRf_Vl4M7mziSgoy2IJqAV2UVaInAEXeqE6gFICrKT0iXpUPyuc0PXkMjkhXDlyajgoID3FiJg',
            plugins: [Essentials, Paragraph, Bold, Italic],
            // toolbar: ['bold', 'italic', 'underline', 'link', 'undo', 'redo', 'clear', 'fullscreen', 'insertImage', 'insertUnorderedList', 'insertOrderedList'],
            toolbar: [
                'accessibilityHelp',
                'selectAll',
                'undo',
                'redo',
                'bold',
                'italic',
                // Nếu bạn dùng dạng menu thì giữ các dòng bên dưới
                'menuBar:accessibilityHelp',
                'menuBar:selectAll',
                'menuBar:undo',
                'menuBar:redo',
                'menuBar:bold',
                'menuBar:italic'
            ]
        })
        .then(editor => {
            console.log('Available toolbar items:');
            const items = Array.from(editor.ui.componentFactory.names());
            console.log('Toolbar items available:', items);
        })
        .catch(error => {
            console.error(error);
        });

    // Replace the <textarea id="editor1"> with a CKEditor 4
    // instance, using default configuration.
    // var editor = CKEDITOR.replace('editor1');
    <%--CKEDITOR.replace('editor1',--%>
    <%--    {--%>

    <%--        filebrowserBrowseUrl: '${pageContext.request.contextPath}/ckfinder/ckfinder.html',--%>
    <%--        filebrowserImageBrowseUrl: '${pageContext.request.contextPath}/ckfinder/ckfinder.html?type=Images',--%>
    <%--        filebrowserUploadUrl: '${pageContext.request.contextPath}/ckfinder/connector?command=QuickUpload&type=Files',--%>
    <%--        filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckfinder/connector?command=QuickUpload&type=Images'--%>
    <%--    });--%>
    <%--CKEDITOR.replace('editor2', {--%>
    <%--    filebrowserBrowseUrl: '${pageContext.request.contextPath}/ckfinder/ckfinder.html',--%>
    <%--    filebrowserUploadUrl: '${pageContext.request.contextPath}/ckfinder/connector?command=QuickUpload&type=Files'--%>
    <%--});--%>
    // CKFinder.setupCKEditor(editor);
</script>