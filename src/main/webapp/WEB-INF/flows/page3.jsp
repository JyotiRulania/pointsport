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
    <h3><b>Page 3</b></h3> 
    
    <a href="${flowExecutionUrl}&_eventId=BackToConfirmDetails" class="btn btn-danger">Back to Address Details</a>
    <a href="${flowExecutionUrl}&_eventId=ConfirmOrder" class="btn btn-success">Confirm Order</a>
    
</div>
<hr>


</body>
</html>