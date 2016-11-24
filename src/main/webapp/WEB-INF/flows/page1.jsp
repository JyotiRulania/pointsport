<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:import url="/head-meta" />
</head>
<script type="text/javascript">
  
  var myApp = angular.module("myApp",[]); 
  
  myApp.factory("UserService",["$http","$q",function($http,$q){
	
	  
	  var target_url='http://localhost:8080/pointsport/';
	  
	  return {
		     fetchAllItems:function()
		     {
		    	return $http.post(target_url+'REST/fetchAllItems').then(
		    		function( response){
		    			return response.data;
		    		},
		    		function(errResponse){
		    			return $q.reject(errResponse);
		    			
		    		}
		    	); 
		     }
		  
	  };
 }])
  
  
  
  
  myApp.controller("abc",["$scope",function($scope)
  {
	  console.log('hi');
	  
  }]);

</script>



<body ng-app="myApp" ng-controller="abc">

	<c:import url="/head" />

<div class="container-fluid">
    <h3><b>Page 1</b></h3> 
    
    <a href="${flowExecutionUrl}&_eventId=goToProducts" class="btn btn-danger">Back To Products</a>
    <a href="${flowExecutionUrl}&_eventId=goToCheckout" class="btn btn-success">Confirm Address Details</a>
</div>
<hr>


</body>
</html>