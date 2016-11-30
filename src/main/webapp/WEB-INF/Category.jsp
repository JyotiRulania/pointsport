<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />


<title> pointsport</title>
</head>

<script type="text/javascript">
	var MyApp = angular.module("myApp",[]);
	MyApp.controller("myCntrl", function($scope){
	$scope.data = ${Categories};
	})

</script>

<body  ng-app="myApp" ng-controller="myCntrl">

	<c:import url="/head" />
	<br>
	<br>

	<br>
	<br>
	<div class="container">
		<a href="addcategory"
		  class="button4 btn-center btn-success btn pull-right" align="right">AddCategory</a>
	<br>
	<br>
		<table class="table ">
			<tbody>
				<tr ng-repeat="x in data">
                <td>
                
					<label>Category Name :&nbsp;{{x.CategoryName}}</label>
						<div class="btn1">
								<a href="updatecategory/{{x.CategoryId}}"
									class="button3">UPDATE</a>
							</div>
						<div class="btn1">
								<a href="DeleteCategoryFromDB/{{x.CategoryId}}"
									class="button3">DELETE</a>
							</div>
						</td>
					</tr>
			 </tbody>
	    </table>
	</div>
</body>
<div class="footer " style=" height:50px; background-color:LightSeaGreen; margin-top:300px">
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>

</html>