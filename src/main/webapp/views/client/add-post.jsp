<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

</head>


<!-- Main Content -->

<div class="row">

    <jsp:include page="/views/partials/message-box.jsp"></jsp:include>

    <div class="col-md-9">
        <h2>Đặt câu hỏi</h2>
        <form action="question?action=add" method="post">
            <!-- Title -->
            <input required type="hidden" class="form-control" name="id" value="1"
                   placeholder="Enter your question title">
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


    <!-- Sidebar -->
    <div class="col-md-3 sidebar">
        <!-- Ask a Question Button (already on this page, so we can omit or disable it) -->
        <div class="mb-3">
            <a href="#" class="btn btn-primary w-100 disabled">+ Ask a question</a>
        </div>

        <!-- Categories -->
        <div class="mb-4">
            <h5>Categories</h5>
            <select class="form-select">
                <option>Introduction</option>
                <option selected>Lookup Order</option>
                <option>List Page Templates</option>
                <option>Homepage Templates</option>
                <option>Section Templates</option>
                <option>Single Page Templates</option>
                <option>Content Templates</option>
            </select>
        </div>

        <!-- Related Questions -->
        <div class="mb-4">
            <h5>Câu hỏi liên quan</h5>
            <ul class="list-group">
                <li class="list-group-item">Item One</li>
                <li class="list-group-item">Item Two</li>
                <li class="list-group-item">Item Three</li>
            </ul>
        </div>
    </div>
</div>


<!-- Include the Footer -->
<jsp:include page="client-footer.jsp"/>
<script>
    const {
        ClassicEditor,
        Essentials,
        Paragraph,
        Bold,
        Italic
    } = CKEDITOR;

    ClassicEditor
        .create(document.querySelector('#description'), {
            licenseKey: 'GPL', // Or 'GPL'.
            plugins: [Essentials, Paragraph, Bold, Italic],
            toolbar: ['bold', 'italic', 'underline', 'link', 'undo', 'redo', 'clear', 'fullscreen', 'insertImage', 'insertUnorderedList', 'insertOrderedList'],

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