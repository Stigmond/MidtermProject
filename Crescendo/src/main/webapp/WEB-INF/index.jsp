<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crescendo Home Page</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
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
			<div class="col">${blogs.get(0).body}</div>
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
							<h4 class="text-center">
								"${albums.get(0).title}"<br> <img
									src="https://images.sk-static.com/images/media/profile_images/artists/509644/huge_avatar"
									alt="album image" width="240"> <br>
								${albums.get(0).albumComments.get(0).body}
							</h4>
						</div>
						<div class="col">
							<h4 class="text-center">
								"${albums.get(1).title}" <br> <img
									src="https://static.billboard.com/files/media/acdc-back-in-black-album-cover-650-compressed.jpg"
									alt="album image" width="240"> <br>
								${albums.get(0).albumComments.get(1).body}
							</h4>
						</div>
						<div class="col">
							<h4 class="text-center">
								"${albums.get(2).title}" <br> <img
									src="https://images-na.ssl-images-amazon.com/images/I/51OnocJWVWL._AC_SX466_.jpg"
									alt="album image" width="240"> <br>
								${albums.get(0).albumComments.get(2).body}
							</h4>
						</div>
					</div>
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