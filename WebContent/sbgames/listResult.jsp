
<%@page import="com.game.model.GameDTO"%>
<%@page import="com.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
   <title>SB Games</title>
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
 <%
	String userid=(String)session.getAttribute("userid");
	GameDAO dao=GameDAO.getInstance();
	GameDTO game=dao.gameView(userid);
%>
 <style>
	body{
		background-image:url("assets/img/games/reben.jpg");
		background-repeat: no-repeat;
  		background-size: cover;
	}
	table{
		background-color:white;
	}
	h1{
		color:white;
	}
</style>
</head>
<body>
<div class="container" align="center">
	  <h1>자유게시판</h1>
	  <br><br><br>
	  <table class="table table-striped">
	    <thead>
	      <tr>
	     	<th>글번호</th>
	        <th>작성자</th>
	        <th>제목</th>
	       	<th>작성일</th>
	        <th>조회수</th>
	        <c:if test = "${sessionScope.userid=='admin'}">
	        <th>삭제</th>
	        </c:if>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach items="${board2}" var="board" varStatus = "st">
	       	<tr>
	       		<td>${board.num}</td>
	      		<td>${board.writer}</td>
      			<td><a href="detail.me?num=${board.num }">${board.subject}</a></td>
     			<td>${board.reg_date}</td>
	      		<td>${board.readcount}</td>
	      		<c:if test = "${sessionScope.userid=='admin'}">
		      		<td>
		      			<a href = "javascript:fdelete(${board.num},${board.name})">삭제</a>
		      		</td>
	      		</c:if>
	      	</tr>
	    </c:forEach>
	    </tbody>
	  </table>
	  <div align = "center">
	  	<c:if test = "${pu.startPage>pu.pageBlock}"> <!-- 이전-->
	  		<a href = "javascript:getData(${pu.startPage-pu.pageBlock},'${pu.field}','${pu.word}')">[이전]</a>
	  	</c:if>
	  	<c:forEach begin ="${pu.startPage}" end = "${pu.endPage}" var = "i"> <!-- 이전-->
  			<c:if test ="${i==pu.currentPage}"> <!-- 현재페이지-->
 				<c:out value = "${i}"/>
  			</c:if>
  			<c:if test = "${i!=pu.currentPage}"> <!-- 현재페이지 아닌 경우 링크 부여-->
  				<a href = "javascript:getData(${i},'${pu.field}','${pu.word}')">${i}</a>
  			</c:if>
	  	</c:forEach>
	  	<c:if test = "${pu.endPage < pu.totPage}"> <!-- 다음-->
	  		<a href = "javascript:getData(${pu.endPage+1},'${pu.field}','${pu.word}')">[다음]</a>
	  	</c:if>
	  </div> 
	  </div>