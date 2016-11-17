<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:import url="/head-meta" />

<title> pointsport</title>
</head>

<script type="text/javascript">
var myApp = angular.module("myApp",[]);
myApp.controller("myCntrl", function($scope){
	$scope.data = ${Product};
})
</script>
<body ng-app="myApp" ng-controller="myCntrl">

	<c:import url="/head" />
	<br>
	<br>

	<br>
	<br>
	<div class="container">
		<a href="addproduct"
		  class="button4 btn-center btn-success btn pull-right" align="right">AddProduct</a>
	<br>
	<br>
		<table class="table ">
			<tbody>
				<tr ng-repeat="x in data">
                <td>
					<label>Product Name :&nbsp;{{x.pName}}</label>
						<div class="btn1">
								<a href="updateProduct/{{x.ProductId}}"
									class="button3">UPDATE</a>
							</div>
						<div class="btn1">
								<a href="DeleteProductFromDB/{{x.ProductId}}"
									class="button3">DELETE</a>
							</div>
						</td>
					</tr>
			 </tbody>
	    </table>
	</div>
</body>
</html>