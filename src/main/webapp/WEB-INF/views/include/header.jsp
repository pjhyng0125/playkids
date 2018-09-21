<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                     
         
         /* nav tag */
         .web-nav2 ul{padding-top:150px;}                     /*  상단 여백 10px  */
         .web-nav2 ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            font:bold 17px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding: 95px;                         /* 각 메뉴 간격 */
        }       
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>playkids</title>
  <!-- reference Bootstrap 4 -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="/resources/css/bootstrap.css" rel="stylesheet">
  <link href="/resources/css/animate.min.css" rel="stylesheet">
  <link href="/resources/css/animate.css" rel="stylesheet" />
  <link href="/resources/css/prettyPhoto.css" rel="stylesheet">
  <link href="/resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
 
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="/resources/js/bootstrap.js"></script> 
  <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="/resources/bootstrap/js/jquery.prettyPhoto.js"></script>
  <script src="/resources/bootstrap/js/jquery.isotope.min.js"></script>
  <script src="/resources/bootstrap/js/wow.min.js"></script>
  <script src="/resources/bootstrap/js/jquery.easing.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8HeI8o-c1NppZA-92oYlXakhDPYR7XMY"></script>
  <script src="/resources/bootstrap/js/main.js"></script>
  <script src="/resources/bootstrap/contactform/contactform.js"></script>
  
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  
  
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="row">
        <div class="site-logo">
          <a href="main" class="brand">PlayKids</a>
        </div>

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
							<i class="fa fa-bars"></i>
						</button>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="menu">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#home">홈</a></li>
            <li><a href="/login">로그인</a></li>
            <li><a href="/mypage">마이페이지</a></li>
            <li><a href="/cashcharge">캐쉬충전</a></li>
          </ul>
        </div>
        <!-- /.Navbar-collapse -->
      </div>
    </div>
  </nav>
  
  <nav class="web-nav2">
		<div class="web-nav2-inner">
			<ul>
			<li><a class="web-nav2-button1 web-nav2-button" href="/programs/">전체보기</a></li>
			<li><a class="web-nav2-button2 web-nav2-button" href="/programs/category/0/">야외놀이</a></li>
			<li><a class="web-nav2-button3 web-nav2-button" href="/programs/category/1/">실내놀이</a></li>
			<li><a class="web-nav2-button4 web-nav2-button" href="/programs/category/2/">창의활동</a></li>
			<li><a class="web-nav2-button5 web-nav2-button" href="/programs/category/3/">동내친구들아 같이놀자</a></li>
			</ul>
		</div>
  </nav>
  <hr>
  </body>
</html>
