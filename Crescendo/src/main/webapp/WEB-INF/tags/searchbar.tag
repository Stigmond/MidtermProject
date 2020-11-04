<%@tag description="Navigation bar for all pages" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar-nav fixed-bottom navbar-dark bg-primary">
	<form action="search.do" method="GET">
		<!-- <div class="row">
			<div class="col">Search for</div>
			<div class="col">
				<select class="form-control form-control-sm">
					<option>blog comments</option>
					<option>album comments</option>
					<option>topic comments</option>
					<option>blog posts</option>
					<option>topic threads</option>
					<option>albums</option>
				</select>
			</div>
			<div class="col">By</div>
			<div class="col">
				<select class="form-control form-control-sm">
					<option>keyword</option>
					<option>username</option>
				</select>
			</div>
			<div class="col">
				<input type="text" class="form-control" name="val">
			</div>
			<div class= "col">
			<button class= "btn btn-secondary" type= "submit">
			Search
			</button>
			</div>
		</div> -->

		<div class="form-row">
			<div class="form-group col-2">Search for</div>
			<div class="form-group col-3">
				<select class="form-control form-control-sm" name= "resultType">
					<option value= "blogComment">blog comments</option>
					<option value= "albumComment">album comments</option>
					<option value= "topicComment">topic comments</option>
					<option value= "blog">blog posts</option>
					<option value= "topic">topic threads</option>
					<option value= "album">albums</option>
				</select>
			</div>
			<div class="form-group col-1">by</div>
			<div class="form-group col-2">
				<select class="form-control form-control-sm" name= "searchType">
					<option value= "keyword">keyword</option>
					<option value= "username">username</option>
				</select>
			</div>
			<div class="form-group col-2">
				<input type="text" class="form-control" name="val">
			</div>
			<div class="form-group col-1">
				<button class="btn btn-secondary" type="submit">Search</button>
			</div>
		</div>
	</form>

</nav>
