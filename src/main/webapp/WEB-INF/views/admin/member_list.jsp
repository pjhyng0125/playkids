<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table class="table table-bordered">
	<tr>
		<th>아이디</th><th>이름</th><th>연락처</th><th>생년월일</th><th>관심분야</th><th>가입일</th><th>캐쉬</th>
	</tr>
	<c:forEach items="${list }" var="mem">
	<tr>
		<th>${mem.mid }</th>
		<th>${mem.mname }</th>
		<th>${mem.mphone }</th>
		<th>${mem.mbirth }</th>
		<th>${mem.minterest }</th>
		<th>${mem.mregdate }</th>
		<th>${mem.mcash }</th>
		 
	</tr>	
	</c:forEach>
</table>
