<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<c:import url="/head-meta" />
</head>
<c:import url="/head" />

<div class="container">

<form:form  method="post"  action="AddProductToDB"  modelAttribute="Product">
<br/>
<form:input path="pCategory" type="text" placeholder="Enter Product Name" class="form-control"/>
<br/>
<form:input path="pDescription" type="text" placeholder="Enter Description" class="form-control"/>
<br/>
<form:input path="pPrice" type="text" placeholder="Enter Price" class="form-control"/>
<br/>
<form:input path="pQuantity" type="text" placeholder="Enter Quantity" class="form-control"/>
<br/>

<input type="submit" value ="submit" class="btn btn-primary">
</form:form>


<body>
</body>
</html>