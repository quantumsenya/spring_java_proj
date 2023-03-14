<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>로그인</h1>
	</div>
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			 <div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">Log In</h5>
					<form action="${contextPath}/member/login" method="post">
						<div class="form-label-group">
							<label>아이디: </label>
							<input type="text" name="loginId" class="form-control" value="${loginId}" autofocus="autofocus" required="required" placeholder="아이디를 입력하세요">
						</div>
						<div class="form-label-group">
							<label>비밀번호 : </label>
							<input type="password" name="loginPwd" class="form-control" required="required" placeholder="비밀번호를 입력하세요">
						</div>
						<c:if test="${not empty errorMessage}">
							<div class="alert alert-danger">
								<strong>${errorMessage}</strong>
							</div>
						</c:if>
						<hr>
							<div class="form-label-group text-center">
								<input type="checkbox" name="remember-me"> 로그인 상태 유지
							</div>
						<hr>
							<div class="form-label-group text-center">
								<button class="btn btn-lg btn-block btn-primary">로그인</button>
							</div>
						<hr>
							<div class="form-label-group text-center">
								<a href="${contextPath}/member/join" class="btn btn-lg btn-block btn-secondary">회원가입</a>
							</div>
					<!-- csrf 토큰 -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</div>
			 </div>
		</div>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>