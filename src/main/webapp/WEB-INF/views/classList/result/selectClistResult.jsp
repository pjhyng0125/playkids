<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <c:forEach items="${totalclass }"  var="totalclass">
                <div class="col-md-3 class-list">
                    <input type="hidden" value='${totalclass.baddress.split(" ")[1] }'>
                    <input type="hidden" startAge='${totalclass.startAge }' endAge='${totalclass.endAge }' class="ageHidden">
                    <div class="card zoom">
                        <a style="cursor: pointer">
                            <img class="card-img-top" src="/resources/img/${totalclass.cpic }" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">${totalclass.cname }</h5>
                              <p class="card-text">${totalclass.baddress } / ${totalclass.startAge }세~${totalclass.endAge }세 권장</p>
                              <p class="card-text"><font color="red ">${totalclass.price }</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                </c:forEach>