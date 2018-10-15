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
		<th>아이디</th><th>클래스타입</th><th>클래스이름</th><th>클래스등록일</th><th>인증</th>
	</tr>
	<c:forEach items="${list }" var="list">
		<tr>
			<td>${list.bid}</td>
			<td>${list.ctype}</td>
			<td>${list.cname}</td>
			<td>${list.cregdate}</td>
			<td>${list.autho}</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>