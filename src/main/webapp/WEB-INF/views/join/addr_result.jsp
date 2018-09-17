<%@page import="com.playkids.persistence.AddrDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type=request.getParameter("type");
	AddrDAO dao = new AddrDAO();
	List<String> list = null;
	if(type.equals("gugun")){
		list = dao.selectgugun();
	}else if(type.equals("dong")){
		String gugun=request.getParameter("gugun");
		list = dao.selectdong(gugun);
	}
	out.print("<option value='0'>==선택==</option>");
	for(int i=0; i<list.size(); i++){
		out.print("<option value="+list.get(i)+">"+list.get(i)+"</option>");
	}
%>