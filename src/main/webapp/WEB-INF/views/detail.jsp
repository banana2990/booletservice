<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Booklet Page</title>
		<style>
			table{
				width: 500px;}
			 
			table, th, td {
				border: 1px solid olive;
				border-collapse: collapse;
				padding : 5px 10px;		
				}
				td {
				text-align: center;
				}
			input[type='text']{
				width: 100%;}	
			textarea{		
				width: 100%;
				height: 150px;
				resize:none;}
				</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	<!-- 로그인 세션 체크 -->
	<c:if test="${sessionScope.loginId eq null}">
		<script>
		alert("로그인이 필요한 서비스입니다");
		location.href="./";
		</script>
	</c:if>	
	
	</head>
	<body>
	<table>
		<tr><th> 번호 </th> <td> ${info.idx} </td></tr>
		<tr><th> 작성자 </th> <td> ${info.id }</td></tr>
		<tr><th> 제목 </th> <td> ${info.subject} </td></tr>
		<tr><th> 내용 </th> <td> <textarea readonly>${info.content} </textarea></td></tr>
		<tr><th> 조회수 </th> <td> ${info.bHit } </td> </tr>
		<tr><th> 등록일 </th> <td> ${info.reg_date }</td> </tr>
	</table>
	<br>
	<a href = "./main"> 목록보기 </a>
	<br>
	<button onclick="location.href='updateForm?idx=${info.idx}'"> 수정하기 </button>
	<button onclick="location.href='delete?idx=${info.idx}'"> 삭제하기</button>
	</body>
	<script>
	</script>
</html>