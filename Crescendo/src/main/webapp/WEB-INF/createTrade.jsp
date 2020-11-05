<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:pageLayout>
	<jsp:attribute name="title">Add a Listing</jsp:attribute>
	<jsp:attribute name="body">
	
	<div class= "row justify-content-center">
	<h2>Create a Listing</h2>
	</div>
	<br>
	<div class= "row justify-content-center">
	<div class= "row justify-content-center">
	<div class="col">
			<h4>Please Enter the Following Information</h4>

			<form action="addTrade.do">
			
			<div class="form-group">
    			<label for="direction">I am looking to</label>
    			<select class="form-control" name="direction" id="direction">
      				<option value="buy">buy</option>
      				<option value="sell">sell</option>
      				<option value="trade">trade</option>
    			</select>
  			</div>
  			<div class="form-group">
    			<label for="goodType">an</label>
    			<select class="form-control" name="goodType" id="goodType">
      				<option value="record">album</option>
      				<option value="instrument">instrument</option>
    			</select>
  			</div>
			<br>
			<label for="title">Listing Title:</label>
			<input type="text" name="title" size="40" required>
			<br>
			<label for="body">Listing Info:</label><br>
			<textarea name="body" rows="3" cols="40"></textarea>
			
			<input type="submit" value="Add Listing">
			</form>
		</div>
		</div>
	</div>
	
	
	</jsp:attribute>
</t:pageLayout>