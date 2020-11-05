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
	<p>${blog.title}</p>
	<p>${blog.user}</p>
	
	<hr>
	
	<p>${blog.body}</p>
	
	<c:forEach var="c" items="${blog.blogComments}">
	
	<p>${c.user.username}</p>
	<p>${c.createdAt}</p>
	<p>${c.body}
	
	 </c:forEach>
	
	</jsp:attribute>
	</t:pageLayout>