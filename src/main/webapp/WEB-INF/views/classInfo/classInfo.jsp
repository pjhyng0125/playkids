<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${classVO.cname } 수업</title>
<%-- css/bootstrap --%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css">
<link href="/resources/bootstrap/css/animate.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/animate.css" rel="stylesheet" />
<link href="/resources/bootstrap/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/bootstrap/css/style.css" rel="stylesheet">

<style type="text/css">
	#facility_info{width:100px; height: 100px; display:block;}
	#facility_font,#class_intro{font-weight: bolder; color: black;}
	#class_form{margin-left: 40px;}
	#class_font{font-size: 15px; margin-left: 10px;}
	#class_cfont{font-size: 18px; margin-left: 10px;}
	#class_title{font-size: 20px; font-weight: bolder; color: black;}
	#class_pic{border-radius: 10px; box-shadow: 0px 0px 20px -5px;}
	         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                     
         
         /* nav tag */
         nav1 ul{padding-top:30px;}                     /*  상단 여백 10px  */
         nav1 ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            font:bold 17px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding: 95px;                         /* 각 메뉴 간격 */
        }     
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<div><img alt="수업사진" src="${classVO.cpic }" id="class_pic" style="width: 100%; height: 380px;"></div>
<hr>
<form id="class_form">
<font id="class_title">강사소개</font>
<div><img alt="선생님사진" src="${classVO.cteacherpic }" id="class_pic" alt="Cinque Terre" style="width: 150px; height: 170px;"></div>
이름 : <font class="text-dark">${classVO.cteachername }</font><br>
소개
<div id="class_font" class="text-dark">${classVO.cteacher }</div><br>


<font id="class_title">${classVO.cname }</font>
<div id="class_cfont" class="text-dark">
상호명 : ${businessVO.bname }<br>
위치 :  ${businessVO.baddress }<br>
연락처 :  ${businessVO.bphone }<br>
권장나이 : ${classVO.cage }<br>
수업일시 : <fmt:formatDate pattern="yyyy-mm-dd" value="${classVO.cdate }"/> 
</div>

<hr>
<div><font id="class_intro">클래스 소개</font></div><br>
<div id="class_font" class="text-dark">${classVO.cintro }</div><br><br>

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
</div><br><br>
</form>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="/resources/bootstrap/js/jquery.prettyPhoto.js"></script>
  <script src="/resources/bootstrap/js/jquery.isotope.min.js"></script>
  <script src="/resources/bootstrap/js/wow.min.js"></script>
  <script src="/resources/bootstrap/js/jquery.easing.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8HeI8o-c1NppZA-92oYlXakhDPYR7XMY"></script>
  <script src="/resources/bootstrap/js/main.js"></script>
  <script src="/resources/bootstrap/contactform/contactform.js"></script>
</body>
</html>