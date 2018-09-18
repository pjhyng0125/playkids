<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#write').click(function(evt){
			self.location="insert";
		});
	});
</script>
<style type="text/css">
.pagination{
	justify-content: center;
}

</style>
</head>
<body>
<section class="content">
<div class="row">
		<!-- left column -->


<div class="col-md-12">
<div class="box">
<div class="box-header with-border">
<font size="10">정보 공유 게시판</font>	<button class="btn btn-primary" id="write">글쓰기</button>
</div>
<hr>


<div class="box-body">
<center>
<table >
	<tr><th>글 번호</th><th width="30%">제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>
	<tbody class="tbod">
	<c:forEach items="${list }" var="posting">
		<tr align="center">
		<td>${posting.bno}</td>
		<td><a href='/board/showpage${pm.makeSearch(pm.cri.page) }&bno=${posting.bno}'>${posting.title}
			</a></td>
		<td>${posting.mid}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${posting.regdate }" /></td>
		<td>${posting.count}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</center>
</div>

<div class="box-footer">
<div class="text-center">
	<ul class="pagination">
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link" href="list${pm.makeSearch(pm.startPage - 1) }">prev</a></li>
		</c:if>

		<c:forEach begin="${pm.startPage }"
			end="${pm.endPage }" var="idx">
				<li class="page-item"
					<c:out value="${pm.cri.page == idx?'class =active':''}"/>>
					<a class="page-link" href="list${pm.makeSearch(idx)}">${idx}</a>
				</li>
		</c:forEach>

		<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item"><a class="page-link" href="list${pm.makeSearch(pm.endPage +1) }">next</a></li>
		</c:if>
	</ul>
	</div>
</div>
</div>
</div>
</div>
</section>
</body>
</html>