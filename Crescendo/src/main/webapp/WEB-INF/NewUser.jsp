<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:pageLayout>
	<jsp:attribute name="title">New User Creation</jsp:attribute>
	<jsp:attribute name="body">

<div class="text-center">

<h2 class="text-center">New User Sign Up Form</h2>

	

<form action="newUser.do" method="POST">
<div class="imgcontainer">
<img src="images/image_from_ios.png" alt="logo" width="480">
</div>
				<label for="username">User name(email)</label>
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
				<button type="submit" value="Create New User">Create New User</button>
			</form>

</div>
	</jsp:attribute>
</t:pageLayout>

