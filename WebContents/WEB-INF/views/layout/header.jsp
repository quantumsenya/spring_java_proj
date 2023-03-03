<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::시스템운영프로그램::</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- GOOGLE FONTS LINK -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<script>let contextPath = "${contextPath}"</script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-between">

  <!-- Links -->
	<ul class="navbar-nav">
		<li class="nav-item">
		  	<a style="font-family: 'Lobster', cursive;" class="navbar-brand" href="${contextPath}">운영프로그램</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${contextPath}/product/list">재고관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${contextPath}/member/mypage">사용자 관리</a>
		</li>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/member/admin">관리자 모드</a>
			</li>
		</sec:authorize>
		<li class="nav-item">
			<a class="nav-link" href="${contextPath}/notice">공지사항</a>
		</li>
	</ul>
	<ul class="navbar-nav">
		<!-- 드롭다운 메뉴 -->
		<li class="nav-item">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			  로그인 메뉴...
		 	</a>
			<div class="dropdown-menu dropdown-menu-right">
				<sec:authorize access="isAnonymous()"> <!-- 권한이 없는 경우(로그인을 하지 않은 사용자) -->
					<a class="dropdown-item" href="${contextPath}/member/login">로그인</a>
					<a class="dropdown-item" href="${contextPath}/member/join">회원가입</a>
				</sec:authorize>
					<sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우(로그인한 사용자) -->
						<a class="dropdown-item" href="${contextPath}/member/mypage">
							<sec:authentication property="principal.username"/>님 로그인중
						</a>
						<form action="${contextPath}/member/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<a class="dropdown-item btn btn-primary">로그아웃</a>
						</form>
					</sec:authorize>
			</div>
		</li>
	</ul>
</nav>


