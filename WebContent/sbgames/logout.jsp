<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //로그인정보 다 지우기
	//session.removeAttribute("userid");
	response.sendRedirect("login.jsp");
%>