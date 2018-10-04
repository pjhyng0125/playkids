<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                     
         
         /* nav tag */
         nav1 ul{padding-top:150px;}            
         nav1 ul li {
            display:inline;                         
            font:bold 18px Dotum;                   
            padding: 100px;                   
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
<script type="text/javascript">
	 $(function(){
		/* $.ajax({
			url:"/result/member_list",
			success:function(htmlTxt){
				$('#a1').html(htmlTxt);
			}
		}); */
	}); 
	function loadmember(){
		$.ajax({
			url:"/adminMember",
			success:function(htmlTxt){
				$('#a1').html(htmlTxt);
			}
		});
	}
	function loadbusiness(){
		$.ajax({
			url:"/adminBusiness",
			success:function(htmlTxt){
				$('#a1').html(htmlTxt);
			}
		});
	}
	function loadclassinfo(){
		$.ajax({
			url:"/adminClassInfo",
			success:function(htmlTxt){
				$('#a1').html(htmlTxt);
			}
		});
	}
	function loadboard(){
		$.ajax({
			url:"/adminBoard",
			success:function(htmlTxt){
				$('#a1').html(htmlTxt);
			}
		});
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
			<li><a href="#" onclick="loadmember(); return false">회원정보</a></li>
			<li><a href="#" onclick="loadbusiness(); return false">기업정보</a></li>
			<li><a href="#" onclick="loadclassinfo(); return false">클래스정보</a></li>
			<li><a href="#" onclick="loadboard(); return false">게시판</a></li>
			<li><a href="#" onclick="loadrevenue(); return false">수익정보</a></li>
			</ul>
		</div>
  </nav1>
  <hr>

<div id="a1"></div>
</body>
</html>