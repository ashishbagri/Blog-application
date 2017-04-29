<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>


	<form class="form-signin" action='/j_spring_security_check' method="POST">
		<h2 class="form-signin-heading">Please sign in</h2>
		<label for="inputEmail" class="sr-only">User name</label>
		<input
			type="text" name="j_username" id="inputEmail" class="form-control"
			placeholder="User Name" required autofocus>
			<label for="inputPassword" class="sr-only">Password</label>
			<input name="j_password" type="password" id="inputPassword" class="form-control"
			placeholder="Password" required>
		<button class="btn btn-lg btn-primary btn-block" type="submit" value="Login">Sign in</button>
	</form>

