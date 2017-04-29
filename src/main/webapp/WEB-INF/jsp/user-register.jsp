<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<form:form commandName="user" cssClass="form-horizontal">

	<c:if test="${param.success eq true}">
		<div class="alert alert-success">
			Registration Successful
		</div>
	</c:if>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
      <form:input path="name" cssClass="form-control"id="inputEmail3" placeholder="Name"/>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <form:input path="email" cssClass="form-control" id="inputPassword3" placeholder="Email"/>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword4" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <form:password path="password" cssClass="form-control" id="inputPassword4" placeholder="Password"/>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Register</button>
    </div>
  </div>
</form:form>
