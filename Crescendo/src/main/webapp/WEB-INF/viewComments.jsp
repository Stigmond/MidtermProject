<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageLayout>
<jsp:attribute name="title">Viewing comment thread</jsp:attribute>
<jsp:attribute name="body">
<div class="card">
<!-- FIXME: Header is not displaying properly-->
<c:choose>
<c:when test="${parentType == Parent.BLOG}">
<h3 class= "card-header">Viewing comments on ${parentObject.user.username}'s blog post "${parentObject.title}"</h3>
</c:when>
<c:when test="${parentType == Parent.THREAD}">
<h3 class= "card-header">Viewing replies to ${parentObject.user.username}'s thread "${parentObject.title}"</h3>
</c:when>
<c:when test="${parentType == Parent.ALBUM}">
<h3 class= "card-header"> Viewing all comments on ${parentObject.title}</h3>
</c:when>
</c:choose>
<c:forEach var= "c" items= "${commentList}">
<div class= "card-body">
<h4 class= "card-title">${c.user.username} (${c.createdAt}) says: </h4><br>
<p>${c.body}</p>
</div>
</c:forEach>



</div>
</jsp:attribute>
</t:pageLayout>