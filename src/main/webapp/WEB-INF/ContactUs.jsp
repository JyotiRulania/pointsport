<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:import url="/head-meta" />
</head>
<body style="background-color:cyan;" ng-app="myApp" ng-controller="abc">

<c:import url="/head" />

<div class="container-fluid">
    <h3><b>Contact US</b></h3> 
    
    
</div>
<hr>

<div class="container-fluid">
<form>
<div class="form-group">
    <label for="text">Name:</label>
    <input type="text" class="form-control" >
  </div>
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="comment">Comment:</label>
  <textarea class="form-control" rows="5" id="comment"></textarea>
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>



 <div >
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>
</body>
</html>