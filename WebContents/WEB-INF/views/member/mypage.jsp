<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<h2>회원 정보</h2>
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
					<th>아이디</th>
					<th>이메일</th>
					<th>활성화 상태</th>
					<th>등급</th>
				</tr>
				<tr>
					<td>${memberInfo.mno}</td>
					<td>${memberInfo.memberId}</td>
					<td>${memberInfo.email }</td>
					<td>
						<c:if test="${memberInfo.enabled eq false}">비활성</c:if>
						<c:if test="${memberInfo.enabled eq true}">활성</c:if>
					</td>
					<td>${memberInfo.authList[0].memberType.name}</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>


<%@ include file="../layout/footer.jsp" %>