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
			margin: 10px;
		}
		div {
			margin: 5px;
		}
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
		회원 관리 페이지입니다.
		<button onclick='location.href="logout"'> 로그아웃 </button>
		
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
				<td> <a href="memdetail?id=${dto.id}"> ${dto.id}</a></td>
				<td> ${dto.name} </td>
				<td> ${dto.email} </td>
				<td> <a href="memdelete?id=${dto.id}"> 회원삭제 </a></td>
			</tr>	
		</c:forEach>
	
		</table>	
		
	</body>

	<script>
	</script>
</html>