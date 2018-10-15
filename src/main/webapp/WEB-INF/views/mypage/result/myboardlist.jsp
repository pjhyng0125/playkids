<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<table class="table table-bordered table-responsive  myboardTable">
		<tr class="info"><th>글 번호</th><th>카테고리</th><th>제목</th><th>작성일자</th></tr>
		<c:forEach items="${myBoard }" var="myBoard">
		<tr><td>${myBoard.bno }</td>
		<td>${myBoard.category }</td>
		<td><a href="/board/showpage?bno=${myBoard.bno }">${myBoard.title }</a></td>
		<td><fmt:formatDate value="${myBoard.regdate }" pattern="yyyy-MM-dd"/></td></tr>
		</c:forEach>
	</table>