<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Search results</jsp:attribute>
	<jsp:attribute name="body">
		<c:forEach var="c" items="${resultList}">
			<c:choose> 
				<c:when test="${c.getClass().getSimpleName().equals(\"Blog\")}">
				<h5> <a href="showBlog.do?id=${c.id }">${c.title }</a></h5>
			<em> by <a href="getUserProfile.do?id=${c.user.id}">${c.user.username}</a>${c.edited == 0 ? "" : "(edited)" }:</em>
					<br>
			<p><em>${ c.getSample() }...</em></p>
			<p>(${ c.blogComments.size() } replies ) }</p>
				</c:when>
				<c:when test="${c.getClass().getSimpleName().equals(\"Topic\")}">
				<h5> <a href="viewComments.do?type=topic&id=${c.id }">${c.title }</a></h5>
					<em>${c.threadComments.get(0).user.username} says: </em>
					<br>
					<p>	${c.threadComments.get(0).body}</p>
				</c:when>
				<c:when test="${c.getClass().getSimpleName().equals(\"Album\") }">
				<h5> <a href="viewAlbum.do?id=${c.id }">${c.title }</a></h5>
				<div class="row">
				<div class="col">
				<c:choose>
					<c:when test="${not empty c.coverUrl }">
						<img href="viewAlbum.do?id=${ c.id }" class="card-image-bottom"
										style='height: 100%; width: 100%; object-fit: contain'
										src="${c.coverUrl}" class="rounded float-left" alt="Cover Art" />
					</c:when>
					<c:otherwise>
						<img class="card-image-bottom"
										style='height: 100%; width: 100%; object-fit: contain'
										src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
										class="rounded float-left"
										alt="No cover art uploaded for this album">
					</c:otherwise>
				</c:choose>
				</div>
				<div class="col">
					<h3>${c.title}</h3>
					<h4>By ${c.artist.name} (${c.releaseYear})</h4><br>
					<p>${c.description}</p>
				</div>
				</div>
				</c:when>
			</c:choose>
		</c:forEach>
	
	</jsp:attribute>
</t:pageLayout>