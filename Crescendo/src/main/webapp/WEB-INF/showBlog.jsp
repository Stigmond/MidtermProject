<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageLayout>
	<jsp:attribute name="title">Blog post by ${blog.user}</jsp:attribute>
	<jsp:attribute name="body">
	
	<hr>
	<c:choose>
					<c:when test="${not empty blog.headerMediaUrl }">
						<img
							style='height: 100%; width: 100%; object-fit: contain'
							src="${blog.headerMediaUrl}" class="rounded float-left"
							alt="Cover Art" />
					</c:when>
					<c:otherwise>
						<img
							style='height: 100%; width: 100%; object-fit: contain'
							src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
							class="rounded float-left"
							alt="No cover art uploaded for this album">
					</c:otherwise>
				</c:choose>
	<h3>${blog.title}</h3>
	<p>By: ${blog.user.username} (${blog.createdAt})</p>
	
	<hr>
	
	<p class="text-justify">${blog.body}</p>
	<hr>
	<h4>Comments:</h4>
	<div></div>
	<c:forEach var="c" items="${blog.blogComments}">
	<div class="card">
	<div class="card-title"><h6>By: <a href="getUserProfile.do?id=${c.user.id}">${c.user.username}</a> (${c.createdAt})</h6></div>
	<div class="card-text"><p class="text-justify">${c.body}</p></div>
	<br>
	</div>
	 </c:forEach>
	
	</jsp:attribute>
	</t:pageLayout>