<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1 class="text-center">공지사항</h1>
	</div>
	<div class="jumbotron">
		<h2>${board.title }</h2>
		<hr>
		${board.content}
		<hr>
		<div class="text-center">
			<h4>
				<span class="badge badge-pill badge-primary">${board.writer}</span>
				<span class="badge badge-pill badge-secondary">${board.writeDate}</span>
			</h4>
		</div>
	</div>
	<div>
		<a href="${contextPath}/notice" class="btn btn-info">목록</a>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>