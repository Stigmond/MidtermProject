
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:pageLayout>
	<jsp:attribute name="title">Profile page for ${user.username}</jsp:attribute>
	<jsp:attribute name="body">


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
			<img src="images/image_from_ios.png" alt="Avatar" class="avatar">
				</div>
	</form>
		<div>
			<form action="newUser.do">

	<h2>New User Sign Up Form</h2>
	
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

				<!-- <input type="submit" value="Create New User"></input> -->
		</div>
	</form>
</body>
		
	</form>

	
	</jsp:attribute>
</t:pageLayout>

