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
		<p> ID: <input type="text" name="id"/> <input type="button" onclick="ovrchk()" value="중복확인"> </p>
		<p> PW: <input type="password" name="pw"/></p>
		<p> NAME: <input type="text" name="name"/></p>
		<p> AGE: <input type="number" name="age"/></p>
		<p> GENDER: 					
						<input type="radio" name="gender" value="male"/> 남
						<input type="radio" name="gender" value="female"/> 여
						</p>
		<p> EMAIL: <input type="email" name="email"/></p>
		<button onclick="join()"> 가입 </button>
	</div>
	
	</body>
	<script>
	
	var overChk = false;
	
	function ovrchk(){
		var id = $("input[name='id']").val(); // id값 가져오기
		console.log(id); // 잘 들어오는 지 확인: 1차
		
		$.ajax({
			type: "get",
			url: "overlay",
			data: {"id":id},
			dataType: "JSON",
			success: function(data){
				console.log(data);
				if(data.overlay){
					alert("이미 사용중인 ID 입니다.");
					$("input[name='id']").val("");
				}else{
					alert("사용 가능한 ID 입니다");
					overChk = true;
				}
			},
			error: function(e){
				console.log(e);
			}			
		});
	}
	
	
	function join(){
		if(overChk){
			var $id = $("input[name='id']");
			var $pw = $("input[name='pw']");
			var $name = $("input[name='name']");
			var $age = $("input[name='age']");
			var $gender = $("input[name='gender']:checked");
			var $email = $("input[name='email']");
			
			console.log($id);
			console.log($pw);
			console.log($name);
			console.log($age);
			console.log($gender);
			console.log($email);
			
			if($id.val()==""){
				alert("아이디를 확인해주세요");
				$id.focus();
			}else if($pw.val()==""){
				alert("비밀번호를 입력해주세요");
				$pw.focus();
			}else if($name.val()==""){
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
			}else{// 모든 항목을 입력했을 경우
				console.log("서버로 전송");
				
				var param = {};
				param.id = $id.val();
				param.pw = $pw.val();
				param.name = $name.val();
				param.age = $age.val();
				param.gender = $gender.val();
				param.email = $email.val();
				
				console.log('param:' , param); // 콘솔에 +찍으면 문자열로 바뀜
				
				$.ajax({
					type: "post",
					url: "join",
					data: param,
					dataType: "JSON",
					success: function(data){
						console.log(data.join);

						if(data.join){
							alert("회원가입에 성공하였습니다.");
							location.href="./";
						}else{
							alert("회원가입에 실패하였습니다.");
							location.href="joinform.jsp";
						}
					},
					error: function(error){
						console.log(error);
					}
				});
			}			
		}else{
			alert("중복체크를 확인해 주세요");
			$("input[name='id']").focus();
		}
	}
		</script>
</html>