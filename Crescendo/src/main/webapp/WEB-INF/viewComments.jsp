<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Viewing comment thread</jsp:attribute>
	<jsp:attribute name="body">

<!-- FIXME: Header is not displaying properly-->
<!-- <div class="row"> -->
<c:choose>
<c:when	test="${parentObject.getClass().getSimpleName().equals(\"Blog\")}">
<c:choose>
					<c:when test="${not empty parentObject.headerMediaUrl }">
						<img
							style='height: 100%; width: 100%; object-fit: contain'
							src="${parentObject.headerMediaUrl}" class="rounded float-left"
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
<h3 class="card-header">Viewing  ${parentObject.user.username}'s blog post "<em>${parentObject.title}</em>" and its Comments</h3>
<div><h4 class="text-justify">${parentObject.body}</h4></div>

</c:when>
<c:when	test="${parentObject.getClass().getSimpleName().equals(\"Topic\")}">
<h3 class="card-header">Viewing replies to ${parentObject.user.username}'s thread "${parentObject.title}"</h3>
<p class="text-justify">
					<em>${firstComment.body }</em> </p>
					<c:choose>
					<c:when test ="${sessionScope.loggedIn.id == parentObject.user.id }">
					<a class="btn btn-danger" 
					href="delete.do?parent=${parentObject.getClass().getSimpleName().toLowerCase() }&id=${parentObject.id}">
					DELETE THIS POST
					</a>
					
					</c:when></c:choose>
</c:when>
<c:when
					test="${parentObject.getClass().getSimpleName().equals(\"Album\")}">
<h3 class="card-header"> Viewing all comments on ${parentObject.title}</h3>
</c:when>
</c:choose>
<c:if test="${ not empty sessionScope.loggedIn }">
<div class=col><a class="btn btn-warning" href="reply.do?parent=${parentObject.getClass().getSimpleName()}&id=${parentObject.id}">Reply to This</a></div>
</c:if>
<!-- </div> -->
<c:forEach var="c" items="${commentList}">
<div class="card">
<h5 class="card-title">${c.user.username} (${c.createdAt}) says: </h5>
<p class="card-text">${c.body}</p>
	<c:choose>
	<c:when test="${ sessionScope.loggedIn.id == c.user.id }">
	<a class="btn btn-warning btn-sm" href="deleteComment.do?parent=${ parentObject.getClass().getSimpleName() }&parentId=${parentObject.id}&commentId=${c.id}">DELETE THIS COMMENT</a>
	</c:when>
	</c:choose>
</div>
</c:forEach>

</jsp:attribute>
</t:pageLayout>