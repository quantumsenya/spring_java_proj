<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>메인페이지</h1>
	</div>
		<spring:message code="main.greeting" arguments="${name},${welcome}"/>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>