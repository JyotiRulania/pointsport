<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
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

.footer {
 position:absolute;
   bottom:0;
   width:100%;
   height:60px;   /* Height of the footer */
   background:#000000;
} 
</style>

</head>
<body>
<c:import url="/head" />
<div class="container-fluid">
    <h3><b>Log In</b></h3> 
    
    
</div>
<hr>

<div class="container-fluid">
<form>
<div class="form-group">
    <label for="text">User Name:</label>
    <input type="text" class="form-control" id="name">
  </div>
  <div class="form-group">
    <label for="email">Password:</label>
    <input type="email" class="form-control" id="email">
  </div>
  
  <button type="submit" class="btn btn-default">Log In</button>
</form>
</div>



 <div class="footer "  >
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>
</body>
</html>