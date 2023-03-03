<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>상품 세부정보</h1>
	</div>
	
	<div>
		<table class="table">
			<tr>
				<th>상품번호</th>
				<td>${product.pid}</td>
				<th>상품분류</th>
				<td>
					<c:choose>
						<c:when test="${product.category eq 'man'}">남성</c:when>
						<c:when test="${product.category eq 'woman'}">여성</c:when>
						<c:when test="${product.category eq 'child'}">아동</c:when>
						<c:when test="${product.category eq 'ACC'}">ACC</c:when>
						<c:when test="${product.category eq 'sports'}">스포츠</c:when>
						<c:when test="${product.category eq 'electronics'}">가전</c:when>
						<c:when test="${product.category eq 'office'}">문구</c:when>
						<c:when test="${product.category eq 'health'}">헬스</c:when>
						<c:when test="${product.category eq 'office'}">etc</c:when>
						<c:otherwise>기타</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>상품이름</th>
				<td>${product.pname}</td>
				<th>브랜드</th>
				<td>${product.brand}</td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}"/> 원
				</td>
				<th>재고수량</th>
				<td>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.count}"/> 개
				</td>
			</tr>
				<th>재고 보유금액</th>
				<td>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.count * product.price}"/> 원
				</td>
				<th>추가일자</th>
				<td>
					<fmt:formatDate value="${product.pdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
				</td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" onclick="history.go(-1)">목록</button>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>