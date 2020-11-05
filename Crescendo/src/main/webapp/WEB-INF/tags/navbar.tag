<%@tag description="Navigation bar for all pages" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar">
	<div class="row">
		<div class="col">
			<a class="navbar-nav" href="home.do">Home</a>
		</div>
		<div class="col">
			<a class="navbar-nav" href="openTrades.do">Buy/Sell/Trade</a>
		</div>
	</div>
	<div class="col">
		<c:choose>
			<c:when test="${not empty sessionScope.loggedIn }">
Logged in as: <a href="getUserProfile.do?id=${sessionScope.loggedIn.id}">${sessionScope.loggedIn.username}</a>
				<a href="logout.do">Log out</a>
			</c:when>
			<c:otherwise>
				<form class="form-inline" action="login.do">
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

</nav>


