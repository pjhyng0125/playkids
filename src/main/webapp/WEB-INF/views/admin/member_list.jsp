<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<th>아이디</th><th>이름</th><th>연락처</th><th>생년월일</th><th>관심분야</th><th>가입일</th><th>캐쉬</th>
	</tr>
	<c:forEach items="${list }" var="member">
	<tr>
		<td>${member.mid }</td>
		<td>${member.mname }</td>
		<td>${member.mphone }</td>
		<td>${member.mbirth }</th>
		<td>${member.minterest }</td>
		<td>${member.mregdate }</td>
		<td>${member.mcash }</td>
		 
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