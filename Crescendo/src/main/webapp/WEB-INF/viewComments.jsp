<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Viewing comment thread</jsp:attribute>
	<jsp:attribute name="body">

<!-- FIXME: Header is not displaying properly-->
<div class="row">
<c:choose>
<c:when
					test="${parentObject.getClass().getSimpleName().equals(\"Blog\")}">
<h3 class="card-header">Viewing  ${parentObject.user.username}'s blog post "${parentObject.title} and its Comments"</h3>
<p class="text-justify">${parentObject.body}</p>
</c:when>
<c:when
					test="${parentObject.getClass().getSimpleName().equals(\"Topic\")}">
<h3 class="card-header">Viewing replies to ${parentObject.user.username}'s thread "${parentObject.title}"</h3>
<p class="text-justify">
					<em>${firstComment.body }</em> </p>
</c:when>
<c:when
					test="${parentObject.getClass().getSimpleName().equals(\"Album\")}">
<h3 class="card-header"> Viewing all comments on ${parentObject.title}</h3>
</c:when>
</c:choose>
<a class="btn btn-warning" href="reply.do?parent=${parentObject.getClass().getSimpleName()}&id=${parentObject.id}">Reply to This</a>
</div>
<c:forEach var="c" items="${commentList}">
<div class="card">
<h4 class="card-title">${c.user.username} (${c.createdAt}) says: </h4>
				<br>
<p class="card-text">${c.body}</p>
</div>
</c:forEach>

</jsp:attribute>
</t:pageLayout>