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

	
</body>
</html>