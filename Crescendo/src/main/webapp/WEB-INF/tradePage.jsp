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
	<tr><td colspan="2">Contact the poster</td></tr>
	</table>
	</div>
	</div>
	
	
	</jsp:attribute>
	</t:pageLayout>