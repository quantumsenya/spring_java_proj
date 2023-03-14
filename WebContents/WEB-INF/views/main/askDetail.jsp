<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron text-center p-3 my-3 bg-dark text-white">
		<h1>회원문의</h1>
	</div>
	<div class="jumbotron">
		<h2>${board.title}</h2>
		<hr>
		${board.content}
		<hr>
		<div class="text-center">
			<h6>
				<span class="badge badge-pill badge-primary">${board.writer}</span>
				<span class="badge badge-pill badge-secondary">${board.writeDate}</span>
			</h6>
		</div>
		<hr>
		<!-- 댓글 -->
		
		<c:if test="${empty reply}">
			<b>작성된 댓글이 없습니다.</b>
			<hr>
		</c:if>
		
		<div>
			<c:forEach items="${reply}" var="r">
			<div>
				<p><b>${r.writer}</b> <span class="badge badge-pill badge-secondary"><fmt:formatDate value="${r.replyDate}" pattern="MM/dd HH:mm"/></span></p>
				<p>${r.content}</p>
			</div>
			<c:if test="${r.writer eq memberInfo.memberId}">
				<div>
					<form action="${contextPath}/reply/delete" method="post">
			        	<input type="hidden" name="bno" value="${r.bno}">
			        	<input type="hidden" name="rno" value="${r.rno}">
			        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			        	<button class="badge badge-danger">삭제</button>
					</form>
				</div>
			</c:if>
			<hr>
			</c:forEach>
		</div>
		
		
		<div>
		    <form method="post" action="${contextPath}/reply/write">
		    	<div class="form-group">
					<label class="control-label col-sm-2" for="writer">작성자</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="writer" value="${memberInfo.memberId}" readonly="readonly">
					</div>
				</div>
		        <div>
		            <textarea rows="5" cols="50" class="form-control" name="content" autofocus="autofocus" required="required"></textarea>
		        </div>
		        <div>
		        	<input type="hidden" name="bno" value="${board.bno}">
		        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		            <button class="btn btn-primary" type="submit">댓글 작성</button>
		        </div>
		    </form>
		    
		</div>
		<!-- 댓글끝 -->
		
	</div>
	<div>
		<a href="${contextPath}/askList" class="btn btn-info">목록</a>
	</div>
</div>


<%@ include file="../layout/footer.jsp" %>