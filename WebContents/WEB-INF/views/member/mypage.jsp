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
				</tr>
				<c:forEach items="${memberInfo}" var="info">
					<tr>
						<td>${info.mno}</td>
						<td>${info.memberId}</td>
						<td>${info.email }</td>
						<td>
							<c:if test="${info.enabled eq '0'}">비활성</c:if>
							<c:if test="${info.enabled eq '1'}">활성</c:if>
						</td>
					</tr>
				</c:forEach> 
			</c:otherwise>
		</c:choose>
	</table>
</div>

<div class="container">
	<h1>회원 페이지</h1>
	<div>
		${memberInfo}
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>