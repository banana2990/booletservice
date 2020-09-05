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
				width: 500px;
				}			 
			table, th, td {
				border: 1px solid olive;
				border-collapse: collapse;
				padding : 5px 10px;		
				}
			td {
				text-align: center;
				}
			input[type='text']{
				width: 100%;
				}	
			textarea{		
				width: 100%;
				height: 150px;
				resize:none;
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
	<form action="update" method="post">
	<table>
		<tr><th> 번호 </th> <td> ${info.idx} <input type="text" name="idx"  value="${info.idx}" hidden/></td></tr>
		<tr><th> 작성자 </th> <td> <input type="text" name="id"  value="${info.id}" ></td></tr>
		<tr><th> 제목 </th> <td> <input type="text" name="subject" value="${info.subject} " > </td></tr>
		<tr><th> 내용 </th> <td> <textarea name="content">${info.content}</textarea> </td>	</tr>
		<tr><th> 등록일 </th> <td> ${info.reg_date }</td> </tr>
		<tr><td colspan="2"> <input type="submit" value="저장"/></td></tr>
				
		
	</table>
	</form>
	</body>
	<script>
	</script>
</html>