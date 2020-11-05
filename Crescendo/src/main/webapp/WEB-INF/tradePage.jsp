<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageLayout>
	<jsp:attribute name="title">Viewing Trade Offer</jsp:attribute>
	<jsp:attribute name="body">
	
	<div class= "row justify-content-center">
	<h3>${t.title}</h3>
	</div>
	
	<div class= "row">
	<div class= "col">
	${t.body}
	</div>
	<div class= "col">
	<table>
	<tr><td>Listed Since:</td><td>${t.createdAt}</td></tr>
	<tr><td colspan="2"><a href="getUserProfile.do?id=${t.user.id}">Contact the poster</a></td></tr>
	</table>
	
	
	</div>
	</div>
	<div class="row">
		<div class= "col">
		<c:if test="${not empty sessionScope.loggedIn && sessionScope.loggedIn.id == t.user.id}">
			<hr>
			<a class="btn btn-danger btn-sm" href="tradeDelete.do?id=${t.id}" role="button">Delete Ad</a>
		</c:if>
		</div>
	</div>
	
	
	</jsp:attribute>
	</t:pageLayout>