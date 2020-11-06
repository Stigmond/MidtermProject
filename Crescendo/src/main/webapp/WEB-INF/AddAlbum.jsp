<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Add An Album</jsp:attribute>
	<jsp:attribute name="body">
	
	
	<H1> <em>Create or Add an Album to the Database Library</em>
		</H1> 
<form class="needs-validation" novalidate action="createAlbum.do"> 
  <div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="validationCustom01">Title</label>
      <input type="text" class="form-control" id="validationCustom01"
						name="title" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom02">Cover Image (Url)</label>
      <input type="text" class="form-control" id="validationCustom02"
						name="coverUrl" required>
      <div class="valid-feedback">
        Looks good!     
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom02">Artist</label>
      <input type="text" class="form-control" id="validationCustom02"
						name="artistName" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
  </div>
  <div class="form-row">
    <div class="col-md-2 mb-3">
      <label for="validationCustom03">Release Year</label>
      <input type="number" class="form-control" id="validationCustom03"
						min="1877" name="releaseYear" required>
      <div class="invalid-feedback">
        Thomas Edison's phonograph was not yet invented.
      </div>
    </div>
    <!--
    need to add field in album database for genre
    
     <div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button"
						name="genre" id="dropdownMenu2" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
    Genre
  </button>
  <div class="dropdown-menu active" aria-labelledby="dropdownMenu2">
    <button class="dropdown-item" type="button" value="1">Neo-Classical Post-Metal</button>
    <button class="dropdown-item" type="button" value="2">Progressive Post-Electronic Anti-Grunge</button>
    <button class="dropdown-item" type="button" value="3">Alternative Neo-Jazz</button>
    <button class="dropdown-item" type="button" value="4">Post-Deconstructive Impressionist Anti-Rock</button>
  </div>
</div> -->
<br>
<br>
    <div class="col-md-10 mb-3">
      <label for="validationCustom05">Description</label>
     <textarea name="description" class="form-control" id="validationCustom05" rows="4" cols="60"></textarea>
      <!-- <input type="text" class="form-control" id="validationCustom05"
						name="description" required> -->
      <div class="invalid-feedback">
        Please provide a valid description.
      </div>
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Submit form</button>
</form>
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	</jsp:attribute>
</t:pageLayout>