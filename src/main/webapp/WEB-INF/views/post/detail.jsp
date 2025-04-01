<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>게시글 상세</h1>
	<div class="form-group">
		<label>게시판</label>
		<div class="form-control">${post.po_bo_name}</div>
	</div>
	<div class="form-group">
		<label>제목</label>
		<div class="form-control">${post.po_title}</div>
	</div>
	<div class="form-group">
		<label>작성자</label>
		<div class="form-control">${post.po_me_id}</div>
	</div>
	<div class="form-group">
		<label>작성일</label>
		<div class="form-control">
			<fmt:formatDate value="${post.po_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
	</div>
	<div class="form-group">
		<label>조회수</label>
		<div class="form-control">${post.po_view}</div>
	</div>
	<div class="form-group">
		<label>내용</label>
		<div class="form-control" style="min-height: 400px;">${post.po_content}</div>
	</div>
	<div class="form-group">
		<label>첨부파일</label>
		<c:forEach items="${list }" var="file">
			<a href="<c:url value="/download${file.fi_name}"/>" class="form-control" download="${file.fi_ori_name }">${file.fi_ori_name }</a>
		</c:forEach>
	</div>
	<hr>
	<div class="comment-container">
		<div class="comment-wrap">
		
		</div>
		<form class="comment-insert-form">
			<textarea name="content"></textarea>
			<button type="submit">댓글 등록</button>
		</form>
	</div>
	<div class="mb-3 d-flex justify-content-between">
		<a href="<c:url value="/post/list?bo_num=${post.po_bo_num}"/>" class="btn btn-outline-success">목록으로</a>
		<c:if test="${post.po_me_id eq user.me_id }">
			<div>
				<a href="<c:url value="/post/update/${post.po_num}"/>" class="btn btn-outline-warning">수정</a>
				<a href="<c:url value="/post/delete/${post.po_num}"/>" class="btn btn-outline-danger">삭제</a>
			</div>
		</c:if>
	</div>
	<script type="text/javascript">
		var cri = {
			page : 1,
			po_num : ${post.po_num}
		}
		$(document).on("submit", ".comment-insert-form", function(e){
			e.preventDefault();
			//댓글 내용을 입력 안한 경우
			
			$.ajax({
				async : true,
				url : '/경로', 
				type : 'post', 
				data : JSON.stringify(객체), 
				contentType : "application/json; charset=utf-8",
				success : function (data){
					console.log(data)
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
		})
	</script>
</body>
</html>
