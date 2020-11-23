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
		background-image:url("assets/img/games/loderon.jpg");
		background-repeat: no-repeat;
  		background-size: cover;
	}
	#frm{
		color:white;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%
	String userid=(String)session.getAttribute("userid");
	GameDAO dao=GameDAO.getInstance();
	GameDTO game=dao.gameView(userid);
%>
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
				<a class="navbar-brand js-scroll-trigger" href="#page-top">로그인</a>
					
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
			</div>
		</div>
	</nav>
</header>
<br><br><br><br><br>
  <div class="container">

  <form action="login" method="post" id="frm">
    <div class="form-group">
      <label for="userid">ID : </label>
      <input type="text" class="form-control" id="userid" placeholder="ID를 입력하세요." name="userid">
    </div>
    <div class="form-group">
      <label for="pwd">PASSWORD : </label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd">
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember">로그인 정보 기억하기
      </label>
    </div>
    <button type="button" class="btn btn-primary" id="loginBtn">로그인</button>
  </form>
</div>
<script type="text/javascript">
	$("#loginBtn").click(function(){
			if($("#userid").val()==""){
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return false;
			}
			
			if($("#pwd").val()==""){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
			
			$.ajax({
				type:"post",
				url:"login",
				data:{"userid":$("#userid").val(),"pwd":$("#pwd").val()},
				success:function(value){
					
					if(value.trim()==-1){
						alert("회원이 아닙니다. 회원가입하세요")
						$(location).attr("href","join.jsp");
					}else if(value.trim()==0){
						alert("안녕하세요. 반갑습니다.")
						$(location).attr("href","main.jsp");
					}else if(value.trim()==2){
					  	alert("비밀번호가 일치하지 않습니다.")
					}else if(value.trim()==1){
						alert("관리자 로그인")
						$(location).attr("href","adminPage.jsp");
					} 
				},
				error:function(e){
					alert("error:"+e)
				}
			}); //ajax
			
		}); //loginBtn
	 //document
</script>
