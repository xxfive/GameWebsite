
<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>SB Games</title>
<style>
	body{
		background-image:url("assets/img/games/ogrima.jpg");
		background-repeat: no-repeat;
  		background-size: cover;
	}
	#frm{
		color:white;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/member.js"></script>
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
				<a class="navbar-brand js-scroll-trigger" href="#page-top">회원가입</a>
				
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
<br><br><br><br><br>
<div class="container">

  <form action="insert" method="post" id="frm">
  <div class="row">
  	<div class="col">
 	<label for="userid">아이디:</label>
      <input type="text" class="form-control" id="userid" placeholder="아이디를 입력하세요." name="userid" readonly="readonly" >
    </div>
     <div class="col align-self-end">
      <button type="button" id=idCheckBtn class="btn btn-primary">ID 중복확인</button>
     </div>
     </div>
    <div class="form-group">
      <label for="name">이름:</label>
      <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요." name="name">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd">
    </div>
     <div class="form-group">
      <label for="pwd">비밀번호 확인:</label>
      <input type="password" class="form-control" id="pwdck" placeholder="위의 비밀번호와 동일하게 설정하세요." name="pwdck">
    </div>
    <div class="form-group">
      
   	<label for="email">이메일:</label>
      <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요." name="email">
    </div>
    <div class="form-group">
      <label for="phone">전화번호:</label>
      <input type="text" class="form-control" id="phone" placeholder="전화번호를 입력하세요." name="phone">
    </div>
    <div class="form-check-inline">
<br/>
    
    <button id="send" class="btn btn-primary">가입하기</button>
  </form>
</div>
</body>
</html>
