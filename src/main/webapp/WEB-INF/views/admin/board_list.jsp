<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table class="table table-bordered">
	<tr>
		<th>No.</th><th>아이디</th><th>제목</th><th>내용</th><th>등록일</th><th>조회수</th>
	</tr>
	<c:forEach items="${list }" var="board">
		<tr>
			<th>${board.bno}</th>
			<th>${board.mid}</th>
			<th>${board.title}</th>
			<th>${board.content}</th>
			<th>${board.regdate}</th>
			<th>${board.count}</th>
		</tr>
	</c:forEach>
</table> 
