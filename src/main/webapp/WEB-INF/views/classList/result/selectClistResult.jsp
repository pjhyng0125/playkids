<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <c:forEach items="${classlist }"  var="classlist">
                <div class="col-md-3 class-list">
                    <input type="hidden" value='${classlist.baddress.split(" ")[1] }' class="addressHidden">
                    <input type="hidden" startAge='${classlist.startAge }' endAge='${classlist.endAge }' class="ageHidden">
                    <div class="card zoom">
                        <a style="cursor: pointer">
                            <img class="card-img-top" src="/resources/img/${classlist.cpic }" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">${classlist.cname }</h5>
                              <p class="card-text">${classlist.baddress } / ${classlist.startAge }세~${classlist.endAge }세 권장</p>
                              <p class="card-text"><font color="red ">${classlist.price }</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                </c:forEach>