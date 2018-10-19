<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
	
		
		$('#searchBtn').on(
				"click",
				function(event) {

					self.location = "list"
							+ '${pm.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword=" + encodeURIComponent($('#search_board').val());

				});
		
		$('#write').click(function(evt){
			if($('#login_id').val()==null||$('#login_id').val()==''){
		       $('#alert_modal').modal();
				
			}else if($('#login_type').val()!='member'){
				$('#alert_modal3').modal();
			}else{
			   self.location="insert";
			}
			
		});
		
	
	});
</script>
<style type="text/css">
.pagination{
	justify-content: center;
}
.board_line:hover{
	background: #eee;
}
.table_headline{
	font-size: large;
}
.board_table{

}
#board_title{
	margin-left: 30px;
}


</style>
</head>
<body>
<br>
<div id="hidden">
	<input type="hidden" id="login_id" value="${login_id }">
	<input type="hidden" id="login_type" value="${login_type }">
</div>
<div class="container">
<section class="content">
<div class="row">
		<!-- left column -->


<div class="col-md-12">
<div class="box">
<div class="box-header with-border">
<font size="10" id="board_title"> 공지 및  게시판</font>
<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							--선택--</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							타이틀</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자</option>
						
</select> <input type="text" name='keyword' i size="30" id="search_board" placeholder="검색내용" value='${cri.keyword }'>

<button class="btn btn-default" type="button" id="searchBtn"><i class="glyphicon glyphicon-search"></i>검색</button>
<!-- <button type="button" class="btn btn-info" id="write" data-toggle="modal" data-target="#alert_modal">글쓰기</button> -->
<button type="button" class="btn btn-info" id="write">글쓰기</button>
</div>
<hr>

<div class="box-body">
<center>
<table style="width: 90%" class="table">
	<tr class="table_headline" align="center"><td>글 번호</td><td style="width: 10%">카테고리</td><td>제목</td><td>작성자</td><td style="width: 12%">작성일자</td><td style="width: 8%">조회수</td></tr>

	<tbody class="notice_body">
	<c:forEach items="${notice }" var="posting">
		<tr align="center" class="danger">
		<td style="width: 8%"><font color="red"><필독></font></td>
		<td style="width: 8%"><font color="red">공지사항</font></td>
		<td style="width: 60%"><a href='/board/showpage?&bno=${posting.bno}'>${posting.title}
			</a>[${posting.reply_cnt }] 
			<c:choose>
				<c:when test="${posting.newflag==1 }">
						<span class='badge badge-danger'>New</span>
				</c:when>
			</c:choose>
		</td>
		<td>운영자</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${posting.regdate }" /></td>
		<td>${posting.count}</td>
		</tr>
	</c:forEach>
	</tbody>
	
	<tbody class="tbod">
	<c:forEach items="${list }" var="posting">
		<tr align="center" class="board_line">
		<td>${posting.bno}</td>
		<td>${posting.category }</td>
		<td><a href='/board/showpage${pm.makeSearch(pm.cri.page) }&bno=${posting.bno}'>${posting.title}
			</a>[${posting.reply_cnt }] 
			<c:choose>
				<c:when test="${posting.newflag==1 }">
						<span class='badge badge-danger'>New</span>
				</c:when>
			</c:choose>
		</td>
		<td>${posting.mid}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${posting.regdate }" /></td>
		<td>${posting.count}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</center>
</div>

<hr width="70%">
<div class="box-footer">
<div class="text-center">
	<ul class="pagination pagination-lg">
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link" href="list${pm.makeSearch(pm.startPage - 1) }">prev</a></li>
		</c:if>

		<c:forEach begin="${pm.startPage }"
			end="${pm.endPage }" var="idx">
				<li class="page-item"
					<c:out value="${pm.cri.page == idx?'class =active':''}"/>>
					<a class="page-link" href="list${pm.makeSearch(idx)}">${idx}</a>
				</li>
		</c:forEach>

		<c:if test="${pm.next && pm.endPage > 0}">
			<li class="page-item"><a class="page-link" href="list${pm.makeSearch(pm.endPage +1) }">next</a></li>
		</c:if>
	</ul>
</div>
</div>
</div>
</div>
	
	<div class="modal fade" id="alert_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<h3>로그인 필요</h3>
				</div>
				<div class="modal-body">
					<p>해당 기능은 로그인 이후 사용할 수 있습니다.</p>
					<a href="/login">로그인 화면으로 이동하시겠습니까?</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="alert_modal3" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<h3>게시물 작성 권한</h3>
				</div>
				<div class="modal-body">
					<p>해당 기능은 일반 회원만 사용할 수 있습니다.<br>
					 기업 회원은 글쓰기 기능을 이용하실 수 없습니다.</p>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	
	</div>
</section>
</div>

 
<%@include file="/WEB-INF/views/include/footer.jsp" %>