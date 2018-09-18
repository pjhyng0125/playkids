<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                     
         
         /* nav tag */
         nav1 ul{padding-top:130px;}                     /*  상단 여백 10px  */
         nav1 ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            font:bold 17px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding: 95px;                         /* 각 메뉴 간격 */
        }       
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mainView</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css">
<link href="/resources/bootstrap/css/animate.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/animate.css" rel="stylesheet" />
<link href="/resources/bootstrap/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/bootstrap/css/style.css" rel="stylesheet">
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
  
  <nav1 class="web-nav2">
		<div class="web-nav2-inner">
			<ul>
			<li><a class="web-nav2-button1 web-nav2-button" href="/programs/">전체보기</a></li>
			<li><a class="web-nav2-button2 web-nav2-button" href="/programs/category/0/">야외놀이</a></li>
			<li><a class="web-nav2-button3 web-nav2-button" href="/programs/category/1/">실내놀이</a></li>
			<li><a class="web-nav2-button4 web-nav2-button" href="/programs/category/2/">창의활동</a></li>
			<li><a class="web-nav2-button5 web-nav2-button" href="/programs/category/3/">동내친구들아 같이놀자</a></li>
			</ul>
		</div>
  </nav1>
  <hr>
  
<div id="home">
    <div class="slider">
      <div id="about-slider">
        <div id="carousel-slider" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators visible-xs">
            <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-slider" data-slide-to="1"></li>
            <li data-target="#carousel-slider" data-slide-to="2"></li> 
          </ol>

          <div class="carousel-inner">
          	<div class="item active">
              <img src="/resources/bootstrap/images/slide9.jpg" class="img-responsive" alt="">
            </div>
            <div class="item">
              <img src="/resources/bootstrap/images/slide11.jpg" class="img-responsive" alt="">
            </div>
            <div class="item">
              <img src="/resources/bootstrap/images/slide6.jpg" class="img-responsive" alt="">
            </div>
          </div> 
          
          <a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
						<i class="fa fa-angle-left"></i>
					</a>

          <a class=" right carousel-control hidden-xs" href="#carousel-slider" data-slide="next">
						<i class="fa fa-angle-right"></i>
					</a>
        </div>
      </div>
    </div>
  </div>
  
  <br><br><br>
  <section id="class1">
    <div class="container">
          <h2><font face="verdana" color="black">이달의 인기 클래스</font></h2>
          <hr>
    </div>
  </section>
  <div class="container">
  <img onclick="javascript:location.href='/program1';" src="/resources/bootstrap/images/slide4.jpg">
  </div>
  
  <br><br>
  <section id="class2">
  	<div class="container">
  		<h2><font face="verdna" color="black">신규 클래스</font></h2>
  		<hr>  
  	</div>
  </section>
  
  <div class="container">
  <img onclick="javascript:location.href='/program';" src="/resources/bootstrap/images/slide5.jpg">
  </div>
  
  <br><br><br><br><br>
  <footer id="footer" class="midnight-blue">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div class="text-center">
            <a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
          </div>
          &copy; PlayKids Corporation.
        </div>
       </div>
     </div>
  </footer>
  
  
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery.js"></script>
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