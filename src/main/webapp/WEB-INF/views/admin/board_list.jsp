<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

	$(function(){
		$('#write_notice').click(function(){
			//alert('hi!')
			self.location="adminInsert";
		});
	});
	
</script>

<table class="table table-bordered">

	
	<br>
	<h3>게시물 현황</h3> <button type="button" class="btn btn-danger" id="write_notice">공지사항 작성하기</button>
	<hr>
<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
<table>
	<tr>
		<th>No.</th><th>아이디</th><th>제목</th><th>내용</th><th>등록일</th><th>조회수</th>
	</tr>
	<c:forEach items="${list }" var="board">
		<tr>
			<td>${board.bno}</td>
			<td>${board.mid}</td>
			<td>${board.title}</td>
			<td>${board.content}</td>
			<td>${board.regdate}</td>
			<td>${board.count}</td>
		</tr>
	</c:forEach>
</table> 

<div class="box-footer">
<div class="text-center">
	<ul class="pagination pagination-lg">
		<c:if test="${pm.prev}">
			
			<li class="page-item"><a class="page-link" href="admin${pm.makeSearch(pm.startPage - 1) }">prev</a></li>
		</c:if>

		<c:forEach begin="${pm.startPage }"
			end="${pm.endPage }" var="idx">
				<li class="page-item"
					<c:out value="${pm.cri.page == idx?'class =active':''}"/>>
					<a class="page-link" href="admin${pm.makeSearch(idx)}">${idx}</a>
				</li>
		</c:forEach>

		<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item"><a class="page-link" href="admin${pm.makeSearch(pm.endPage +1) }">next</a></li>
		</c:if>
	</ul>
</div>
</div>
</body>
</html>