<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/docoding/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>

<h3>정보 공유 게시판</h3>
<hr>
</div>
<center>

<table >
	<tr><th>카테고리</th><th width="30%">제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>
	<tbody>
	<c:forEach items="${list }" var="posting">
		<tr align="center">
		<td>${posting.category}</td>
		<td>${posting.title}</td>
		<td>${posting.mid}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${posting.regdate }" /></td>
		<td>${posting.count}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>


<div class="text-center">
	<ul class="pagination">
	<c:if test="${pm.prev}">
		<li><a
		href="list${pm.makeSearch(pm.startPage - 1) }">prev</a></li>
	</c:if>

	<c:forEach begin="${pm.startPage }"
		end="${pm.endPage }" var="idx">
			<li
				<c:out value="${pm.cri.page == idx?'class =active':''}"/>>
				<a href="list${pm.makeSearch(idx)}">${idx}</a>
			</li>
	</c:forEach>

	<c:if test="${pm.next && pm.endPage > 0}">
			<li><a
				href="list${pm.makeSearch(pm.endPage +1) }">next</a></li>
	</c:if>
	</ul>
</div>
</center>

</body>
</html>