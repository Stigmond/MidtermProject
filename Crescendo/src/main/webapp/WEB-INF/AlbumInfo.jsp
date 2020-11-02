<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Profile page for ${user.username}</jsp:attribute>
	<jsp:attribute name="body">
			<div class="row">
			<div class="col">
				<div class="card">
					<h3 class="card-title">${album.title}</h3>
				<h4>By ${album.artist.name} (${album.releaseYear})</h4><br>
				<p>${album.description}</p>
				</div>
				<c:choose>
					<c:when test="${not empty album.coverUrl }">
						<img class="card-image-bottom" style='height: 100%; width: 100%; object-fit: contain'
							src="${album.coverUrl}" class="rounded float-left"
							alt="Cover Art" />
					</c:when>
					<c:otherwise>
						<img class="card-image-bottom" style='height: 100%; width: 100%; object-fit: contain'
							src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
							class="rounded float-left"
							alt="No cover art uploaded for this album">
					</c:otherwise>
				</c:choose>
			</div>
		
		<div id="sampleComments" class="col">
			<c:choose>
				<c:when test="${ empty commentSample }">
					No comments on this album. Be the first to write one!
				</c:when>
				<c:otherwise>
					<div class="card" style="width: 18rem;">
						<div class="card-header">Recent comments on this album:</div>
  						<div class="card-body">
  							<c:choose>
								<c:when test="${ not empty commentSample.get(0).body }">
    									<h5 class="card-title">${ commentSample.get(0).user.username } says:</h5>
   										<p class="card-text">${commentSample.get(0).body }</p>
								</c:when>
							</c:choose>
  						</div>
  						<div class="card-body">
  							<c:choose>
								<c:when test="${ commentSample.size() > 1 && not empty commentSample.get(1).body }">
    									<h5 class="card-title">${ commentSample.get(1).user.username } says:</h5>
   										<p class="card-text">${commentSample.get(1).body}</p>
								</c:when>
							</c:choose>
  						</div>
  						<div class="card-body">
  							<c:choose>
								<c:when test="${ commentSample.size() > 2 && not empty commentSample.get(2).body }">
    									<h5 class="card-title">${ commentSample.get(2).user.username } says:</h5>
   										<p class="card-text">${commentSample.get(2).body}</p>
								</c:when>
							</c:choose>
  						</div>
  						
  						<!-- TODO add controller method to create new album comment and another to view different types of comments based on params  -->
  						<a href="makeComment.do?type=album&id=${ album.id }" class="btn btn-secondary">Comment on this album</a><br>
  						<a href="viewComments.do?type=album&id=${ album.id }" class="btn btn-info">View all commments on this album</a><br>
  						</div>
				</c:otherwise>
			</c:choose>
		</div>

	</jsp:attribute>
</t:pageLayout>
