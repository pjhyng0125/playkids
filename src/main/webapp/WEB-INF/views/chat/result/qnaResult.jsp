<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="msgDiv-${message.from_id } col-md-12">
	<div style='padding-right: 0px; padding-left: 0px;'>
		<img id='profileImg' src='/resources/img/man.png'
			style='width: 50px; height: 50px;'> <span
			style='background-color: #ACF3FF; padding: 10px 5px; border-radius: 10px; font-size: 12px;'>${message.message_content }</span>
		<div style='font-size: 9px; clear: both;'>${message.message_sender }</div>
		<div class="col-md-12" style='font-size: 9px;'>
			<span style='font-size: 9px; text-align: right;'><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${message.message_sendTime }"/></span>
		</div>
	</div>
</div>
<!-- msgDiv -->