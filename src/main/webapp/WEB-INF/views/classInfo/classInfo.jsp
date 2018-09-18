<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
<style type="text/css">
	#facility_info{width:100px; height: 100px; display:block;}
	#facility_font,#class_intro{font-weight: bolder;}
</style>
</head>
<body>
<div><img alt="" src="${classVO.cpic }" style="width: 100%; height: 300px;"></div>
<hr>
<h3>강사소개</h3>
<div><img alt="" src="${classVO.cteacherpic }" style="width: 150px; height: 170px;"></div>
이름 :${classVO.cteachername }<br>
소개
<div>${classVO.cteacher }</div>


<h3>${classVO.cname }</h3>
상호명 : ${businessVO.bname }<br>
위치 :  ${businessVO.baddress }<br>
연락처 :  ${businessVO.bphone }<br>
권장나이 : ${classVO.cage }<br>
수업일시 : ${classVO.cdate } 

<hr>
<div><font id="class_intro">클래스 소개</font></div>
<div>${classVO.cintro }</div><br><br>

<font id="class_intro">시설정보</font>

<table cellpadding="10">
	<tr>
		<td>
			<img alt="주차공간" src="/resources/image/parking.png" id="facility_info">
		</td>
		<td>
			<img alt="대기실" src="/resources/image/waiting_area.png" id="facility_info">
		</td>
		<td>
			<img alt="참관여부" src="/resources/image/observation.png" id="facility_info">
		</td>
	</tr>
	<tr align="center" id="facility_font">
		<td>
			주차공간 
		</td>
		<td>
			보호자대기실 
		</td>
		<td>
			참관가능여부
		</td>
	</tr>
</table>
<br>
<font id="class_intro">공통정보</font><br> 
- 10분전 까지 도착해주세요.<br>
- 수업시작 1시간 전까지만 환불이 가능합니다.(이후 환불 불가능)<br><br>

<font id="class_intro">유의사항</font><br>
-${classVO.notice }<br><br>

<font id="class_intro">준비물</font><br>
-${classVO.prepare }<br><br>

<font id="class_intro">업체소개</font>
<div><font> ${businessVO.bintro }</font></div>

<div>
 <jsp:include page="/WEB-INF/views/api/mapApi.jsp" />
</div>
</body>
</html>