<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>개인정보 수정</h1>
	</div>
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			 <div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">사용자 등록</h5>
					<form action="${contextPath}/member/update" method="post">
					<spring:hasBindErrors name="memberDTO"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="form-label-group">
							<label for="memberId">아이디: </label>
							<input type="text" name="memberId" class="form-control" value="${vo.memberId}" autofocus="autofocus" readonly="readonly">
							<form:errors path="memberDTO.memberId" element="div" class="input_errors" />
						</div>
						<div class="form-label-group">
							<label>이름: </label>
							<input type="text" name="memberName" class="form-control" value="${vo.memberName}" autofocus="autofocus" required="required" placeholder="이름을 입력하세요">
							<form:errors path="memberDTO.memberName" element="div" class="input_errors" />
						</div>
						<div class="form-label-group">
							<label>비밀번호 : </label>
							<input type="password" name="password" class="form-control" required="required" placeholder="사용하실 비밀번호를 입력하세요">
							<form:errors path="memberDTO.password" element="div" class="input_errors" />
						</div>
						<div class="form-label-group">
							<label>비밀번호 확인 : </label>
							<input type="password" name="confPassword" class="form-control" required="required" placeholder="비밀번호를 다시 한번 입력하세요.">
							<form:errors path="memberDTO.confPassword" element="div" class="input_errors" />
						</div>
						<div class="form-label-group">
							<label>이메일 : </label>
							<input type="email" name="email" class="form-control" value="${vo.email}" required="required" placeholder="사용중인 이메일을 입력하세요">
							<form:errors path="memberDTO.email" element="div" class="input_errors" />
						</div>
						<div class="form-label-group">
							<label>전화번호 : </label>
							<input type="number" name="phoneNum" class="form-control" value="${vo.phoneNum}" required="required" placeholder="사용중인 전화번호를 입력하세요">
							<form:errors path="memberDTO.phoneNum" element="div" class="input_errors" />
						</div>
						<hr>
							<div class="form-label-group text-center">
								<button class="btn btn-lg btn-block btn-primary">회원정보 변경</button>
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

<style>
.input_errors{
	font-size: 13px;  
	font-weight:bold; 
	color:red;
}
.error_on {
	border-color: red;
}
</style>
<script>
$(function(){
	let error_form = $('.input_errors');
	console.log(error_form.length);
	if(error_form.length>0){
		error_form.prev().addClass('error_on')
	}
})
</script>