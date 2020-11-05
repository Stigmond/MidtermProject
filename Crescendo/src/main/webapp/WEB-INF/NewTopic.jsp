<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:pageLayout>
	<jsp:attribute name="title">Create a new discussion thread</jsp:attribute>
	<jsp:attribute name="body">
	<h3 class="row">Starting a new Discussion...</h3>
	<form action="newPost.do" method="POST">
	<div class="form-row">
		<div class="col">
			This is a 
				<select class="form-control form-control-sm" name="postType">
					<option value="blog">Blog Post</option>
					<option value="topic">Discussion Thread</option>
				</select><br>
					<div class= "form-group">
					<label for= "bodyText">
					What would you like to say?
					</label>
					<input type= "text" class= "form-control" placeholder= "Enter a Title..." name= "postTitle" required>
					<textarea name="body" rows="8" class= "form-control" id= "bodyText" required></textarea>
					</div>
		</div>
		<div class= "col"> 
		Select Genres (if any)
		<div class= "form-group">
		<input type= "checkbox" class= "form-check-input" id= "g1" name= "genre" value=1>
		<label class= "form-check-label" for= "g1">NEO-CLASSICAL POST-METAL</label><br>
		
		<input type= "checkbox" class= "form-check-input" id= "g2" name= "genre" value=2>
		<label class= "form-check-label" for= "g2">PROGRESSIVE POST-ELECTRONIC ANTI-GRUNE</label><br>
		
		<input type= "checkbox" class= "form-check-input" id= "g3" name= "genre" value=3>
		<label class= "form-check-label" for= "g3">ALTERNATIVE NEO-JAZZ</label><br>
		
		<input type= "checkbox" class= "form-check-input" id= "g4" name= "genre" value=4>
		<label class= "form-check-label" for= "g4">POST-DECONSTRUCTIVE IMPRESSIONIST ANTI-ROCK</label><br>
		<input type= "text" class= "form-control" placeholder= "Enter a URL for video or image header..." name= "headerMediaUrl">
		</div>
		<button class= "btn btn-primary" type= "submit">Submit</button> 
		
		</div>
	</div>
	</form>
	</jsp:attribute>
</t:pageLayout>