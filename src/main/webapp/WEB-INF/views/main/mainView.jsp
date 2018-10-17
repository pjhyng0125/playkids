<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>mainView</title>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

  <!-- <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="row">
        <div class="site-logo">
          <a href="main" class="brand">PlayKids</a>
        </div>

        Brand and toggle get grouped for better mobile display
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
							<i class="fa fa-bars"></i>
						</button>
        </div>
        Collect the nav links, forms, and other content for toggling
        <div class="collapse navbar-collapse" id="menu">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#home">홈</a></li>
            <li><a href="/login">로그인</a></li>
            <li><a href="/mypage">마이페이지</a></li>
            <li><a href="/cashcharge">캐쉬충전</a></li>
          </ul>
        </div>
        /.Navbar-collapse
      </div>
    </div>
  </nav> -->
  
  <!-- <nav1 class="web-nav2">
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
  <hr> -->
  
<div>
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
          <h2><font face="verdana" color="black">KIDS에서 추천하는 클래스</font></h2>
          <hr>
    </div>
  </section>
  <div class="container">
  <img onclick="javascript:location.href='/outerClass';" src="/resources/bootstrap/images/slide4.jpg">
  <img onclick="javascript:location.href='/outerClass';" src="/resources/bootstrap/images/slide7.jpg" hspace="50">
  <img onclick="javascript:location.href='/outerClass';" src="/resources/bootstrap/images/slide14.jpg">
  </div>
  
  <br><br>
  <section id="class2">
  	<div class="container">
  		<h2><font face="verdna" color="black">신규 클래스</font></h2>
  		<hr>  
  	</div>
  </section>
  
  <div class="container">
  <img onclick="javascript:location.href='/innerClass';" src="/resources/bootstrap/images/slide5.jpg">
  <img onclick="javascript:location.href='/innerClass';" src="/resources/bootstrap/images/slide13.jpg" hspace="50">
  </div>
  
  <br><br><br><br><br><br><br><br><br><br><br><br><br>
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>