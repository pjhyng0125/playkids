<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<table class="table table-striped table-hover table-bordered table-responsive  myboardTable">
		<thead class="thead-dark">
		<tr class="info"><th>글 번호</th><th>카테고리</th><th>제목</th><th>작성일자</th></tr></thead>
		<tbody>
		<c:forEach items="${myBoard }" var="myBoard">
		<tr><td>${myBoard.bno }</td>
		<td>${myBoard.category }</td>
		<td><input type="hidden" value="${myBoard.bno }">${myBoard.title }</td>
		<td><fmt:formatDate value="${myBoard.regdate }" pattern="yyyy-MM-dd"/></td></tr>
		</c:forEach>
		</tbody>
	</table>