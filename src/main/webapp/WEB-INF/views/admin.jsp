<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Booklet Page</title>
		<style>
			table, th, td {
			border: 1px solid olive;
			border-collapse: collapse;
			padding: 5px 10px;		
		}
		div {
			margin: 5px;
		}
		</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	</head>

	<body>
		관리자 메인입니다.
		<button onclick='location.href="logout"'> 로그아웃 </button>
		<button onclick="location.href='writeForm'"> 글쓰기 </button>
		
		<br/>
		
		<table>
			<tr>
				<th> 아이디 </th>
				<th> 이름 </th>
				<th> 이메일 </th>
				<th> 삭제 </th>
			</tr>						
	
		<c:forEach items="${list }" var ="dto">
			<tr>
				<td> <a href="detail?idx=${dto.id}"> ${dto.id}</a></td>
				<td> ${dto.name} </td>
				<td> ${dto.email} </td>
				<td> <a href="memdelete?id=${dto.id}"> 회원삭제 </a></td>
			</tr>	
		</c:forEach>
	
		</table>
		
		
	</body>

	<script>
	console.log("${sessionScope.loginId}");
	</script>
</html>