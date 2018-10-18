<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<table class="table  table-striped table-hover table-bordered table-responsive  businesspayTable">
		<thead class="thead-dark"><tr class="info"><th>카테고리</th><th>클래스</th><th>구매자</th><th>어린이</th><th>나이</th><th>가격</th><th>결제 날짜</th></tr></thead>
		<tbody><c:forEach items="${businessPaylist }" var="businessPaylist">
		<tr><td>${businessPaylist.ctype }</td>
		<td><input type="hidden" value="${businessPaylist.cno }">${businessPaylist.cname }</td>
		<td>${businessPaylist.mid }</td>
		<td>${businessPaylist.dname }</td>
		<td>${businessPaylist.dage }세</td>
		<td><fmt:formatNumber value="${businessPaylist.price }" type="currency" currencySymbol=""/>원</td>
		<td><fmt:formatDate value="${businessPaylist.regdate }" pattern="yyyy-MM-dd"/></td></tr>
		</c:forEach></tbody>
	</table>