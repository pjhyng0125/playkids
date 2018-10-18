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
	});//function
//카테고리 n개/ 카테고리당 수치 n개
	function showInterest(){
		$('#test').highcharts({
			chart:{
				type: 'column'
			},
			title: {
				text: '${gu} 부모님들의 관심사'
			},
			xAxis:{
				categories:[${categoris}]
			},
			yAxis:{
				title:{
					text: '명'
				}
			},
			series: [{
				name: '${gu} 부모님',
 				data: ${list_su}
			}]
		});
	}//showInterest
//나이 수치 6개
	function showAge(){
		Highcharts.chart('test', {

		    title: {
		        text: 'Playkids와 함께 하는 자녀의 나이'
		    },

		    series: [{
		        type: 'pie',
		        allowPointSelect: true,
		        keys: ['name', 'y', 'selected', 'sliced'],
		        data: [
		            ['8세', ${map_age['8se']}, false],
		            ['9세', ${map_age['9se']}, false],
		            ['10세', ${map_age['10se']}, false],
		            ['11세', ${map_age['11se']}, false],
		            ['12세', ${map_age['12se']}, false],
		            ['13세', ${map_age['13se']}, true]
		        ],
		        showInLegend: true
		    }]
		});
	}//showAge
//실내활동/야외활동 수치 2개
	function showAct(){
		$('#test').highcharts({
			chart:{
				type: 'bar'
			},
			title: {
				text: '야외활동 vs 실내활동'
			},
			xAxis:{
				categories:['서울 부모님들의 관심 활동 타입']
			},
			yAxis:{
				title:{
					text: '관심 수치'
				}
			},
			series: [{
				name: '실내 활동',
				data: [${map_act['in']}]
			},{
				name: '야외 활동',
				data: [${map_act['out']}]
			}]
		});
	}//showAct
</script>
</head>
<body>
<div class="container">
<form>
	<h1>Playkids Charts</h1>
	<div class="btn-box">
		<button type="button" class="btn btn-submit" id="btage">자녀 나이</button>
		<button type="button" class="btn btn-submit" id="btgu">${gu }</button>
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