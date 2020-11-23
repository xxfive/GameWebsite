
<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 
crossorigin="anonymous">
</head>
<header>
	<body id="page-top">
		<nav
			class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#page-top">글쓰기</a>
				
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
<%
	request.setCharacterEncoding("utf-8");
	int num=0, ref=1, re_step=0, re_level=0; //새글
	if(request.getParameter("num")!=null){ //답글
		num=Integer.parseInt(request.getParameter("num"));
		ref=Integer.parseInt(request.getParameter("ref"));
		re_step=Integer.parseInt(request.getParameter("re_step"));
		re_level=Integer.parseInt(request.getParameter("re_level"));
	}
%>
<body>
<form action="insert" method="post">
<input type="hidden" name="num" value=<%=num %>>
<input type="hidden" name="ref" value=<%=ref %>>
<input type="hidden" name="re_step" value=<%=re_step %>>
<input type="hidden" name="re_level" value=<%=re_level %>>
	<table border=1 align="center">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userid"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
		<% 
			if(request.getParameter("num")!=null){
		%>
				<input type="text" name="subject" value="[답글]">
		<% 		
			}else{
		%>	
			<input type="text" name="subject">
		<%
			}
		%>	
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="50" rows="20" name="content"></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit"  value="글쓰기">
			<input type="reset"     value="다시작성"> 
			<input type="button" 	value="목록보기" onclick="location.href='board.jsp'"></td>
			</tr>			
	</table>
</form>
</body>
</html>