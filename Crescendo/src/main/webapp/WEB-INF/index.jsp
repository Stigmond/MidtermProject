
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Crescendo Home Page</jsp:attribute>
	<jsp:attribute name="body">
		
	<div class="row">
		<div class="col-12">
			<div class="text-center">
	 			<img
						src="https://files.slack.com/files-pri/T052X7BAZ-F01EV1A5VPS/image_from_ios.png"
						alt="Crescendo Logo">
<!--  				<img src="https://www.crescendointernational.org/design/img/Crescendo_logo2.svg" width="100%" height="auto" alt="Crescendo Logo">
 -->			</div>
		</div>			
	</div>

	<div class="row">
		<div class="col">
			<h6 class="text-center">Bringing the World Together, One Note at a Time...</h6>
		</div>
	</div>

	<a href="showBlog.do?id=2">Test Blog</a>

	<hr>
	
	<div class="row">
		<div class="col">
			<h3 class="text-center">Featured Blog by ${blogs.user.firstName}</h3>
		</div>
	</div>	
		
	<div class="row">
	
		<div class="col-4">
			<c:choose>
				<c:when test="${not empty blogs.user.avatarUrl}">
				<a href="getUserProfile.do?id=${blogs.user.id}"><img
							src="${blogs.user.avatarUrl}" width="100%" height="auto"
							class="rounded float-left" alt="Blogger Avatar"></a>
				</c:when>
				<c:otherwise>
				<a href="getUserProfile.do?id=${blogs.user.id}"><img
							src="https://familyguyaddicts.files.wordpress.com/2015/08/rockstar-peter-2.png"
							width="100%" height="auto" class="rounded float-left"
							alt="Default Avatar"></a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-8">
			<p class="text-justify">${blogs.body}</p>
		</div>
	</div>
	<hr>	
	<div class="row">
		<div class="col">
			<h3 class="text-center">Hot Takes on Hot Tracks</h3>
		</div>
	</div>
	
	<div class="row">
		
		<div class="col">
			<div class="card" style="width: 18rem;">
				<br>
  				<div class="text-center">
  					<h5 class="card-title">${album1.title}</h5>
  				</div>
  				<img class="card-img-top" src="${album1.coverUrl}"
						alt="Album Image">
  				<hr>
 				<div class="card-body">
  					<c:if test="${ not empty album1.albumComments}">
							<div class="card-text">
								<p class="text-justify">"${album1.albumComments.get(0).body}"</p>
							</div>
						</c:if>
  				 	<a href="viewAlbum.do?id=${album1.id}" class="btn btn-primary">See more</a>
  				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="card" style="width: 18rem;">
				<br>
  				<div class="text-center">
  					<h5 class="card-title">${album2.title}</h5>
  				</div>
  				<img class="card-img-top" src="${album2.coverUrl}"
						alt="Album Image">
  				<hr>
 				<div class="card-body">
  					<c:if test="${ not empty album2.albumComments}">
							<div class="card-text">
								<p class="text-justify">"${album2.albumComments.get(0).body}"</p>
							</div>
						</c:if>
  				 	<a href="viewAlbum.do?id=${album2.id}" class="btn btn-primary">See more</a>
  				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="card" style="width: 18rem;">
				<br>
  				<div class="text-center">
  					<h5 class="card-title">${album3.title}</h5>
  				</div>
  				<img class="card-img-top" src="${album3.coverUrl}"
						alt="Album Image">
  				<hr>
 				<div class="card-body">
  					<c:if test="${ not empty album3.albumComments}">
							<div class="card-text">
								<p class="test-justify">"${album3.albumComments.get(0).body}"</p>
							</div>
						</c:if>
  				 	<a href="viewAlbum.do?id=${album3.id}" class="btn btn-primary">See more</a>
  				</div>
			</div>
		</div>
		
		</div>
		
	</jsp:attribute>
</t:pageLayout>

