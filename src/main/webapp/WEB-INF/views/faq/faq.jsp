<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<title>FAQ 자주 묻는 질문</title>
<% pageContext.setAttribute("nl", "\n"); %>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){	

	$('#write').click(function(){
		self.location="faqInsert";
	});
	
	$('.fanswer').hide();
	$('.fanswer').hide();
	$("#faqList table").click(function(){
		$(this).parent().children('ul').toggle();
	});

});
	

</script>
<style type="text/css">
	.question{color:skyblue;}
table, td{text-align:center;}
table {border-collapse: collapse; width: 70%;}
td {padding: 15px;}
#divAnswer{width:35%; text-align: left; }
</style>
</head>

<body>
<center>
<h3>FAQ &nbsp;&nbsp;&nbsp; 자주묻는질문</h3>   
<hr>
<form action="/faq/faqModify" method="post">
<c:forEach items="${list }" var="faqVO">
	<div id="faqList">	
		<table>
			<tr>
				<td width="33%">
					<font class="category_font">${faqVO.fcategory}</font>
				</td>
				<td width="33%">
					<font class="title_font">${faqVO.ftitle}</font>
				</td>
				<td width="33%">
					<button type="button" class="btn btn-warning" onclick="location.href='/faq/faqModify?fno=${faqVO.fno }'">수정</button>
				</td>
			</tr>
		</table>

		<ul class="fanswer">
			<div id="divAnswer">${fn:replace(faqVO.fanswer,nl,"<br/>")}</div>
			<br><br><br>
			<font class="question">답변이 충분하지 않으면 1:1 문의서비스를 이용해 주세요.</font>
			&nbsp;&nbsp;&nbsp;<a>1:1 문의서비스 이용하러가기></a>
		</ul>
	</div> 
</c:forEach>
</form>
<hr>
<button class="btn btn-info" id="write">작성</button>
</center>
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