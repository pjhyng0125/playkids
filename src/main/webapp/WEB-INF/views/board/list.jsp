<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
.board_line:hover{
	background: #eee;
}
.table_headline{
	font-size: large;
}
.board_table{

}


</style>
</head>
<body>
<br>
<section class="content">
<div class="row">
		<!-- left column -->


<div class="col-md-12">
<div class="box">
<div class="box-header with-border">
<font size="10">공지 및  게시판</font>
<span class="dropdown">
<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">분류
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
      <li role="presentation" class="dropdown-header">검색할 내용을 선택하세요</li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">제목</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">내용</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">작성자</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">카테고리</a></li>
    </ul>
</span>	
<input type="text" size="30" id="search_board" placeholder="검색내용">
<button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i>검색</button>
<button class="btn btn-info" id="write">글쓰기</button>
</div>
<hr>


<div class="box-body">
<center>
<table style="width: 70%" class="table">
	<tr class="table_headline" align="center"><td>글 번호</td><td width="30%">제목</td><td>작성자</td><td>작성일자</td><td>조회수</td></tr>
	<tbody class="tbod">
	<c:forEach items="${list }" var="posting">
		<tr align="center" class="board_line">
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
<hr width="70%">
<div class="box-footer">
<div class="text-center">
	<ul class="pagination pagination-lg">
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