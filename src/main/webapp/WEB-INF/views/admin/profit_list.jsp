<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table class="table table-bordered">
	<tr>
		<th>수익금</th><th>수익일</th>
	</tr>
	<c:forEach items="${list }" var="pro">
		<tr>
			<th>${pro.profit}</th>
			<th>${pro.pregdate}</th>
		</tr>
	</c:forEach>
</table>