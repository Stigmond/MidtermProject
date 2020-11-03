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
				<h4>By ${album.artist.name} (${album.releaseYear})</h4>
					<br>
				<p>${album.description}</p>
				</div>
				<c:choose>
					<c:when test="${not empty album.coverUrl }">
						<img class="card-image-bottom"
							style='height: 100%; width: 100%; object-fit: contain'
							src="${album.coverUrl}" class="rounded float-left"
							alt="Cover Art" />
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
		
		<div id="updateInfo" class="col">
					<div class="card" style="width: 18rem;">
						<div class="card-header">Update the Selected Album:</div>
  						<div class="card-body">
  						<form class="needs-validation" novalidate
							action="createAlbum.do"> 
  <div class="form-row">
      <label for="validationCustom01">Title</label>
      <input type="text" class="form-control" id="validationCustom01"
									name="title" value="${album.title}" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="form-row">
      <label for="validationCustom02">Cover Image (Url)</label>
      <input type="text" class="form-control" id="validationCustom02"
									name="coverUrl" value="${album.coverUrl}" required>
      <div class="valid-feedback">
        Looks good!     
      </div>
    </div>
    <div class="form-row">
      <label for="validationCustom02">Artist</label>
      <input type="text" class="form-control" id="validationCustom02"
									name="artistName" value="${album.artist.name}" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="form-row">
      <label for="validationCustom03">Release Year</label>
      <input type="number" class="form-control" id="validationCustom03"
									min="1877" name="releaseYear" value="${album.releaseYear}"
									required>
      <div class="invalid-feedback">
        Thomas Edison's phonograph was not yet invented.
      </div>
    </div>
    <div class="form-row">
      <label for="validationCustom05">Description</label>
      <textarea name="description" class="form-control"
									id="validationCustom05">${album.description}</textarea>
      <div class="invalid-feedback">
        Please provide a valid description.
      </div>
							
							</div>
</form>
					</div>
  <button class="btn btn-primary" type="submit">Submit form</button>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
</div>
		</div>
</div>	
	
	
	
	</jsp:attribute>
</t:pageLayout>
