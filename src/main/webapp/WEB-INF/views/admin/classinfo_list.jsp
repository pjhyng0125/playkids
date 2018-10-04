<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table class="table table-bordered">
	<tr>
		<th>아이디</th><th>클래스타입</th><th>클래스이름</th><th>클래스등록일</th><th>인증</th>
	</tr>
	<c:forEach items="${list }" var="list">
		<tr>
			<th>${list.bid}</th>
			<th>${list.ctype}</th>
			<th>${list.cname}</th>
			<th>${list.cregdate}</th>
			<th>${list.autho}</th>
		</tr>
	</c:forEach>
</table>