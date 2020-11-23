

<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>SB Games</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%
	String userid=(String)session.getAttribute("userid");
	GameDAO dao=GameDAO.getInstance();
	GameDTO game=dao.gameView(userid);
%>
 
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
<style>
	body{
		background-image:url("assets/img/games/reben.jpg");
		background-size: cover;
  		color:white;
	}
	#frm{
		color:white;
	}
	a:link { 
 	color: fuchsia; text-decoration: none;
 }
 a:visited { 
 	color: fuchsia; text-decoration: none;
 }
	
</style>
</head>
<header>
	<body id="page-top">
		<nav
			class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#page-top">자유게시판</a>
				
<%
	if(userid==null){
%>			
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="main.jsp">게임소개</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="list.jsp">자유게시판</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="support.jsp">고객지원</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="join.jsp">회원가입</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="login.jsp">로그인</a></li>
				</ul>
	<%
		}else{
	%>
		<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="main.jsp">게임소개</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="list.jsp">자유게시판</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="support.jsp">고객지원</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="memberView.jsp">내 정보 변경</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="logout">로그아웃</a></li>
				</ul>
	<%
		}
	%>
			</div>
		</div>
	</nav>
</header>
<br><br><br><br><br>

  <script>
$(document).ready(function(){
	getData(1,"","");
	
	$("#btnSearch").on("click",function(){//검색버튼 클릭
		getData(1,$("#field").val(),$("#word").val());
	})
	
})//document
function getData(pageNum, field, word){
	$.get("list.me",
		  {"pageNum":pageNum, "field":field, "word":word}, 
		  function(d){
			 
		    $("#result").html(d);
	})
}
</script>
</head>
<body>

<div id="result"></div>
	<br/><br/>
	<div align = "center">
		<form name = "search" id = "search" id="frm">
			<select name = "field" id = "field">
				<option value = "writer">작성자</option>
				<option value = "content">내용</option>
			</select>
			<input type = "text" name = "word" id = "word">
			<input type = "button" value = "찾기" id = "btnSearch">
<%
	if(userid!=null){
%>
			<a href="insert.jsp"><input type="button" id="writeBtn" value="글쓰기"></a>
<%
	}else{
		
%>
			<a href="login.jsp"><input type="button" id="writeBtn" value="글쓰기"></a>
			
<%
	}
%>			
		</form>
	</div>
</body>
</html>

