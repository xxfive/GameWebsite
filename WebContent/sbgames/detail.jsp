
<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<style>
body {
	background-image: url("assets/img/games/reben.jpg");
	background-size: cover;
}

h2 {
	color: white;
}

table {
	background-color: white;
	width: 900px;
	height: 500px;
}
</style>
<title>SB Games</title>
<%
	String userid = (String) session.getAttribute("userid");
	GameDAO dao = GameDAO.getInstance();
	GameDTO game = dao.gameView(userid);
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
</head>
<header>
	<body id="page-top">
		<nav
			class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#page-top">회원가입</a>

				<%
					if (userid == null) {
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
						} else {
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
		<br>
		<br>
		<br>
		<br>
		<br>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<body>
		<form action="detail.me" method="post">
			<h2 align="center">자유게시판</h2>
			<input type="hidden" id="num" value=${board.num }>
			<table border="1" align="center">
				</tr>
				<tr>
					<td>글번호</td>
					<td>${board.num }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${board.writer }</td>
				</tr>
				<tr height="30">
					<td>제목</td>
					<td>${board.subject }</td>
				</tr>
				<tr height="300">
					<td>내용</td>
					<td><textarea cols="80px" rows="15px">${board.content }</textarea></td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${board.readcount }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${board.reg_date }</td>
				</tr>
				<tr>
					<td>
					<c:if test="${sessionScope.userid!=null}">
					<input type="button" value="글수정"
						onclick="location.href='boardUpdate.jsp?num=${board.num}'">
						<input type="button" value="삭제"
						onclick="location.href='delete.me?num=${board.num}'"> 
					</c:if>
						<input type="button" onclick="location.href='list.jsp'" value="목록"></td>
				</tr>
			</table>
			</div>
		</form>
	</body>
</html>


