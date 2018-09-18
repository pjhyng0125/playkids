<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style>
	body{
		margin-top:127px;
	}
	.categoryNav{height: 80px;
		background-color: white;
	}
	.categoryNav div{
	height: 80px;
	}
	.categoryNav a{
	color:green;
	}
	
	.class-list{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .gu-list{
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .age-list{
            margin-top: 5px;
            margin-bottom: 5px;
        }
        
        .age-list button{
            width: 70px;
        }

        .zoom{
            transition: transform .3s;
        }
        .zoom:hover {
            -webkit-box-shadow:0px 0px 12px 1px rgba(0,0,0,0.1);
            box-shadow:0px 0px 12px 1px rgba(0,0,0,0.1);
            -webkit-transform:translateY(-8px);
            -moz-transform:translateY(-8px);
            -ms-transform:translateY(-8px);
            -o-transform:translateY(-8px);
            transform:translateY(-8px);
        }

    
        .zoom img:hover{
            opacity: 0.7;
        }     

        .myinfo{
            border: 0px;
            width: 300px;
        }
        .cashinfo{
            transform: translateX(200px);
            
        }
</style>
<nav class="navbar navbar-expand-sm categoryNav">
          <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#category">
							<i class="fa fa-bars"></i>
						</button>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse justify-content-center" id="category">
          <ul class="nav navbar-nav">
            <li class="nav-item"><a href="#" class="nav-link">전체보기</a></li>
            <li class="nav-item"><a href="#" class="nav-link">야외놀이</a></li>
            <li class="nav-item"><a href="#" class="nav-link">실내놀이</a></li>
            <li class="nav-item"><a href="#" class="nav-link">게시판</a></li>
            <li class="nav-item"><a href="#" class="nav-link">동네친구들아 같이놀자!</a></li>
          </ul>
        </div>
        <!-- /.Navbar-collapse -->        
  </nav>
  
   <div class="container">
    <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#areaModal">지역</button>
    <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#ageModal">나이</button>
    <!-- 나이 Modal -->
   <div class="modal fade" id="areaModal">
    <div class="modal-dialog modal-dialog-centered modal-sm">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h2 class="modal-title text-left">지역</h2>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">    
                    <div class="row">
                        <div class="col-md-4 gu-list">
                                <button class="btn card">노원구</button>
                        </div>
                        <div class="col-md-4 gu-list">
                            <button class="btn card">서초구</button>
                        </div>
                        <div class="col-md-4 gu-list">
                            <button class="btn card">강남구</button>
                        </div>
                        <div class="col-md-4 gu-list">
                            <button class="btn card">도봉구</button>
                        </div>
                    </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">적용</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
    </div> <!--modal 끝-->

    <!--agemodal-->
    <div class="modal fade" id="ageModal">
            <div class="modal-dialog modal-dialog-centered modal-sm">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h2 class="modal-title text-left">나이</h2>
                  <button type="button" class="close" data-dismiss="modal">&times;&nbsp;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">    
                                <div class="row">
                                <div class="col-md-4 age-list">
                                        <button class="btn card">8살</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card">9살</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card">10살</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card">11살</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card">12살</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card">13살</button>
                                </div>
                            </div>
                          
                            
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal">적용</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
            </div> <!--agemodal 끝-->

                <!--class-->
                <div class="row">
                    <div class="col-md-3 class-list">
                    <div class="card zoom">
                        <a style="cursor: pointer">
                            <img class="card-img-top" src="/resources/img/cat.jpg" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">어린이 플로리스트 클래스</h5>
                              <p class="card-text">서울시 노원구 / 8세~10세 권장</p>
                              <p class="card-text"><font color="red ">20000</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                    
                    <div class="col-md-3 class-list">
                    <div class="card zoom">
                        <a style="cursor: pointer">
                            <img class="card-img-top" src="/resources/img/cat.jpg" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">어린이 플로리스트 클래스</h5>
                              <p class="card-text">서울시 노원구 / 8세~10세 권장</p>
                              <p class="card-text"><font color="red ">20000</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                    
                    <div class="col-md-3 class-list">
                    <div class="card zoom">
                        <a style="cursor: pointer">
                            <img class="card-img-top" src="/resources/img/cat.jpg" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">어린이 플로리스트 클래스</h5>
                              <p class="card-text">서울시 노원구 / 8세~10세 권장</p>
                              <p class="card-text"><font color="red ">20000</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                    
                    <div class="col-md-3 class-list">
                    <div class="card zoom">
                        <a style="cursor: pointer">
                            <img class="card-img-top" src="/resources/img/cat.jpg" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">어린이 플로리스트 클래스</h5>
                              <p class="card-text">서울시 노원구 / 8세~10세 권장</p>
                              <p class="card-text"><font color="red ">20000</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                    
                    <div class="col-md-3 class-list">
                    <div class="card zoom">
                        <a style="cursor: pointer">
                            <img class="card-img-top" src="/resources/img/cat.jpg" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">어린이 플로리스트 클래스</h5>
                              <p class="card-text">서울시 노원구 / 8세~10세 권장</p>
                              <p class="card-text"><font color="red ">20000</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                 </div>
                 </div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>