<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
</head>

<body style="background-color:cyan;" ng-app="myApp" ng-controller="abc">
	<c:import url="/head" />
	<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
			<h3>
				<b>AddProduct</b>
			</h3>
		</div>
	</div>
	<hr>

	<div class="col-md-4 col-md-offset-4">
		<form:form class="form-horizontal" role="form" method="post" action="AddProductToDB" modelAttribute="Product" enctype="multipart/form-data">
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="pName" type="text" class="form-control" placeholder="Enter Product Name" />
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
			<form:select path="pCategory" class="form-control">
				<c:choose>
					<c:when test = "${not empty AllCategories}">
					<c:forEach var="cat" items="${AllCategories}">
						<form:option value="${cat}"/>
					</c:forEach>
					</c:when>
					
					<c:otherwise>
					<form:option value="None"/>
					</c:otherwise>
				</c:choose>
			</form:select>
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="pDescription" type="text" class="form-control" placeholder="Enter Product Description" />
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="pPrice" type="text" class="form-control" placeholder="Enter Product Price" />
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="pQuantity" type="number" class="form-control" placeholder="Enter Product Quantity" />
			</div>
			
			<div style="margin-bottom: 25px" class="col-lg-12">
				<label class="form-control"><span
							id="file_display1">Choose Image</span><span
							style="position: relative;"><form:input path="productFile"
									onchange="changeFileDisplay1();" type="file" style="opacity:0;"
									class="form-control" id="imageFile1" /></span></label> <script
							type="text/javascript">
										function changeFileDisplay1() {
											document
													.getElementById("file_display1").innerHTML = $(
													'#imageFile1').val();
											;
										}
									</script>
			
			</div>
			
			<div style="margin-top: 10px" class="col-lg-12">
				<!-- Button -->
			
					<input type="submit" value="Add" class="btn btn-warning btn-block" />
							</div>
		</form:form>
	</div>

	<div class="footer " style=" height:50px; background-color:LightSeaGreen; margin-top:600px">
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>

</body>
</html>