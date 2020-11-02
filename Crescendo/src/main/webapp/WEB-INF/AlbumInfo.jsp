<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Profile page for ${user.username}</jsp:attribute>
	<jsp:attribute name="body">
			<div class="row">
			<div class="col">
				<c:choose>
					<c:when test="${not empty album.coverUrl }">
						<img style='height: 100%; width: 100%; object-fit: contain'
							src="${album.coverUrl}" class="rounded float-left"
							alt="Cover Art" />
					</c:when>
					<c:otherwise>
						<img style='height: 100%; width: 100%; object-fit: contain'
							src="https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
							class="rounded float-left"
							alt="No cover art uploaded for this album">
					</c:otherwise>
				</c:choose>
			</div>

			<div class="col">
				<h2>${album.title}</h2>
				<br>
				<h3>By ${album.artist.name} (${album.releaseYear})</h3>
				<br><br>
				<p>${album.description}</p>
			</div>

		</div>
		<c:choose>
		<c:when test="${not empty commentSample}">
		<div class="row">
		<h3>Recent comments on this album: </h3>
		</div>
		<div class="row">
		<div class="col">
		<c:choose>
		<c:when test="${not empty commentSample.get(0).getBody()}">
		${commentSample.get(0).getBody()}
		</c:when>
		</c:choose>
		
		</div>
		<div class="col">
		<c:choose>
		<c:when test="${commentSample.size() > 1 && not empty commentSample.get(1).getBody()}">
		${commentSample.get(1).getBody()}
		</c:when>
		</c:choose>
		
		</div>
		<div class="col">
		<c:choose>
		<c:when test="${commentSample.size() > 2 && not empty commentSample.get(2).getBody()}">
		${commentSample.get(2).getBody()}
		</c:when>
		</c:choose>
		View all comments on this album
		
		</div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="row">
		</div>
		<h3>Be the first to talk about this album!</h3>
		</c:otherwise>
		</c:choose>
	</jsp:attribute>
</t:pageLayout>
