<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:pageLayout>
	<jsp:attribute name="title">Buy/Sell/Trade With Crescendo</jsp:attribute>
	<jsp:attribute name="body">
	<div class= "row justify-content-center">
		<h3>Buy/Sell/Trade Offers</h3>
		
		</div>
		<div class="row">
			<div class="col">
			<table class="table">
			<thead>
			<tr><th colspan= "4" class= "text-center"><strong>Buy/Sell</strong></th></tr>
			<tr>
			<th scope="col">Title</th>
			<th scope="col">Offer Type</th>
			<th scope="col">Type of Good</th>
			<th scope="col">Creator</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var= "t" items= "${buySellList}">
			<tr>
			<td><a href= "tradePage.do?id=${t.id}">${t.title}</a></td>
			<td>${t.direction}</td>
			<td>${t.goodType}</td>
			<td><a href= "tradeSearch.do?cid=${t.user.id}">${t.user.username}</a></td>
			</tr>
			</c:forEach>
			
			</tbody>
			</table>
		</div>
			<div class="col">
			<table class="table">
			<thead>
			<tr><th colspan= "3" class= "text-center"><strong>Trade Offers</strong></th></tr>
			<tr>
			<th scope="col">Title</th>
			<th scope="col">Type of Good</th>
			<th scope="col">Creator</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var= "t" items= "${tradeList}">
			<tr>
			<td><a href= "tradePage.do?id=${t.id}">${t.title}</a></td>
			<td>${t.goodType}</td>
			<td><a href= "tradeSearch.do?cid=${t.user.id}">${t.user.username}</a></td>
			</tr>
			</c:forEach>
			
			</tbody>
			</table>
		</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="text-center">
					<div><br><a class="btn btn-secondary btn-sm" href="createTrade.do" role="button">Add Good/Service</a></div>
				</div>	
			</div>
		</div>
	
	
	</jsp:attribute>
</t:pageLayout>