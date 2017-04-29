<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<tilesx:useAttribute name="current"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
	<style>
body {
	padding-top: 40px;
	padding-bottom: 40px;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
	
<title><tiles:getAsString name="title" /></title>
</head>
<body>

 <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<spring:url value="/"/>">Codeangles JBA</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="${current=='index'?'active':''} "><a href='<spring:url value="/"/>'>Home</a></li>
              <security:authorize access="hasRole('USER_ADMIN')">
              	<li class="${current=='users'?'active':''}"><a href="<spring:url value="/users.html"/>">Users</a></li>
              </security:authorize>
              <li class="${current=='register'?'active':''}"><a href="<spring:url value="/register.html"/>">Register</a></li>
              <security:authorize access="!isAuthenticated()">          
              	<li class="${current=='login'?'active':''}"><a href="<spring:url value="/login.html"/>">Login</a></li>            
              </security:authorize>
              <security:authorize access="isAuthenticated()">
             	<li class="${current=='users'?'active':''}"><a href="<spring:url value="/account.html"/>">My Account</a></li>  
               <li><a href="<spring:url value="/logout"/>">Logout</a></li>
              </security:authorize>       
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

	<tiles:insertAttribute name="body" />
	<br>
	<br>
	<center>
		<tiles:insertAttribute name="footer" />
	</center>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
</body>
</html>