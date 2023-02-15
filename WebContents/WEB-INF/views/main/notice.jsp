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
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>	
			<c:choose>
				<c:when test="${empty notice}">
					<tr>
						<td colspan="5" class="text-center"><b>작성된 게시물이 없습니다.</b></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${notice}" var="n">
						<tr class="text-center">
							<td class="text-left">
								<a href="${n.bno}" class="title">${n.title}</a>
							</td>
							<td>${n.writer}</td>
							<td>${n.views}</td>
							<td>
								<fmt:formatDate value="${n.writeDate}" pattern="MM-dd hh:mm"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
			<a class="btn btn-primary" href="${contextPath}/noticeForm">공지등록</a>
		</sec:authorize>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>