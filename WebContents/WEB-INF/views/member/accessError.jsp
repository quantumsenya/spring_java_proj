<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<h1>해당 페이지에 접근권한이 없습니다</h1>
	<div>
		<spring:message code="main.greeting" arguments="${name},${welcome}"/>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>