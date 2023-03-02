<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>회원 가입</h1>
	</div>
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			 <div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">사용자 등록</h5>
					<form action="${contextPath}/member/join" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="form-label-group">
							<label>아이디: </label>
							<input type="text" name="memberId" class="form-control" autofocus="autofocus" required="required" placeholder="사용하실 아이디를 입력하세요">
						</div>
						<div class="form-label-group">
							<label>비밀번호 : </label>
							<input type="text" name="password" class="form-control" required="required" placeholder="사용하실 비밀번호를 입력하세요">
						</div>
						<div class="form-label-group">
							<label>이메일 : </label>
							<input type="text" name="email" class="form-control" required="required" placeholder="사용하실 이메일을 입력하세요">
						</div>
						<hr>
							<div class="form-label-group text-center">
								<button class="btn btn-lg btn-block btn-primary">가입하기</button>
							</div>
						<hr>
							<div class="form-label-group text-center">
								<button type="reset" class="btn btn-lg btn-block btn-warning">초기화</button>
							</div>
					</form>
				</div>
			 </div>
		</div>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>