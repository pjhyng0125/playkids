<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                     
         
         /* nav tag */
         nav1 ul{padding-top:150px;}                     /*  상단 여백 10px  */
         nav1 ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            font:bold 18px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding: 100px;                         /* 각 메뉴 간격 */
        }       
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 창</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css">
<link href="/resources/bootstrap/css/animate.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/animate.css" rel="stylesheet" />
<link href="/resources/bootstrap/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/bootstrap/css/style.css" rel="stylesheet">
<script>
$ function updatemember(){
	$.ajax({
		url:"/updatemember",
		data:{
			type:""
		}
	})
	
}
</script>
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
            <h2>관리자 모드</h2>
          </ul>
        </div>
        <!-- /.Navbar-collapse -->
      </div>
    </div>
  </nav>
  
  <nav1 class="web-nav2">
		<div class="web-nav2-inner">
			<ul>
			<li><a href="#member">회원정보</a></li>
			<li><a href="#company">기업정보</a></li>
			<li><a href="#classinfo">클래스정보</a></li>
			<li><a href="#board">게시판</a></li>
			<li><a href="#revenue">수익정보</a></li>
			</ul>
		</div>
  </nav1>
  <hr>

</body>
</html>