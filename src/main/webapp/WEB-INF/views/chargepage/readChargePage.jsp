<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style>
.cashinfo{
			border: 0px;
            width: 300px;
            transform: translateX(200px);
        }
</style>
<br><br><br>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="card cashinfo">
				<img class="card-img-top" src="/resources/img/man.png" alt="Card image"
					style="width: 100%" height="280px">
				<div class="card-body">
					<p class="card-text text-center font-weight-bold">OOO님</p>
				</div>

			</div>
		</div>
		<div class="col-md-4">
			<div class="card cashinfo text-center">
				<div class="card-header font-weight-bold">캐쉬충전</div>
				<div class="card-body">
					<label class="radio-form"> <input type="radio"
						name="optradio" value="10000">10,000원
					</label><br> <label class="radio-form"> <input type="radio"
						name="optradio" value="20000">20,000원
					</label><br> <label class="radio-form"> <input type="radio"
						name="optradio" value="30000">30,000원
					</label><br> <label class="radio-form"> <input type="radio"
						name="optradio" value="50000">50,000원
					</label><br>
					<br>
					<button class="btn btn-info">충전</button>
				</div>
			</div>
		</div>
	</div>
</div>
<br><br><br>
<%@include file="/WEB-INF/views/include/footer.jsp"%>