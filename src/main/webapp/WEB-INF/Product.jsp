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
			<tr>
			<th>Product Name</th>
			<th>Product category</th>
			<th> Product Description </th>
			<th> Product Price</th>
			<th> Product Quantity</th>
			<th> Product Image</th>
			</tr>
				<tr ng-repeat="x in data">
                <td>{{x.pName}}</td>
                  <td>{{x.pCategory}}</td>
                   <td>{{x.pDescription}}</td>
                    <td>{{x.pPrice}}</td>
                     <td>{{x.pQuantity}}</td>
                     <td><img
						ng-src="${pageContext.request.contextPath}/{{ x.pImage }}" height=" 50px" width="100px"></td>

                     <td>
						<div class="btn1">
							<a href="${pageContext.request.contextPath}/view/{{x.pId}}"
								class="button3 ">VIEW</a>
						</div>
						<%
						if (request.isUserInRole("ADMIN"))
						{
							%>
							<td><div class="btn1"><a href="updateproduct/{{x.pId}}" class="button3">UPDATE</a></div></td>
							<td>						<div class="btn1">
								<a href="DeleteProductFromDB/{{x.pId}}"
									class="button3">DELETE</a>
							</div>
						</td>
							<%							
						}
						%>

						
					
                  
						
					</tr>
			 </tbody>
	    </table>
	</div>
</body>
</html>