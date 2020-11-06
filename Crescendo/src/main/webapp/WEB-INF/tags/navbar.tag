<%@tag description="Navigation bar for all pages" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
	<div class="mx-auto d-sm-flex d-block flex-sm-nowrap">
		<a class="navbar-brand" href="home.do">Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample11" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse text-center"
			id="navbarsExample11">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="openTrades.do">Buy/Sell/Trade</a></li>
				<c:if test="${ not empty sessionScope.loggedIn }">
					<li class="nav-item"><a class="nav-link" href="createTrade.do">List
							a Good</a></li>
				</c:if>
				<c:choose>
					<c:when test="${not empty sessionScope.loggedIn }">
						<li class="nav-item"><a class="nav-link" href="newAlbum.do">Add
								an Album</a></li>
						<li class="nav-item"><a class="nav-link" href="newTopic.do">Start
								a conversation</a></li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${not empty sessionScope.loggedIn }">
						<ul class="nav-item">
							Logged in as:
							<a class="nav-link"
								href="getUserProfile.do?id=${sessionScope.loggedIn.id}">${sessionScope.loggedIn.username}</a>
							<a href="logout.do">Log out</a>
						</ul>
					</c:when>
					<c:otherwise>
						<form class="form-inline" action="login.do" method="POST">
							<input class="form-control" type="text" name="username"
								placeholder="Enter your Username" /> <input
								class="form-control" type="text" name="password"
								placeholder="Enter your Password" />
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${not empty warningMessage }">
						<p class="text-danger">${warningMessage }</p>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${not empty sessionScope.loggedIn }">
						<c:if
							test="${ sessionScope.loggedIn.role.equalsIgnoreCase(\"admin\")}">
							<div class="col">
								<a href="newAlbum.do" class="btn btn-primary">Add a new
									album</a>
							</div>
						</c:if>
						<div class="col">
							<a href="newTopic.do" class="btn btn-primary">Start a
								conversation</a>
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
		</ul>
	</div>
	</div>
	
	<!-- testing here -->
</nav>


