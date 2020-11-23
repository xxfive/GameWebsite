
<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>SB Games</title>
<style>
	body{
		background-image:url("assets/img/games/wood.jpg");
		background-size: cover;
  	}
	
	table{
		background-color:white;
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
				<a class="navbar-brand js-scroll-trigger" href="#page-top">고객지원</a>
				
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
<br>
<br>
<br>
<br>
<br>
</head>
<body>
<div id="container">
	<h1 align="center" >고객문의</h1>
	<hr>
	<br>
	<div>
		<table border="1" align="center">
			<colgroup>
				<col style="width: 13%">
				<col style="width: 37%">
				<col style="width: 12%">
				<col style="width: 38%">
			</colgroup>
			<tbody>
				<tr>

					<th scope="row">게임</th>
					<td><select style="width: 251px" title="게임선택"
						class="select_game" id="game">
							<option value="0">선택하세요</option>
							<option value="1">메이플스토리</option>
							<option value="2">피파온라인4</option>
							<option value="3">던전앤파이터</option>
							<option value="4">서든어택</option>
							<option value="5">바람의나라</option>
							<option value="6">카트라이더</option>
					</select></td>
				</tr>
				<tr>
					<th scope="row"><span id="billingstitle">상담분류</span></th>
					<td><select style="width: 251px" title="상담분류 선택"
						class="select_st" id="billings" name="billings">
							<option value="0">선택하세요</option>
							<option value="1">계정문의</option>
							<option value="2">해킹</option>
							<option value="3">캐시환불</option>
							<option value="4">기타</option>
					</select></td>
					<th scope="row">캐릭터명</th>
					<td><input type="text" style="width: 239px" class="input_st"
						id="character"></td>
				</tr>
				<tr class="nexon-hide" id="sessionlogin">
					<th scope="row">운영자 주소</th>
					<td><span id="longinid">Admin@email.com</span></td>
					<th scope="row">운영자 성명</th>
					<td><span id="loginname">이성빈</span></td>
				</tr>

				<tr class="nexon-hide" id="dnfnoauth1">
					<th scope="row">ID</th>
					<td colspan="3"><input type="text" style="width: 431px"
						class="input_st" id="inquiry_user_id"> <span
						class="nexon-hide" id="dnfnoauthradio"></span></td>
				</tr>
				<tr class="nexon-hide" id="dnfnoauth2">
					<th scope="row">고객명</th>
					<td colspan="3"><input type="text" style="width: 431px"
						class="input_st" id="inquiry_user_name"></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" style="width: 631px"
						class="input_st" id="inquiry_ctitle"></td>
				</tr>
				<tr id="inquirytrText">
					<th>내용</th>
					<td colspan="3"><textarea class="input_st"
							id="inquiry_receptionform" style="width: 631px; height: 150px"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td colspan="3"><input type="email" style="width: 631px"
						class="input_st" id="inquiry_email"></td>
				</tr>
				<tr id="inquiry_addictional_mobile" class="nexon-hide">
					<th scope="row">휴대폰번호</th>
					<td><input type="text" size="30"></td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3">
						<div class="file_sch">
							<input type="text" style="width: 524px" class="input_st">
							<input type="file" style="width: 100%" class="input_st"
								id="my_file" name="my_file" accept=".gif, .jpg, .png">

						</div>
						<div class="file_del_list_new clfix">
							<select id="fileList" size="4" title="첨부파일 목록" class="list_add"></select>
							<a href="javascript:void(0)" title="첨부파일 삭제" id="fileDelete"></a>

						</div>
						<p class="n_txt" style="padding-top: 10px;">
							첨부 파일은 게임관련 오류 및 신고 이미지만 접수 가능합니다.(<b id="filesize">0MB</b>/최대
							30MB)
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center"><input type="submit" value="문의하기" onclick="location.href='supportResult.jsp'"> 
					<input type="reset" value="다시작성"></td>
				</tr>
				</tbody>
				</table>
				</div>
</body>
</html>