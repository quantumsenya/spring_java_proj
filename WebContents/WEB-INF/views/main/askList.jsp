<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>공지사항</h1>
	</div>
	<div>
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>	
			<c:choose>
				<c:when test="${empty ask}">
					<tr>
						<td colspan="5" class="text-center"><b>작성된 게시물이 없습니다.</b></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ask}" var="a">
						<tr class="text-center">
							<td class="text-left">
								<a href="${contextPath}/askDetail=${a.bno}" class="title">${a.title}</a>
							</td>
							<td>${a.writer}</td>
							<td>
								<fmt:formatDate value="${a.writeDate}" pattern="MM-dd hh:mm"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>