<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/product.js"></script>
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
			<option value="I" ${cri.type=='I' ? 'selected':''}>상품번호</option>
			<option value="B" ${cri.type=='B' ? 'selected':''}>제조사</option>
		</select>
		</div>
		<div class="form-group">
			<input type="search" class="form-control" name="keyword" value="${cri.keyword}">
		</div>
		<button type="button" class="btn btn-primary">검색</button>
	</form>
	
		<table class="table table-striped table-hover">
			<thead class="thead-dark">
				<tr class="text-center">
					<th style="width: 6%">번호</th>
					<th style="width: 10%">분류</th>
					<th style="width: 12%">제조사</th>
					<th style="width: 22%">이름</th>
					<th style="width: 10%">가격</th>
					<th style="width: 7%">재고</th>
					<th style="width: 15%">보유금액</th>
					<th style="width: 18%">추가일자</th>
				</tr>
			</thead>
			<tbody>
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
								<td>
									<c:choose>
										<c:when test="${p.category eq 'man'}">남성</c:when>
										<c:when test="${p.category eq 'woman'}">여성</c:when>
										<c:when test="${p.category eq 'child'}">아동</c:when>
										<c:when test="${p.category eq 'ACC'}">ACC</c:when>
										<c:when test="${p.category eq 'sports'}">스포츠</c:when>
										<c:when test="${p.category eq 'electronics'}">가전</c:when>
										<c:when test="${p.category eq 'office'}">문구</c:when>
										<c:when test="${p.category eq 'health'}">헬스</c:when>
										<c:when test="${p.category eq 'office'}">etc</c:when>
										<c:otherwise>기타</c:otherwise>
									</c:choose>
								</td>
								<td>${p.brand}</td>
								<td>
									<a href="${contextPath}/product/detail?pid=${p.pid}" class="pname">${p.pname}</a>
								</td>
								<td>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price}"/> 원
								</td>
								<td>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${p.count}"/> 개
								</td>
								<td>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${p.count * p.price}"/> 원
								</td>
								<td>
									<fmt:formatDate value="${p.pdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<c:if test="${p.endPage ne p.startPage}">
			<div class="d-flex justify-content-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${cri.page ne '1'}">
							<li class="page-item">
								<a class="page-link" href="${'1'}"><<</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<a class="page-link" href="javascript:void(0)"><<</a>
							</li>
						</c:otherwise>
					</c:choose>
				
					<c:choose>
						<c:when test="${p.prev}">
							<li class="page-item">
								<a class="page-link" href="${p.startPage-1}"><</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<button class="page-link" href="javascript:void(0)"><</button>
							</li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${p.startPage}" end="${p.endPage }" var="pageNum">
					<li class="page-item ${cri.page == pageNum ? 'active':''}">
						<a class="page-link" href="${pageNum }">${pageNum }</a>
					</li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${p.next}">
							<li class="page-item">
								<a class="page-link" href="${p.endPage+1}">></a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<button class="page-link" href="javascript:void(0)">></button>
							</li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cri.page ne p.tempEndPage}">
							<li class="page-item">
								<a class="page-link" href="${p.tempEndPage}">>></a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<a class="page-link" href="javascript:void(0)">>></a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</c:if>
		
		<a href="${contextPath}/product/add" class="btn btn-primary">새 상품 추가</a>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>