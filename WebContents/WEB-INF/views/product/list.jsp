<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<input type="hidden" value="${category}" class="category">
<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>상품 목록</h1>
	</div>
	
	<form class="form-inline searchForm">
		<div class="form-group">
			<select class="form-control category">
				<option value="">====전체====</option>
				<option value="man" ${category=='man' ? 'selected':''}>남성</option>
				<option value="woman" ${category=='woman' ? 'selected':''}>여성</option>
				<option value="child" ${category=='child' ? 'selected':''}>아동</option>
				<option value="ACC" ${category=='ACC' ? 'selected':''}>ACC</option>
				<option value="sports" ${category=='sports' ? 'selected':''}>스포츠</option>
				<option value="electronics" ${category=='electronics' ? 'selected':''}>가전</option>
				<option value="office" ${category=='office' ? 'selected':''}>문구</option>
				<option value="health" ${category=='health' ? 'selected':''}>헬스</option>
				<option value="etc" ${category=='etc' ? 'selected':''}>기타</option>
			</select>
		</div>
		<div class="form-group">
		<select class="form-control" name="type">
			<option value="N" >이름</option>
			<option value="I" ${cri.type=='I' ? 'selected':''}>ID</option>
			<option value="B" ${cri.type=='B' ? 'selected':''}>브랜드</option>
		</select>
		</div>
		<div class="form-group">
			<input type="search" class="form-control" name="keyword" value="${cri.keyword}">
		</div>
		<button type="button" class="btn btn-primary">검색</button>
	</form>
	
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
		
		<a href="${contextPath}/product/add" class="btn btn-primary">새 상품 추가</a>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>