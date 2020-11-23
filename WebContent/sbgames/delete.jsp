
<%@page import="com.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid=(String)session.getAttribute("userid");
	GameDAO dao=GameDAO.getInstance();
	dao.gameDelete(userid);
	session.invalidate();
	response.sendRedirect("main.jsp");
	
%>