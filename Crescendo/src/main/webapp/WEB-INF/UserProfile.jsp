<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Profile page for ${user.username}</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<div class="container"> 
	
<!-- 	Put this at the top of the main container for every JSP-->
	<t:navbar/>
	
		<!-- NavBar will go here-->
		<div class="row">
			<div class="col">
				<c:choose>
					<c:when test="${not empty user.avatarUrl }">
						<img style='height: 100%; width: 100%; object-fit: contain'
							 src="${user.avatarUrl}"
							 class="rounded float-left"
							 alt="User Avatar" />
					</c:when>
					<c:otherwise>
						<img style='height: 100%; width: 100%; object-fit: contain'
							src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
							class="rounded float-left"
							alt="User has not selected an avatar">
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="col">
			<h2>Hello, ${user.firstName }!</h2>
			
			<form action="makeUserUpdates.do">
				<input type="hidden" name="id" value="${user.id}">
				
				<label for="username">User name/email</label><br>
				<input type="text" name="username" value="${user.username}" required><br>
				
				<label for="password">User Password</label><br>
				<input type="text" name="password" value="${user.password}" required><br>
				
				<label for="firstName">First name</label><br>
				<input type="text" name="firstName" value="${user.firstName}" required><br>
				
				<label for="lastName">Last name</label><br>
				<input type="text" name="lastName" value="${user.lastName}" required><br>
				
				<label for="avatarUrl">Avatar Url</label><br>
				<input type="text" name="avatarUrl" value="${user.avatarUrl}"><br>
				
				<label for="body">User Bio</label><br>
				<textarea name="body" rows="4" cols="40">${user.body}</textarea><br>
				<input type="submit" value="Update">	
			</form>
			
			</div>	
			
		</div>
		<div class="row">
		<h4>Most Recent Post</h4> 
		<br>
		<p>${user.blogs.get(0).body}</p>
		<p>Comments: ${user.blogs.get(0).blogComments.size()}</p>
		</div>


	</div>
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script> -->
<t:bootstrapjs/>
</body>
</html>