<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table class="table table-bordered">
	<tr>
		<th>아이디</th><th>클래스타입</th><th>클래스이름</th><th>클래스등록일</th><th>인증</th>
	</tr>
	<c:forEach items="${list }" var="adminVO">
		<tr>
			<th>${adminVO.bid}</th>
			<th>${adminVO.ctype}</th>
			<th>${adminVO.cname}</th>
			<th>${adminVO.cregdate}</th>
			<th>${adminVO.autho}</th>
		</tr>
	</c:forEach>
</table>