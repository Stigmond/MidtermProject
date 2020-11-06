<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<title>New User</title>
<div class="row">
		<div class="col-16">
			<div class="text-center">
	 			<img align="right" src="images/image_from_ios.png" width="25%"
						height="auto" alt="Crescendo Logo">
		</div>
		</div>			
	</div>
<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
			integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
			crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<div class="column" text-align="center" vertical-align="middle">
			<h1>Please Enter the Following Information</h1>
			<form action="newUser.do">
				<label for="username">User name/email</label>
					<br>
					<input type="text" name="username" required>
					<br>

				<label for="password">User Password</label>
				<br> 
				<input type="text" name="password" required>
				<br>

				<label for="firstName">First name</label>
				<br> 
				<input type="text" name="firstName" required>
				<br>
<label for="lastName">Last name</label>
<br> 
<input type="text" name="lastName" required>
<br>

<label for="avatarUrl">Avatar Url</label>
<br>
 <input type="text" name="avatarUrl">
 <br>

			

		</div>

	</div>


	

		
		</body> --%>



<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:pageLayout>
	<jsp:attribute name="title">Profile page for ${user.username}</jsp:attribute>
	<jsp:attribute name="body">
<html>
<style>
form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
<body>
	<h2>New User Sign Up Form</h2>
	<form action="/action_page.php">
		<div class="imgcontainer">
			<img src="images/image_from_ios.png"
				alt="Avatar"
				class="avatar">
				</div>
	</form>
		<div>
			<form action="newUser.do">
				<label for="username">User name/email</label>
					<br>
					<input type="text" name="username" required>
					<br>
				<label for="password">User Password</label>
				<br> 
				<input type="text" name="password" required>
				<br>
				<label for="firstName">First name</label>
				<br> 
				<input type="text" name="firstName" required>
				<br>
				<label for="lastName">Last name</label>
				<br> 
				<input type="text" name="lastName" required>
				<br>
				<label for="avatarUrl">Avatar Url</label>
				<br>
			 	<input type="text" name="avatarUrl">
 				<br>
 				<label for="body">User Bio</label>
				<br>
				<textarea name="body" rows="4" cols="40"></textarea>
				<br> 
				<button class="btn btn-primary" type="submit">Create New User</button>
			</form>
				<!-- <input type="submit" value="Create New User"></input> -->
		</div>
	</form>
</body>
	
	
	
	
	</jsp:attribute>
</t:pageLayout>
</html>
