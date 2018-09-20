<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table width="100%" border="3">
	<tr>
		<th>아이디</th><th>기업명</th><th>연락처</th><th>가입일</th><th>계좌번호</th>
	</tr>
	<c:forEach items="${list }" var="b">
		<tr>
			<th>${b.bid}</th>
			<th>${b.bname}</th>
			<th>${b.bphone}</th>
			<th>${b.bregdate}</th>
			<th>${b.baccount}</th>
		</tr>
	</c:forEach>