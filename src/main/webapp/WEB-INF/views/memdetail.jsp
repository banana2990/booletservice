<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Booklet Page</title>
		<style>
		div{
			border: 1px solid olive;
			padding: 10px;
			width: 290px;
			height: 290px;
		}
		button{
			position: relative;
			left: 40%;
		}
		</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	</head>
	<body>
	
	<div>
	<form action="memupdate" method="post">
		<p> ID: ${memdetail.id} <input type="text" name="id" value="${memdetail.id}" hidden /></p>
		<p> NAME: <input type="text" name="name" value="${memdetail.name}"/></p>
		<p> AGE: <input type="number" name="age" value="${memdetail.age}"/></p>
		<p> GENDER:
				<c:set var="gender" value="${memdetail.gender}" />
				<c:choose>
				<c:when test="${gender eq 'male  '}">
						<input type="radio" name="gender" value="male" checked/> 남
						<input type="radio" name="gender" value="female"/> 여
				</c:when>
				<c:when test="${gender eq 'female'}">
					<input type="radio" name="gender" value="male"/> 남
					<input type="radio" name="gender" value="female" checked/> 여
				</c:when>
				</c:choose>
		</p>
		<p> EMAIL: <input type="email" name="email" value="${memdetail.email}"/></p>
		<input type="submit" value = "회원정보 수정 " >
		</form>
	</div>
	
	</body>
	<script>	
			var $id = $("input[name='id']");
			var $name = $("input[name='name']");
			var $age = $("input[name='age']");
			var $gender = $("input[name='gender']:checked");
			var $email = $("input[name='email']");			
		
			if($name.val()==""){
				alert("이름을 입력해주세요");
				$name.focus();
			}else if($age.val()==""){
				alert("나이를 입력해주세요");
				$age.focus();
			}else if($gender.val()==null){ //라디오 버튼이라 포커스 안됨 + 빈칸으로 인식하는게 아님
				alert("성별을 입력해주세요");
			}else if($email.val()==""){
				alert("메일을 입력해주세요");
				$email.focus();
			}
			
		</script>
</html>