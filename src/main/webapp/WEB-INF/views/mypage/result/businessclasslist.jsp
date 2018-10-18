<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table class="table table-striped table-hover table-bordered table-responsive businessclassTable ">
		<thead class="thead-dark"><tr class="info"><th>카테고리</th><th>클래스명</th><th>클래스 강의일자</th><th>클래스 등록일자</th><th>인증 여부</th></tr></thead>
		<tbody><c:forEach items="${regClasslist }" var="regClasslist">
		<tr><td>${regClasslist.ctype }</td>
		<td><input type="hidden" value="${regClasslist.cno }">${regClasslist.cname }</td>
		<td>${regClasslist.cdate }</td>
		<td><fmt:formatDate value="${regClasslist.cregdate }" pattern="yyyy-MM-dd"/></td>
		<td>${regClasslist.autho }</td>
		</c:forEach></tbody>
	</table>