<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crescendo Home Page</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	src="extensions/group-by-v2/bootstrap-table-group-by.css">
<script src="extensions/group-by-v2/bootstrap-table-group-by.js"></script>
</head>
<body>

	<div class="container" class="text-center">
		<img
			src="https://www.crescendointernational.org/design/img/Crescendo_logo2.svg"
			alt="Crescendo Logo">
	</div>
	<div class="row">
		<div class="col">
			<h6 class="text-center">
				<em> Bringing People together through Music, One Note at a Time</em>
			</h6>
			<br>
			<h4 class="text-center">Here's What People are Talking About</h4>
			<br>
			<div class="col">${blogs.body}</div>
			<br>
			<div class="row">
				<div class="col">
					<hr>
					<br>
					<p class="text-center">
						<strong> Here Are Today's Hottest Albums!!!</strong>
					</p>
					<div class="row">
						<div class="col">
							<table class="text-center">
								<tr>
									<td>"${album1.title}"</td>
								</tr>
								<tr>
									<td><img src="${album1.coverUrl}" alt="album image"
										width="240"></td>
								</tr>
								<tr>
									<td><c:if test="${ not empty album1.albumComments}">${album1.albumComments.get(0).body}</c:if></td>

								</tr>
							</table>
						</div>
						<div class="col">
							<table class="text-center">
								<tr>
									<td>"${album2.title}"</td>
								</tr>
								<tr>
									<td><img src="${album2.coverUrl}" alt="album image"
										width="240"></td>
								<tr>
									<td><c:if test="${ not empty album2.albumComments}">${album2.albumComments.get(0).body}</c:if></td>
								</tr>

							</table>
						</div>
						<div class="col">
							<table class="text-center">
								<tr>
									<td>"${album3.title}"</td>
								</tr>
								<tr>
									<td><img src="${album3.coverUrl}" alt="album image"
										width="240"></td>
								<tr>
									<td><c:if test="${ not empty album3.albumComments}">${album3.albumComments.get(0).body}</c:if></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
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