<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<c:import url="/head-meta"/>
</head>
<c:import url="/head"/>

<div class="container">

<form:form  method="post"  action="${pageContext.request.contextPath}/UpdateCategoryToDB"  modelAttribute="Category">
<form:input path="CategoryName" type="text" class="form-control" placeholder="Enter Category Name"/>
<form:input path="CategoryId" type="hidden"/>
<br>
<input type="submit" value ="submit" class="btn btn-primary">
</form:form>

</div>
<body>
</body>
</html>