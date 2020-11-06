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
	float: right; @@ -77,6 +32,11 @@ span .psw { float : right;
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
</form>
<body>
	<h2>New User Sign Up Form</h2>
	<form action="/action_page.php">
		<div class="imgcontainer">
			<img src="images/image_from_ios.png" alt="Avatar" class="avatar">
				</div>
	</form>
		<div>
			<form action="newUser.do">

<form action="newUser.do" method="POST">

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
	
	
	
	
	
	
	
	
	
	
	</div>
</body>

	
	
	
	
	
	
	
	
	
	</jsp:attribute>
</t:pageLayout>