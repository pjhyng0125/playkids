<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
        
        body{
         padding-bottom: 195.19px;
        }
        
    footer {
    z-index:1;
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
}
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>playkids</title>
  <!-- reference Bootstrap 4 -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
   src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/wow.min.js"></script>
<script src="/resources/bootstrap/js/main.js"></script>
<link href="/resources/css/anybootstrap.css" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css">
<link href="/resources/bootstrap/css/animate.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/animate.css" rel="stylesheet" />
<link href="/resources/bootstrap/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/bootstrap/css/style.css" rel="stylesheet">
  
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  
  
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top " id="home">
    <div class="container">
      <div class="row">
        <div class="site-logo">
          <a href="/main" class="brand">PlayKids</a>
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
            			<c:if test="${login_id == null }">
            				<li><a href="/main">홈</a>
	            			<li><a href="/login">로그인</a></li>
	            		</c:if>
            			<c:if test="${login_id != null }">   
            				<li style="line-height:48px; color:blue">${login_id}님 환영합니다!</li>    			
	            			<li><a href="/logout" onclick="alert('로그아웃되었습니다^^');">로그아웃</a></li>
            			</c:if>
            			<c:if test="${admin_id != null }">
            				<li style="line-height:48px; color:blue">${admin_id}관리자님 환영합니다!</li>
            				<li><a href="/logout" onclick="alert('로그아웃되었습니다^^');">로그아웃</a></li>
            			</c:if>
            			<li><a href="/mypage">마이페이지</a></li>
            			<li><a href="/chargepage">캐쉬충전</a></li>
          			</ul>
        		</div>
      </div>
    </div>
  </nav>
  
  <nav class="web-nav2">
		<div class="web-nav2-inner">
			<ul>
			<li><a class="web-nav2-button1 web-nav2-button" href="/totalClass">전체보기</a></li>
			<li><a class="web-nav2-button2 web-nav2-button" href="/outerClass">야외놀이</a></li>
			<li><a class="web-nav2-button3 web-nav2-button" href="/innerClass">실내놀이</a></li>
			<li><a class="web-nav2-button4 web-nav2-button" href="/programs/category/2/">창의활동</a></li>
			<li><a class="web-nav2-button5 web-nav2-button" href="/programs/category/3/">동내친구들아 같이놀자</a></li>
			</ul>
		</div>
  </nav>
  <hr>
