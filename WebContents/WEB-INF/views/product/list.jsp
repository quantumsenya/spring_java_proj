<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>상품 목록</h1>
	</div>
	<div class="row">
		<div class="col-3">
			<ul class="list-group">
				<li class="list-group-item ${tag==p.tag ? 'list-group-primary' : '' }">
					<a href="${contextPath}/product/list">전체</a>
				</li>
				<c:forEach items="${tagList }" var="t">
					<li class="list-group-item ${tag==p.tag ? 'list-group-item-primary : ''}">
						<a href="${contextPath}/board/list/${p.tag}">${p.tag}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="col-9">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>상품 번호</th>
					<th>상품 분류</th>
					<th>상품 이름</th>
					<th>상품 제조사</th>
					<th>상품 가격</th>
					<th>상품 재고</th>
					<th>상품 추가일자</th>
					<th></th>
				</tr>
			</thead>	
			<c:choose>
				<c:when test="${empty product}">
					<tr>
						<td colspan="7" class="text-center"><b>현재 저장된 상품이 없습니다.</b></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${product}" var="p">
						<tr class="text-center">
							<td>${p.pid }</td>
							<td>${p.category }</td>
							<td>
								<a href="${contextPath}/askDetail=${p.pid}" class="pname">${p.pname}</a>
							</td>
							<td>${p.brand}</td>
							<td>${p.price}</td>
							<td>${p.count}</td>
							<td>
								<fmt:formatDate value="${p.pDate}" pattern="yyyy년 MM월 dd일"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<a href="${contextPath}/product/add" class="btn btn-primary">새 상품 추가</a>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>