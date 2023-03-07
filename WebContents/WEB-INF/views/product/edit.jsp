<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>상품 세부정보</h1>
	</div>
	
	<div>
		<form action="${contextPath}/product/edit" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<table class="table">
			<tr>
				<th>상품번호</th>
				<td><input type="number" class="form-control" name="pid" value="${product.pid}" readonly="readonly"></td>
				<th>상품분류</th>
				<td>
					<select name="category" class="form-control" value="${product.category }">
						<option value="man">남성</option>
						<option value="woman">여성</option>
						<option value="child">아동</option>
						<option value="ACC">ACC</option>
						<option value="sports">스포츠</option>
						<option value="electronics">가전</option>
						<option value="office">문구</option>
						<option value="health">헬스</option>
						<option value="etc">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품이름</th>
				<td><input type="text" class="form-control" name="pname" value="${product.pname}"></td>
				<th>브랜드</th>
				<td><input type="text" class="form-control" name="brand" value="${product.brand}"></td>
			</tr>
			<tr>
				<th>상품가격 (원)</th>
				<td>
					<input type="number" class="form-control" name="price" value="${product.price}">
				</td>
				<th>재고수량 (개)</th>
				<td>
					<input type="number" class="form-control" name="count" value="${product.count}">
				</td>
			</tr>
				<th>재고 보유금액</th>
				<td>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.count * product.price}"/> 원
				</td>
				<th>추가일자</th>
				<td>
					<input type="text" class="form-control" name="pdate" value="${product.pdate}" readonly="readonly">
				</td>
			</tr>
		</table>
		<button class="btn btn-primary">수정</button>
		</form>
		<form action="${contextPath}/product/delete" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="pid" value="${product.pid}">
			<button class="btn btn-warning">삭제</button>
		</form>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>