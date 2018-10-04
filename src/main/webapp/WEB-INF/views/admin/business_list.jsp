<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table class="table table-bordered">
	<tr>
		<th>아이디</th><th>기업명</th><th>연락처</th><th>가입일</th><th>계좌번호</th>
	</tr>
	<c:forEach items="${list }" var="adminVO">
		<tr>
			<th>${adminVO.bid}</th>
			<th>${adminVO.bname}</th>
			<th>${adminVO.bphone}</th>
			<th>${adminVO.bregdate}</th>
			<th>${adminVO.baccount}</th>
		</tr>
	</c:forEach>
</table>
