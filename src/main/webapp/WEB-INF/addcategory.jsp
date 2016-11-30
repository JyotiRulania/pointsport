<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<c:import url="/head-meta" />
</head>
<c:import url="/head" />

<div class="container">

<form:form  method="post"  action="AddCategoryToDB"  modelAttribute="Category">
<form:input path="CategoryName" type="text" class="form-control" placeholder="Enter Category Name"/>
<br>
<input type="submit" value ="submit" class="btn btn-primary">
</form:form>

</div>
<body style="background-color:cyan;" ng-app="myApp" ng-controller="abc">
<div class="footer " style=" height:50px; background-color:LightSeaGreen; margin-top:300px">
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>
</body>
</html>