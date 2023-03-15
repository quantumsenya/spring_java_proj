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
			<h6>
				<span class="badge badge-pill badge-primary">${board.writer}</span>
				<span class="badge badge-pill badge-secondary">${board.writeDate}</span>
				<span class="badge badge-pill badge-info">${board.views}회 읽음</span>
			</h6>
		</div>
	</div>
	<div>
		<c:choose>
			<c:when test="${userId eq board.writer or userId eq 'admin'}">
				<form action="${contextPath}/delNotice" method="post">
					<a href="${contextPath}/notice" class="btn btn-info">목록</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="bno" value="${board.bno}">
					<button class="btn btn-danger">삭제</button>
				</form>
			</c:when>
			<c:otherwise>
				<a href="${contextPath}/notice" class="btn btn-info">목록</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>
