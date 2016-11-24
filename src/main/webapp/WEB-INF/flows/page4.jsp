<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:import url="/head-meta" />
</head>
<body>

	<c:import url="/head" />

<div class="container-fluid">
    <h3><b>Page 4</b></h3> 
    
    <a href="${pageContext.request.contextPath}/index" class="btn btn-danger">Home</a>
    <a href="${pageContext.request.contextPath}/contactus" class="btn btn-success">Contact Us</a>
    
</div>
<hr>


</body>
</html>