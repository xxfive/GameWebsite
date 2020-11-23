<%@page import="java.io.PrintWriter"%>
<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@page import="com.game.board.BoardDTO"%>
<%@page import="com.game.board.BoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SB Games</title>
<style>
	body{
		background-image:url("assets/img/games/reben.jpg");
		background-repeat: no-repeat;
  		background-size: cover;
  	}
  	table{
  		background-color:white;
  		width:900px;
  		height:500px;
  	}
  	h1{
  		color:white;
  	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%
	String userid=(String)session.getAttribute("userid");
	GameDAO dao=GameDAO.getInstance();
	GameDTO game=dao.gameView(userid);
%>
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
				<a class="navbar-brand js-scroll-trigger" href="#page-top">자유게시판</a>
				</div>
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
<%
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	BoardDAOImpl dao2=BoardDAOImpl.getInstance();
	BoardDTO board=dao2.boardfindById(num);
	if(session.getAttribute("userid")!=null){
		userid=(String) session.getAttribute("userid");
	}
	if(userid==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
%>
</head>

<body>
	<h1 align="center">게시글 수정하기</h1>
	<form action="update.me" method="post">
	<input type="hidden" name="num" value=<%=num %>>
	<table border=1 align="center">
		<tr>
			<td>작성자</td>
			<td><%=game.getUserid()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" value="<%=board.getSubject() %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="50" rows="10" name="content"><%=board.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit"  value="글쓰기">
			<input type="reset"     value="다시작성"> 
			<input type="button" 	value="목록보기" onclick="location.href='list.jsp'"></td>
			</tr>			
	</table>
	</form>
</body>
</html>
