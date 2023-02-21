<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<h2>회원 정보</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>아이디</th>
				<th>ㅇㅇ</th>
				<th>ㄴㄴ</th>
			</tr>
		</thead>
		<c:forEach items="${memberInfo}" var="m">
			<tr>
				<td>${m.memberId}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="container">
	<h1>회원 페이지</h1>
	<div>
		${memberInfo}
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>