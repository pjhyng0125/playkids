<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${classVO.cname } 수업</title>
<% pageContext.setAttribute("comma", ","); %>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style type="text/css">
	#facility_info{width:100px; height: 100px; display:block;}
	#facility_font,#class_intro{font-weight: bolder; color: black;}
	#class_form{margin-left: 40px;}
	#class_font{font-size: 15px; margin-left: 10px;}
	#class_cfont{font-size: 18px; margin-left: 10px;}
	#class_title{font-size: 20px; font-weight: bolder; color: black;}
	#class_pic{border-radius: 10px; box-shadow: 0px 0px 20px -5px;}
	#buttb1{width: 20%;}
	
</style>
<script type="text/javascript">
	$(function(){
		$('#park,#protect,#together').hide();
		
		var park='${classVO.park}'
		var protect='${classVO.protect}'
		var together='${classVO.together}'
		
		if(park=='use') $('#park').show();
		if(protect=='use') $('#protect').show();
		if(together=='use') $('#together').show();
		
	
		
		
		
	
	});
</script>
<input type="hidden" value="${classVO.cno}" name="cno">
<div><img alt="수업사진" src="/resources/upload/class/${classVO.cpic }" id="class_pic" style="width: 100%; height: 380px;"></div>
<hr>
<font id="class_title">강사소개</font>
<form id="class_form">
<div><img alt="선생님사진" src="/resources/upload/teacher/${classVO.cteacherpic }" id="class_pic" alt="Cinque Terre" style="width: 150px; height: 170px;"></div>
이름 : <font class="text-dark">${classVO.cteachername }</font><br>
소개
<div id="class_font" class="text-dark">${classVO.cteacher }</div><br>


<font id="class_title">${classVO.cname }</font>
<div id="class_cfont" class="text-dark">
상호명 : ${businessVO.bname }<br>
위치 :  ${businessVO.baddress }<br>
연락처 :  ${businessVO.bphone }<br>
권장나이 : ${fn:replace(classVO.cage,comma,"세~") }세<br>


<%-- 수업일시 : <fmt:formatDate pattern="yyyy-MM-dd" value="${classVO.cdate }"/>  --%>
수업일시 : <fmt:parseDate pattern="yyyy-MM-dd" value='${classVO.cdate }' var="parsedDate"/>
<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDate }"/>
</div>

<hr>
<div><font id="class_intro">클래스 소개</font></div><br>
<div id="class_font" class="text-dark">${classVO.cintro }</div><br><br>

<font id="class_intro">시설정보</font>

<table cellpadding="10">
	<tr>
		<td id="park">
			<img alt="주차공간" src="/resources/image/parking.png" id="facility_info">
			<div align="center">주차공간</div>
		</td>
		<td id="protect">
			<img alt="대기실" src="/resources/image/waiting_area.png" id="facility_info">
			<div align="center">대기실</div>
		</td>
		<td id="together">
			<img alt="참관여부" src="/resources/image/observation.png" id="facility_info">
			<div align="center">참관가능여부</div>
		</td>
	</tr>
</table>
<br>
<font id="class_intro">공통정보</font><br> 
<font class="text-primary" id="class_font">&nbsp;&nbsp;10분전 까지 도착해주세요.</font><br>
<font class="text-primary" id="class_font">&nbsp;&nbsp;수업시작 1시간 전까지만 환불이 가능합니다.(이후 환불 불가능)</font><br><br>

<font id="class_intro">유의사항</font><br>
<div id="class_font" class="text-dark">${classVO.notice }</div><br><br>

<font id="class_intro">준비물</font><br>
<div id="class_font" class="text-dark">${classVO.prepare }</div><br><br>

<div id="class_intro">업체소개</div><br>
<div id="class_font" class="text-dark">${businessVO.bintro }</div><br><br>
<div>
<jsp:include page="/WEB-INF/views/api/mapApi.jsp" />
</div><br><br><br>

	<button id="buy" class="btn btn-info">구매하기</button> 
	<a class="btn btn-warning" id="charge" href="javascript:history.back()">이전 페이지로</a>
		<c:if test="${login_id=='manager' }">
			<button class="btn btn-danger" id="admin">인증하기</button> 
			<a href="/admin" class="btn btn-danger">관리자페이지</a>
		</c:if>

<br><br><br><br>
</form>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
