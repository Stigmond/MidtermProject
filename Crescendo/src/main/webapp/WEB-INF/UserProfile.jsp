<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageLayout>
	<jsp:attribute name="title">Profile page for ${user.username}</jsp:attribute>
	<jsp:attribute name="body">
			<div class="row">
			<div class="col">
				<c:choose>
					<c:when test="${not empty user.avatarUrl }">
						<img style='height: 100%; width: 100%; object-fit: contain'
							src="${user.avatarUrl}" class="rounded float-left"
							alt="User Avatar" />
					</c:when>
					<c:otherwise>
						<img style='height: 100%; width: 100%; object-fit: contain'
							src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
							class="rounded float-left" alt="User has not selected an avatar">
					</c:otherwise>
				</c:choose>
			</div>

			<div class="col">
				<h2>Hello, ${user.firstName }!</h2>
				<c:choose>
					<c:when test="${not empty sessionScope.loggedIn && sessionScope.loggedIn.id == user.id}">
					<a class= "btn btn-primary" href= "newTopic.do" role= "button">Start a conversation </a>
					</c:when>
				</c:choose>


				<form action="makeUserUpdates.do">
					<input type="hidden" name="id" value="${user.id}"> <label
						for="username">User name/email</label><br> <input type="text"
						name="username" value="${user.username}" required><br>

					<label for="password">User Password</label><br> <input
						type="text" name="password" value="${user.password}" required><br>

					<label for="firstName">First name</label><br> <input
						type="text" name="firstName" value="${user.firstName}" required><br>

					<label for="lastName">Last name</label><br> <input type="text"
						name="lastName" value="${user.lastName}" required><br>

					<label for="avatarUrl">Avatar Url</label><br> <input
						type="text" name="avatarUrl" value="${user.avatarUrl}"><br>

					<label for="body">User Bio</label><br>
					<textarea name="body" rows="4" cols="40">${user.body}</textarea>
					<br> <input type="submit" value="Update">
				</form>

			</div>

		</div>
	</jsp:attribute>
</t:pageLayout>
