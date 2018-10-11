<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table class="table table-bordered table-responsive myclassStatus-reserveTable ">
		<tr class="info"><th>카테고리</th><th>예약된 클래스</th><th>어린이</th><th>나이</th><th>예약 날짜</th></tr>
		<c:forEach items="${myClassList }" var="myclass">
		<tr><td>${myclass.ctype }</td>
		<td><a href="/class/info?cno=${myclass.cno }">${myclass.cname }</a></td>
		<td>${myclass.dname }</td>
		<td>${myclass.dage }세</td>
		<td><fmt:formatDate value="${myclass.regdate }" pattern="yyyy-MM-dd"/> &nbsp;
		<input type="hidden" name="rno" value="${myclass.rno }">
		<button class="btn btn-default" id="canclePayment" type="button">결제취소</button>
		<input type="hidden" name="mcash" value="${myclass.price }">
		</td></tr>
		</c:forEach>
	</table>

	<table class="table table-bordered table-responsive myclassStatus-completeTable">
		<tr class="info"><th>카테고리</th><th>완료된 클래스</th><th>어린이</th><th>나이</th><th>완료 날짜</th></tr>
		<c:forEach items="${myClassList }" var="myclass">
		<tr><td>${myclass.ctype }</td>
		<td><a href="/class/info?cno=${myclass.cno }">${myclass.cname }</a></td>
		<td>${myclass.dname }</td>
		<td>${myclass.dage }세</td>
		<td><fmt:formatDate value="${myclass.regdate }" pattern="yyyy-MM-dd"/></td></tr>
		</c:forEach>
	</table>