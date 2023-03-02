<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container">
	<div class="jumbotron text-center">
		<h2>메인페이지</h2>
	</div>
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			 <div class="card card-signin my-5">
				<div class="card-body">
					<div class="form-label-group">
						<sec:authorize access="isAnonymous()">
							<a class="btn btn-block btn-primary" href="${contextPath}/member/join">회원가입</a><br>
							<a class="btn btn-block btn-info" href="${contextPath}/member/login">로그인</a> <br>
							<hr>
							<p>서비스 이용을 위해 로그인 해 주세요.</p>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우  -->
							<h3 class="text-center">로그인 중 : <span class="badge badge-pill badge-primary"><sec:authentication property="principal.username"/></span></h3> <!-- 로그인 id-->
							<form action="${contextPath}/member/logout" method="post"> <!-- 기본값 : /logout -->
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<button class="btn btn-block btn-danger">로그아웃</button>
							</form>
							<hr>
						</sec:authorize>
					</div>
					<div class="form-label-group">
					<%-- 	<a href="${contextPath}/member/all">모든 사용자 접근 가능</a><br> --%>
						<sec:authorize access="hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')">
							<a class="btn btn-block btn-info" href="${contextPath}/member/mypage">나의 정보 보기</a>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
							<a class="btn btn-block btn-success" href="${contextPath}/member/admin">관리자 페이지</a>
							<a class="btn btn-block btn-warning" href="${contextPath}/askList">회원문의</a>
						</sec:authorize>
					</div>
				</div>
			 </div>
		</div>
	</div>
	
</div>


<%@ include file="layout/footer.jsp" %>

<script>
	let loginOn = "${loginOn}"
	if(loginOn!='') alert(loginOn);
</script>