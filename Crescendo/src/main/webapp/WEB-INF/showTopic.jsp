<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageLayout>
	<jsp:attribute name="title">Post by: ${topicPost.user.firstName}</jsp:attribute>
	<jsp:attribute name="body">
	
	<p>POST: ${topicPost.thread.title}</p>
	<p>BY: ${topicPost.user.username} ON ${topicPost.createdAt}</p>
	<br>
	<p>${topicPost.body}</p>
	
	
	
	
	</jsp:attribute>
	</t:pageLayout>