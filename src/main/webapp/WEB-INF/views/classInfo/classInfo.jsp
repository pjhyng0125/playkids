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
		
	
		$('#admin').click(function(){
			var cno = $('#cno').val()
			alert('cno>>'+cno)
			
			$.ajax({
					url:'/class/update',
					data:{'cno':$('#cno').val()},
					type: 'post',
					success:function(result){
						if(result=='true'){
							$('#alert_modal2').modal();
						}
					}
			});
		});
		
		$('#buy').click(function(){
			$('#alert_modal').modal()
		});
		
		var baby_cnt=0; 
		var flag=false;
		var price =$('#price').val()
		var dno_stack = new Array();				// 복수의 dno에 대한 insert하기 위한 작업
		$('.baby_count').click(function(){					// 초록버튼
			
			
			baby_cnt++
			
			var remain = $('#member_cash').html()-(baby_cnt*price)	// remain = 잔여젤리 - 비용 
			
			if(remain>=0){
				var id_con = $(this).val()
				$('#cost').html(baby_cnt*price)
				$('#baby_cnt').html(baby_cnt)
				$('#member_cash_in').html(remain)
				
				$(this).toggle(function(){
					var str = " "+"<button type='button' class='btn btn-warning cancel' style='width: 45%' id='"+id_con+"'>"
							  +$(this).html()+"</button>"				// 추가할 내용
					var str2 = $('#buylist').html()			// 추가할 div 영역
					$('#buylist').html(str2+str)
					
					//dno_stack_temp = dno_stack
					dno_stack.push($(this).val())
					
					
				})
			}else{
				alert('잔액 부족으로 인해 더이상 추가 신청이 불가능합니다.')
				baby_cnt--
			}
			
		});
		
		
		$('#buylist').on("click",".cancel",function(){		// 노란버튼 클릭시 
			
			//dno_stack = dno_stack_temp;
			dno_stack.pop($(this).attr('id'))
			baby_cnt--
			
			var id_val =$(this).attr('id')					// 노랑은 id값이 dno
			$('button[value="'+id_val+'"]').show()
			$(this).toggle(function(){});
			$('#baby_cnt').html(baby_cnt)
			$('#cost').html(baby_cnt*price)
			var cash_remain = $('#member_cash_in').html()
			
			if(baby_cnt==0){
				baby_cnt=1
				var remain = parseInt(cash_remain)+(baby_cnt*price)
				baby_cnt=0
			}else{
				var remain = parseInt(cash_remain)+(baby_cnt*price)
				
			}
			$('#member_cash_in').html(remain)
		});
		
		
		$('#buy_class').click(function(){
			
			var cost =$('#cost').html()	// 총 결재 값 - 기업 benefit update
			
			if(cost==0){
				alert('신청할 어린이를 클릭해 주세요')
			}else{
				var remain =  $('#member_cash_in').html()	// member mcash값 update
				var cno = $('#cno').val()
				var cnt_len = dno_stack.length
				var flag_hi = false;
				var bid = $('#bid').val()
				for(i=0;i<dno_stack.length;i++){
					var dno = dno_stack[i]
					
					$.ajax({
						url:'/class/update2',
						data:{'cno':cno, 'dno':dno, 'remain':remain,'cost':cost,'bid':bid},
						type: 'post',
						success:function(result){
							if(result==true){
								if(flag_hi==false){
									alert('결재완료');
									flag_hi=true;
								}
							}
						}
					});	// ajax	
				}// for 문
				flag_hi=false;
			}
			
		});// 구매하기 버튼
		
	
	});
</script>
<input type="hidden" value="${classVO.cno}" id="cno">
<input type="hidden" value="${classVO.bid }" id="bid">
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
<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDate }"/><br>
수강료 : ${classVO.price}원
<input type="hidden" id="price" value="${classVO.price}">
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

	<button id="buy" type="button" class="btn btn-info">구매하기</button> 
	<a class="btn btn-warning" id="charge" href="javascript:history.back()">이전 페이지로</a>
		<c:if test="${login_id=='manager' }">
			<button type="button" class="btn btn-danger" id="admin">인증하기</button> 
			<a href="/admin" class="btn btn-danger">관리자페이지</a>
		</c:if>

<br><br><br><br>
</form>
	<div class="modal fade" id="alert_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-info text-white">
					<h3>구매하기 창</h3>
				</div>
				<div class="modal-body">
					<div class="alert alert-warning">아래 자녀 목록에서 자녀를 선택해 주십시오.<BR>
					    등록된 자녀가 없을 경우 마이페이지에서 자녀를 먼저 등록 후 클래스 신청을 해주십시오.</div>
					<div id="babylist_div">
					<label>자녀 등록 목록</label><br>
					<c:forEach items="${babylist }" var="baby">
						<button type="button" class="btn btn-success baby_count" style="width: 45%" value="${baby.dno}">
							이름 : ${baby.dname}<br>
							나이 : ${baby.dbirth }
							
						</button>
					</c:forEach>
					</div>
					<hr>
					<div>
						<label>예약 아이 목록</label>
						<p id="buylist"></p>
					</div>
				</div>
				<div class="modal-footer">
					<div>총 예약 인원 : <label id="baby_cnt">0</label> 명</div>
					<div>총 결재 금액 : <label id="cost">0</label>원</div><hr>
					<div>잔여 젤리 : <label id="member_cash">${member_cash }</label>개  | 결재 후 잔여 젤리 : <label id="member_cash_in"></label>개</div>
					<hr>
					<button type="button" class="btn btn-info" id="buy_class">구매하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="alert_modal2" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-info text-white">
					<h3>클래스 승인 완료</h3>
				</div>
				<div class="modal-body">
					<p>해당 클래스의 승인을 허가하였습니다.</p>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />

