<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

	<spring:url value="/resources/references/css/bootstrap.min.css" var="bootstrap" />
	<spring:url value="/resources/references/js/jquery.min.js" var="jqueryJs" />
	<spring:url value="/resources/references/js/bootstrap.min.js" var="bootstrapjs" />

	<link href="${bootstrap}" rel="stylesheet" />
    <script src="${jqueryJs}"></script>
    <script src="${bootstrapjs}"></script>
<style>
.glyphicon.glyphicon-wrench {font-size: 100px;}
.glyphicon.glyphicon-fire{  font-size: 100px;}
.glyphicon.glyphicon-ok{font-size: 100px;}


</style>

</head>
<body>


<div class="container-fluid">
    <h3><b>Sign Up</b></h3> 
    
    
</div>
<hr>

<div class="container-fluid">
<form>
<div class="form-group">
    <label for="text">Name:</label>
    <input type="text" class="form-control" id="name">
  </div>
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="password">Password:</label>
    <input type="password" class="form-control" id="password">
  </div>
  <div class="form-group">
    <label for="password">Confirm Password:</label>
    <input type="password" class="form-control" id="password_cnfrm">
  </div>
  <div class="form-group">
    <label for="comment">Address:</label>
  <textarea class="form-control" rows="3" id="address"></textarea>
  </div>
  <div class="form-group">
    <label for="number">Phone Number:</label>
    <input type="number" class="form-control" id="p_number">
  </div>
  <button type="submit" class="btn btn-default">Sign Up</button>
</form>
</div>

<br>

 <div class="footer " class="footer " style=" height:50px; background-color:#000000;"  >
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>
</body>
</html>