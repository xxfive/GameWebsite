<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SB Games</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/member.js"></script>
<%
	String userid=(String)session.getAttribute("userid");
	GameDAO dao=GameDAO.getInstance();
	ArrayList<GameDTO> arr = dao.gameList();
	int count=dao.memberCount();
%>
<style>
	body{
		background-image:url("assets/img/games/admin.jpg");
		background-repeat: no-repeat;
  		background-size: cover;
	}
	table{
		background-color:white;
	}
	h3{
		color:white;
	}
</style>
</head>
<body>
<body>
<!-- Favicon-->
<link rel="shortcut icon"
	href="https://ssl.nx.com/s2/portal/nexon/image/nexon/nexon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

</head>
<header>
	<body id="page-top">
		<nav
			class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#page-top">회원관리</a>
					
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="main.jsp">메인페이지</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="list">회원관리</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<br><br><br><br><br>
</head>
<body>
 <div class="container" align="right">
	<h3>회원리스트(<span id="cntSpan"><%=count%></span>)</h3><br><br>
	 <table class="table">
    <thead>
      <tr>
        <th>이름</th>
        <th>아이디</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>구분</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${members}" var="mem">
     <c:if test="${mem!=admin }">
     	<c:set var="mode" value="일반회원"/>
     </c:if>
       <c:if test="${mem==admin }">
     	<c:set var="mode" value="관리자"/>
     </c:if>
     	 <tr>
     		<td>${mem.name }</td>
     		<td>${mem.userid }</td>
     		<td>${mem.phone }</td>
     		<td>${mem.email }</td>
     		<td>${mode }</td>
     		<td onclick="del('${mem.userid}')">삭제</td>
     	</tr>
     </c:forEach>
    </tbody>
  </table>
</div>

