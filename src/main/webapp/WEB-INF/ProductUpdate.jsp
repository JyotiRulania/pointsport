<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<c:import url="/head-meta"/>
</head>
<c:import url="/head"/>

<div class="container">

<form:form  method="post"  action="${pageContext.request.contextPath}/UpdateProductToDB"  modelAttribute="Product">
<form:input path="pName" type="text" class="form-control" placeholder="Enter Product Name"/>
<br/>
<form:input path="pId" type="hidden"/>
<br/>
<form:input path="pCategory" type="text" class="form-control" placeholder="Enter Category Name"/>
<br/>
<form:input path="pDescription" type="text" class="form-control" placeholder="Enter Description Name"/>
<br/>
<form:input path="pPrice" type="text" class="form-control" placeholder="Enter Price Name"/>
<br/>
<form:input path="pQuantity" type="text" class="form-control" placeholder="Enter Quantity Name"/>
<br/>
<input type="submit" value ="submit" class="btn btn-primary">
</form:form>

</div>
<body>
</body>
</html>