<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<div class="container">
	<div>
	<h3>기업 회원 가입</h3><br>
		<table cellspacing="5" cellpadding="10">
			<tr>
				<td width="150px">아이디:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>비밀번호:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>비밀번호 확인:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>기업명:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>주소:</td>
					<td>
						<select>
							<option>노원구</option>
		               	</select>
				    </td>
				    <td>
						<select>
							<option>중계동</option>
		               	</select>
				    </td>
			</tr>
			<tr>
				<td>전화번호:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>관심분야:</td>
					<td>
						<select>
							<option>야외활동</option>
							<option>실내활동</option>
		               	</select>
				    </td>
				    <td>
						<select>
							<option>축구</option>
							<option>농구</option>
		               	</select>
				    </td>
			</tr>
			<tr>
				<td>기업소개:</td><td colspan="2"><textarea cols="22px" rows="4px"></textarea></td>
			</tr>
		</table>
		<br><br>
<!--기업 회원 가입-계좌번호 등록-->
		<div>
		<h4>계좌번호 등록</h4><br>
	<div>
<pre>
기업 준수 사항
 계좌 번호 등록 안내
</pre>
	</div>
	<table cellspacing="5" cellpadding="10">
		<tr>
			<td width="150px">계좌번호:</td><td><input type="text"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원가입">
				<input type="button" value="취소">
			</td>
		</tr>
	</table>
	</div>
	</div>
</div>
</center>
</body>
</html>