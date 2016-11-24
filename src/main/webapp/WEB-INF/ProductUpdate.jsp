<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
	<c:import url="/head"/>

	<br>
	<br>
	<br>
	<br>

	<div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
    <h3>
				<strong>UPDATE PRODUCT</strong>
			</h3>
		</div>
	</div>
	<hr>


<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
		
		<form:form action="${pageContext.request.contextPath}/UpdateProductToDB" method="post" modelAttribute="Product" enctype="multipart/form-data">

			 <form:label path="pName">Product Name</form:label>
                 <form:input type="text" path="pName" class="form-control"/>
				<br>
				<form:input path="pId" type="hidden" />
				<form:label path="pName">Product Category</form:label>
			
				<td>
					
					<form:select path="pCategory" class="form-control">
					<c:choose>
					  <c:when test="${not empty Categories}">
						  <c:forEach var="cat" items="${Categories}">
							<form:option value="${cat}"/>
						  </c:forEach>
					  </c:when>
					  
						<c:otherwise>
							<form:option value="None"/>
						</c:otherwise>
					</c:choose>
					</form:select>
				
					</td>
				
				
				<br>
				<form:label path="pName">Product Description</form:label>
				<form:input type="text" path="pDescription" class="form-control"/>
				<br>
				<form:label path="pName">Product Quantity</form:label>
				<form:input type="text" path="pQuantity" class="form-control"/>
				<br>
				<form:label path="pName">Product Price</form:label>
				<form:input type="text" path="pPrice" class="form-control"/>
				<br>
					<tr>

					<td><form:label path="pImage" for="pImage">Image:</form:label></td>
                      <td>
						<label class="form-control"><span id="file_display1">ChooseImage</span><span style="position: relative;"> <form:input
									path="productFile" onchange="changeFileDisplay1();" type="file"
									style="opacity:0;" class="form-control" id="imageFile1" /></span></label> 
						<script type="text/javascript">function changeFileDisplay1() {
							document.getElementById("file_display1").innerHTML = $(
													'#imageFile1').val();
											;
										}
						</script>
					  </td>
			       </tr>
					<br>
					<br>
					
				  <tr>
					   <td colspan="2"><input type="submit" class="btn btn-success " value="Save" /></td>
				  </tr>
	 </form:form>
			</div>

	</div>
</body>
</html>