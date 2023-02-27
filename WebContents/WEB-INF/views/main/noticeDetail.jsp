<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>공지사항</h1>
	</div>
	<div class="jumbotron">
		소개함~ <br>
		<hr>
		${board}
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>