<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="msgDiv-${message.from_id } col-md-12">
	<div class="message-profile">
		<img class='profileImg' src='/resources/img/man.png'>
		<span class="sender">${message.message_sender }</span>
		<span class="sendTime"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${message.message_sendTime }" /></span>
	</div>
	<div class="message-content">
		<span style='background-color: #ACF3FF; padding: 10px 5px; border-radius: 10px; font-size: 12px;'>${message.message_content }</span>
	</div>
</div>
<!-- msgDiv -->