<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>상품 추가</h1>
	</div>
	
	<form class="form-horizontal" action="${contextPath}/product/add" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
			<label class="control-label col-sm-2" for="category">분류:</label>
			<div class="col-sm-10">
				<select name="category" class="form-control">
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
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="pname">상품명:</label>
			<div class="col-sm-10">
				<input type="text" name="pname" class="form-control" placeholder="상품 이름을 입력하세요" required="required">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="brand">브랜드:</label>
			<div class="col-sm-10">
				<input type="text" name="brand" class="form-control" placeholder="제품 브랜드를 입력하세요" required="required">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="price">가격:</label>
			<div class="col-sm-10">
				<input type="number" name="price" class="form-control" placeholder="제품 가격을 입력하세요" required="required">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="count">재고:</label>
			<div class="col-sm-10">
				<input type="number" name="count" class="form-control" placeholder="제품 재고 수량을 입력하세요" required="required">
			</div>
		</div>
		
		<button class="btn btn-primary">추가</button>
		<button type="reset" class="btn btn-warning">초기화</button>
	</form>
</div>


<%@ include file="../layout/footer.jsp" %>