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
<center>
<h3>클래스 등록 승인 관리</h3>
<hr>
<table style="width: 80%">
	<tr>
		<th>아이디</th><th>클래스타입</th><th>클래스이름</th><th>클래스등록일</th><th>인증</th>
	</tr>
	<c:forEach items="${list }" var="list">
		<tr>
			<td>${list.bid}</td>
			<td>${list.ctype}</td>
			<td>${list.cname}</td>
			<td>${list.cregdate}</td>
			<c:choose>
				<c:when test="${list.autho=='false'}">
					<td><a href="/class/info?cno=${list.cno }">
					<button type="button" class="btn btn-danger moveClass" >비승인</button>
					</a></td>
							
				</c:when>
				<c:otherwise>
					<td><span class="badge badge-info">승인 완료</span></td>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>
</center>

</body>
</html>