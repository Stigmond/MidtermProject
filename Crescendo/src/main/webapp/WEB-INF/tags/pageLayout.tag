<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@tag
	description="Skeleton page to handle basic layout, bootstrap includes, etc."
	pageEncoding="UTF-8"%>
<%@attribute name="body" fragment="true"%>
<%@attribute name="title" fragment="true"%>

<!DOCTYPE html>
<html>
	<head>
<!-- Required meta tags -->
<t:bootstrapmeta />
<!--  jsp:invoke lets us identify specific information when using this tag later -->
<title> <jsp:invoke fragment="title" /> </title>
<t:bootstrapstyle />

</head>

<body>
	<div class="container">

		<!-- 	Put this at the top of the main container for every JSP-->
		<t:navbar />

		<jsp:invoke fragment="body" />

	</div>
<t:searchbar/>
	<t:bootstrapjs />

</body>
</html>