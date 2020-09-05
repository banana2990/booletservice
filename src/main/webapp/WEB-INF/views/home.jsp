<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Booklet Page</title>
		<style>
		table, th, td{
		border: 1px solid olive;
		border-collapse: collapse;
		text-align: center;
		}
		
		</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	</head>

	<body>
		<h4>
			 회원 전용 서비스입니다. 로그인 해주세요.
		</h4>
		
		 <div>
		 	<form action = "login" method = "post">
		 	<table>
		 		<tr> 
			 		<th> ID </th>
			 		<td> <input type="text" name="id"> </td>
			 	</tr>
		 		<tr> 
		 			<th> PW </th>
	 				<td> <input type="password" name="pw"></td>
 				</tr>
		 		<tr>
		 			<th> 모드 </th>
					<td> 
						<input type="radio" name="mode" value="admin"/> 관리자
						<input type="radio" name="mode" value="member" checked/> 일반회원
					</td>
					</tr>
		 		<tr> 
		 			<td colspan="2">
		 				<input type="button" onclick="location.href='joinForm'" value="회원가입">
		 				<input type="submit" value="로그인">
	 				</td>
 				</tr>
		 	</table>
		 	</form>
		 	
		 </div>
		
	</body>
	
	<script>
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}
	</script>
</html>