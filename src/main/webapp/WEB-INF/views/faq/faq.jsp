<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<title>FAQ 자주 묻는 질문</title>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.fanswer').hide();
	$("#faqList table").click(function(){
		$(this).parent().children('ul').toggle();
	});
});
</script>
<style type="text/css">
	.question{color:skyblue;}
</style>
</head>

<body>
<center>
<h3>FAQ &nbsp;&nbsp;&nbsp; 자주묻는질문</h3>
<input type="text" size="30" id="search_board" placeholder="검색내용">
<button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i>검색</button>
<hr>
<c:forEach items="${list }" var="faqVO">
	<div id="faqList">	
		<table>
			<tr>
				<td align="left">
					<font class="category_font">${faqVO.fcategory}</font>
				</td>
				<td width="20%">
					<font class="title_font">${faqVO.ftitle}</font>
				</td>
			</tr>
		</table>

		<ul class="fanswer">
			<div>${faqVO.fanswer}</div>
			<br><br><br>
			<font class="question">답변이 충분하지 않으면 1:1 문의서비스를 이용해 주세요.</font>
			&nbsp;&nbsp;&nbsp;<a>1:1 문의서비스 이용하러가기></a>
		</ul>
	</div> 
</c:forEach>
</center>
<hr>
<div class="box-footer">
<div class="text-center">
	<ul class="pagination pagination-lg">
		<c:if test="${pm.prev}">
			
			<li class="page-item"><a class="page-link" href="faqList${pm.makeSearch(pm.startPage - 1) }">prev</a></li>
		</c:if>

		<c:forEach begin="${pm.startPage }"
			end="${pm.endPage }" var="idx">
				<li class="page-item"
					<c:out value="${pm.cri.page == idx?'class =active':''}"/>>
					<a class="page-link" href="faqList${pm.makeSearch(idx)}">${idx}</a>
				</li>
		</c:forEach>

		<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item"><a class="page-link" href="faqList${pm.makeSearch(pm.endPage +1) }">next</a></li>
		</c:if>
	</ul>
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>