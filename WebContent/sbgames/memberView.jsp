
<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SB Games</title>
<style>
	body{
		background-image:url("assets/img/games/valley.jpg");
		background-repeat: no-repeat;
  		background-size: cover;
	}
	
</style>
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

</head>
<header>
	<body id="page-top">
		<nav
			class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#page-top">내 정보 변경</a>
				
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
</head>
<body>
<br><br>
<h2 align="center">회원 정보 수정</h2>
	<form action="update" method="post">
	<input type="hidden" name="userid" value="<%=userid %>">
		<table align="center">
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="<%=game.getName()%>"></td> 
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" id="userid" name="userid" value="<%=game.getUserid()%>"></td> 
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="pwd" name="pwd" value="<%=game.getPwd()%>"></td> 
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" id="email" name="email" value="<%=game.getEmail()%>"></td> 
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" id="phone" name="phone" value="<%=game.getPhone()%>"></td> 
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" id="updateBtn" value="수정">
			<input type="reset" value="취소">
			<a href="delete"><input type="button" id="deleteBtn" value="회원탈퇴"></a></td>
		</tr>
		</table>
	</form>
</body>
</html>

<script type="text/javascript">
$(function(){
	$("#updateBtn").click(function(){
		alert("정말 수정하시겠습니까?")
			if(true){
				return;
			}
	
	$("#deleteBtn").click(function(){
		alert("정말 탈퇴하시겠습니까?")
			if(true){
				return;
			}
			
		}); //deleteBtn
	});	 //document
})
</script>