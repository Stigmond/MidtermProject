<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageLayout>
	<jsp:attribute name="title">Post by: ${topic.title}</jsp:attribute>
	<jsp:attribute name="body">
	<h3>POSTS FOR: "${topic.title}"</h3>
	<c:forEach var="comment" items="${topic.threadComments}">
	<tr>
	<td><span>${comment.user.username}</span></td> <td><span>${comment.createdAt}</span></td> <td><span>${comment.body}</span></td>
	</tr>
	<br>
	</c:forEach>
	
	
	
	
	
	</jsp:attribute>
	</t:pageLayout>