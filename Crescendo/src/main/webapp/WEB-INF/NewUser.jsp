<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">



		<div class="column">
			<h1>Please Enter the Following Information</h1>

			<form action="newUser.do">
				<label for="username">User name/email</label>
					<br>
					<input type="text"name="username" value="${user.username}" required>
					<br>

				<label for="password">User Password</label>
				<br> 
				<input type="text" name="password" value="${user.password}" required>
				<br>

				<label for="firstName">First name</label>
				<br> 
				<input type="text" name="firstName" value="${user.firstName}" required>
				<br>
<label for="lastName">Last name</label>
<br> 
<input type="text" name="lastName" value="${user.lastName}" required>
<br>

<label for="avatarUrl">Avatar Url</label>
<br>
 <input type="text" name="avatarUrl" value="${user.avatarUrl}">
 <br>

				<label for="body">User Bio</label>
				<br>
				<textarea name="body" rows="4" cols="40">${user.body}</textarea>
				<br> 
				<input type="submit" value="Create New User">
			</form>






		</div>











	</div>











	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>