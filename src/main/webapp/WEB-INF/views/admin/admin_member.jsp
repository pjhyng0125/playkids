<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <jsp:includ page="/WEB-INF/views/include/header.jsp"/> --%>
  <table class="table table-bordered">
	<tr>
		<th>아이디</th><th>이름</th><th>연락처</th><th>생년월일</th>
	</tr>

	<c:forEach items="${list }" var="adminVO">
	<tr>
		<td>${adminVO.mid }</td>
		<td>${adminVO.mname }</td>
		<td>${adminVO.mphone }</td>
		<td>${adminVO.mbirth }</td>
	</tr>	
	</c:forEach>
</table>