<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>회원정보</h1>
	</div>
	<table class="table table-hover">
		<c:choose>
			<c:when test="${empty memberInfo}">
				<div class="jumbotron">
					<h2>로그인이 필요합니다.</h2>
				</div>
			</c:when>
			<c:otherwise>
				<tr>
					<th>회원번호</th>
					<td>${memberInfo.mno}</td>
					<th>아이디</th>
					<td>${memberInfo.memberId}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memberInfo.email }</td>
					<th>등급</th>
					<td>${memberInfo.authList[0].memberType.name}</td>
				</tr>
				<tr>
					<th>활성화 상태</th>
					<td>
						<c:if test="${memberInfo.enabled eq false}">비활성</c:if>
						<c:if test="${memberInfo.enabled eq true}">활성</c:if>
					</td>
					<th>가입일</th>
					<td><fmt:formatDate value="${memberInfo.joinDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	<c:if test="${not empty memberInfo}">
		<form action="${contextPath}/member/logout" method="post"> <!-- 기본값 : /logout -->
			<a class="btn btn-primary" href="${contextPath}/member/updateForm">회원정보 수정</a>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<button class="btn btn-danger">로그아웃</button>
		</form>
	</c:if>
</div>


<%@ include file="../layout/footer.jsp" %>