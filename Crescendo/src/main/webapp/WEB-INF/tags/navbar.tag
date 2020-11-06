<%@tag description="Navigation bar for all pages" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar">
	<div class="row">
		<div class="col text-center">
			<a class="btn btn-success" href="home.do">Home</a>
		</div>
		<div class="col text-center">
			<a class="btn btn-info" href="openTrades.do">Buy/Sell/Trade</a>
		</div>
			<div class="col text-center">
				<a class="btn btn-secondary" href="createTrade.do">List a Good/Service</a></div>
			</div>	
			</div>
	<div class="col">
		<c:choose>
			<c:when test="${not empty sessionScope.loggedIn }">
			Logged in as: <a href="getUserProfile.do?id=${sessionScope.loggedIn.id}">${sessionScope.loggedIn.username}</a>
			<a href="logout.do">Log out</a>
			</c:when>
			<c:otherwise>
				<form class="form-inline" action="login.do" method="POST">
					<input class="form-control" type="text" name="username"
						placeholder="Enter your Username" /> <input class="form-control"
						type="text" name="password" placeholder="Enter your Password" />
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${not empty warningMessage }">
				<p class="text-danger">${warningMessage }</p>
			</c:when>
		</c:choose>

	</div>
	<c:choose>
		<c:when test="${not empty sessionScope.loggedIn }">
			<div class="col">
				<a href="newAlbum.do" class="btn btn-primary">Add a new album</a>
			</div>
			<div class="col">
				<a href="newTopic.do" class="btn btn-primary">Start a conversation</a>
			</div>
		</c:when>
	</c:choose>
	<!-- new -->
		<c:choose>
			<c:when test="${empty sessionScope.loggedIn }">
				<div class="col">
					<a class="btn btn-primary" href="signUp.do">Sign Up</a> 
				</div>
			 </c:when>
		</c:choose>
	</div>

	<!-- new -->
</nav>


