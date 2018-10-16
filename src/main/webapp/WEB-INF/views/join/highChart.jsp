<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<script src="http://code.highcharts.com/highcharts.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function () {
		showAge();
		$('#btage').click(function(){
			showAge();
		});
		$('#btgu').click(function(){
			showInterest();
		});
		$('#btact').click(function(){
			showAct();
		});
		showTest();
	});//function
	
	function showInterest(){
		$('#test').highcharts({
			chart:{
				type: 'column'
			},
			title: {
				text: '노원구 부모님들의 관심사'
			},
			xAxis:{
				categories:['연극놀이', '창의력 풀이 문제', '추리게임', '축구', '야구','요가']
			},
			yAxis:{
				title:{
					text: '명'
				}
			},
			series: [{
				name: '노원구 부모님',
				data: [1,20,4,11,1,6]
			}]
		});
	}//showInterest
	function showAge(){
		Highcharts.chart('test', {

		    title: {
		        text: '자녀의 나이에 따른 회원의 수'
		    },

		    series: [{
		        type: 'pie',
		        allowPointSelect: true,
		        keys: ['name', 'y', 'selected', 'sliced'],
		        data: [
		            ['8세', 29.9, false],
		            ['9세', 71.5, false],
		            ['10세', 106.4, false],
		            ['11세', 129.2, false],
		            ['12세', 144.0, false],
		            ['13세', 176.0, true]
		        ],
		        showInLegend: true
		    }]
		});
	}//showAge
	function showAct(){
		$('#test').highcharts({
			chart:{
				type: 'bar'
			},
			title: {
				text: '야외활동 vs 실내활동'
			},
			xAxis:{
				categories:['노원구 부모님들의 관심 활동']
			},
			yAxis:{
				title:{
					text: '관심 수치'
				}
			},
			series: [{
				name: '실내 활동',
				data: [26]
			},{
				name: '야외 활동',
				data: [7]
			}]
		});
	}//showAct
</script>
</head>
<body>
<div class="container">
<form>
	<h1>통계</h1>
	<div class="btn-box">
		<button type="button" class="btn btn-submit" id="btage">자녀 나이</button>
		<button type="button" class="btn btn-submit" id="btgu">노원구</button>
		<button type="button" class="btn btn-submit" id="btact">활동</button>
	</div>
	<div id="test" style="width:100%; height:400px;"></div>
	<div class="btn-box">
		<button type="button" class="btn btn-cancel" id="btmypage">마이페이지 화면으로</button>
	</div>
</form>
</div>
</body>
</html>