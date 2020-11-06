<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Search Results for Buy/Sell/Trade</jsp:attribute>
	<jsp:attribute name="body">
	<c:choose>
	<c:when test= "${empty resultList}">
	<h1>No Offers Found</h1>
	</c:when>
	<c:otherwise>
	
			<table class="table">
			<thead>
			<tr>
			<th scope="col">Title</th>
			<th scope="col">Offer Type</th>
			<th scope="col">Type of Good</th>
			<th scope="col">Creator</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="t" items="${resultList}">
			<tr>
			<td><a href="tradePage.do?id=${t.id}">${t.title}</a></td>
			<td>${t.direction}</td>
			<td>${t.goodType}</td>
			<td><a href="tradeByUser.do?cid=${t.user.id}">${t.user.username}</a></td>
			</tr>
			</c:forEach>
			
			</tbody>
			</table>
	
	</c:otherwise>
	</c:choose>
	</jsp:attribute>
</t:pageLayout>