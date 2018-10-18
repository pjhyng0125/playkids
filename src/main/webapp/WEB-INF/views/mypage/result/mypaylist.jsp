<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<table class="table table-striped table-hover table-bordered table-responsive  mypayTable">
		<thead class="thead-dark">
		<tr class="info"><th>카테고리</th><th>클래스</th><th>어린이</th><th>나이</th><th>가격</th><th>결제 날짜</th></tr></thead>
		<tbody>
		<c:forEach items="${myClassList }" var="myclass">
		<tr><td>${myclass.ctype }</td>
		<td><input  type="hidden" value="${myclass.cno }">${myclass.cname }</td>
		<td>${myclass.dname }</td>
		<td>${myclass.dage }세</td>
		<td><fmt:formatNumber value="${myclass.price }" type="currency" currencySymbol=""/>젤리</td>
		<td><fmt:formatDate value="${myclass.regdate }" pattern="yyyy-MM-dd"/></td></tr>
		</c:forEach>
		</tbody>
	</table>