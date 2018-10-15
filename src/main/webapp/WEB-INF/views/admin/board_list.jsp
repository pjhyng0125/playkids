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


</body>
</html>