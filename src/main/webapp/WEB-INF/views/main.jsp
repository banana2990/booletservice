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
	
	<c:if test="${sessionScope.loginId != null}">
		<div> 
		안녕하세요 ${sessionScope.loginId }님 <button onclick="location.href='logout'">로그아웃</button>
		</div>
	</c:if>
		<button onclick="location.href='writeForm'"> 글쓰기 </button>
	<body>
		<table>
			<tr>
				<th> 번호 </th>
				<th> 제목 </th>
				<th> 이름 </th>
				<th> 작성일 </th>
				<th> 조회수 </th>
				<th> 삭제 </th>
			</tr>						
	
		<c:forEach items="${list }" var ="dto">
			<tr>
				<td> ${dto.idx} </td>
				<td> <a href="detail?idx=${dto.idx}"> ${dto.subject }</a></td>
				<td> ${dto.id} </td>
				<td> ${dto.reg_date } </td>
				<td> ${dto.bHit } </td>
				<td> <a href="delete?idx=${dto.idx}"> 삭제 </a></td>
			</tr>	
		</c:forEach>
	
		</table>

	<script>
	console.log("${sessionScope.loginId}");
	</script>
</html>