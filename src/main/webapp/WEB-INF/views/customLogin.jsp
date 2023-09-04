<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<p><c:out value="${error}"/></p>
	<p><c:out value="${logout}"/></p>
	<form action="/login" method="post">
		<p><input type="text" name="username" /></p>
		<p><input type="password" name="password" /></p>
		<p><input type="checkbox" name="remember-me" />Remember Me</p>
		<p><input type="submit" value="로그인" /></p>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
<script>
//html문서를 다 로드하면 실행해
$(document).ready(function(){
	//요소의 변경이 있으면 콜백함수실행 
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	$("input[name='username']").change(function(){
		//가상의 폼을 생성(폼태그)
		let formData = new FormData();
		let inputFile = $("input[name='username']");
		formData.append("username", $(this).val());
		
		$.ajax({
			url: '/idcheck',
			processData : false,
			contentType: false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data: formData,
			type: 'POST',
			dataType: 'json',
			success : function(result){
				console.log(result);
			}
		})
	})
})
</script>
</html>