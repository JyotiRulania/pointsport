<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="col-md-4 col-md-offset-4">
    <h3><b>Log In</b></h3> 
</div>
</div>
  
<div class="container-fluid">
<div class="col-md-4 col-md-offset-4">
 
			<c:if test="${param.error != null}">
				<div class="alert alert-danger">
					<p>Invalid Username and password.</p>
				</div>
			</c:if>
			<c:if test="${param.logout != null}">
				<div class="alert alert-success">
					<p>You have been logged out successfully.</p>
				</div>
			</c:if>  
<form  method="post"  action="login" class="form-horizontal">
<div class="container-fluid"> 

    <div class="input-group">
        <label class="text text-danger"><form:errors path="Username" /></label>
        <input type="text" class="form-control" name="Username" path="Username"  placeholder="Enter your User Name"/>
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    </div>
    <br>

    <div class="input-group">
        <label class="text text-danger"><form:errors path="Password" /></label>
        <input type="password" class="form-control" name="Password" path="Password" placeholder="Enter your Password"/>
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    </div>
   </br>
     <div style="margin-top: 10px" class="form-group"></div> 
       <!-- button -->
       <div class="col-sm-12 controls">
          <input type="submit" value="login" class="btn btn-warning btn-block">
       </div>
</div>

</form>
</div>
</div>




 <div class="footer "  >
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>
</body>
</html>