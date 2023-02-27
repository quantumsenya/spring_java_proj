<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/notice.js"></script>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>공지사항</h1>
	</div>
	<div>
		<table class="table table-striped">
			<thead class="thead-dark ">
				<tr class="text-center">
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
								<a href="${contextPath}/noticeDetail?bno=${n.bno}" class="title">${n.title}</a>
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
		
		<ul class="pagination">
			<c:if test="${p.prev}">
			<li class="page-item">
				<a class="page-link" href="${p.startPage-1}">이전페이지</a>
			</li>
			</c:if>
			<c:forEach begin="${p.startPage}" end="${p.endPage }" var="pageNum">
			<li class="page-item ${cri.page == pageNum ? 'active':''}">
				<a class="page-link" href="${pageNum }">${pageNum }</a>
			</li>
			</c:forEach>
			<c:if test="${p.next}">
			<li class="page-item">
				<a class="page-link" href="${p.endPage+1 }">다음페이지</a>
			</li>
			</c:if>
		</ul>
		
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
			<a class="btn btn-primary" href="${contextPath}/noticeForm">공지등록</a>
		</sec:authorize>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>