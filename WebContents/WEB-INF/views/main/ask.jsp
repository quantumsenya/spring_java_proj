<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>문의하기</h1>
	</div>
	
	<form action="${contextPath}/ask" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" name="id" class="form-control" value="${memberInfo.id}" disabled="disabled">
		</div>
		<div class="form-group">
			<label for="article">내용</label>
			<textarea rows="10" placeholder="내용을 입력 해 주세요..." name="article" class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" name="email" class="form-control" value="${memberInfo.email}" disabled="disabled">
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" name="phone" class="form-control" placeholder="010-1234-5678">
		</div>
		<div class="d-flex justify-content-center">
			<button class="btn btn-success">전송</button>
			<button class="btn btn-warning" type="reset">취소</button>
		</div>
	</form>
</div>


<%@ include file="../layout/footer.jsp" %>