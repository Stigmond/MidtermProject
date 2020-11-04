<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:pageLayout>
	<jsp:attribute name="title">Replying to a Discussion</jsp:attribute>
	<jsp:attribute name="body">
	<div class="row">
	<strong><em>Replying To: </em></strong><br>
	<p class="text-justify">${sessionScope.parentObject.body}</p>
		</div>
 <div class="row">
	<form action="commentReply.do" method="POST">
	<div class="form-group">
		<textarea rows="8" class="form-control" id="bodyText" name="body"></textarea>
		<input type="submit" value="Submit" class="btn btn-primary">
	</div>
	</form>
</div>
	
	</jsp:attribute>
</t:pageLayout>