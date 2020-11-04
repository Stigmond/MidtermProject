<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageLayout>
	<jsp:attribute name="title">Blog post by ${blog.user}</jsp:attribute>
	<jsp:attribute name="body">
	
	<p>${blog.id}</p>
	<p>${blog.title}</p>
	<p>${blog.user}</p>
	<p>${blog.body}</p>
	<p>${blog.headerMediaUrl}</p>
	
	
	
	</jsp:attribute>
	</t:pageLayout>