<%@tag description="Navigation bar for all pages" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar-nav fixed-bottom navbar-dark bg-text-muted">
	<form action="search.do" method="GET">

		<div class="form-row">
			<div class="form-group col-2">Search for</div>
			<div class="form-group col-3">
				<select class="form-control form-control-sm" name="resultType">
					<option value="Blog">blog posts</option>
					<option value="Topic">topic threads</option>
					<option value="Album">albums</option>
					<option value="bst">buy/sell/trades</option>
				</select>
			</div>
			<div class="form-group col-1">by</div>
			<div class="form-group col-2">
				<select class="form-control form-control-sm" name="searchType">
					<option value="keyword" required>keyword</option>
					<option value="username" required>username</option>
				</select>
			</div>
			<div class="form-group col-2">
				<input type="text" class="form-control" name="val" required>
			</div>
			<div class="form-group col-1">
				<button class="btn btn-secondary" required type="submit">Search</button>
			</div>
		</div>
	</form>

</nav>
