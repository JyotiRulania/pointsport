<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<c:import url="/head-meta" />
	
</head>
<body>

	<c:import url="/head" />

  
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/images/j.jpg" alt="Tesla" width="500" height="500" >
      </div>

      <div class="item">
        <img src="resources/images/a.jpg" alt="Chania" width="500" height="500">
      </div>
    
      <div class="item">
        <img src="resources/images/image3.jpg" alt="Flower" width="500" height="500">
      </div>

      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<br><br>

<div class="container-fluid">

 
  <div class="row">
  <center>
    <div class="col-sm-4">
    
    <div class="row">
    <div class="col-sm-12" >
    
  <img src="resources/images/g.jpg" alt="Flower" width="200" height="200">
      
    </div>
    </div>
    <div class="row">
    <div class="col-sm-12" >
      <h3>Bedminton </h3>
      
      
    </div>
    </div>
    </div>
    
    <div class="col-sm-4" >
    <div class="row">
    <div class="col-sm-12" >
         <img src="resources/images/f.jpg" alt="Flower" width="200" height="200">
    </div>
    </div>
    <div class="row">
    <div class="col-sm-12" >
       <h3> Basketball </h3>
         
    </div>
    </div>
    
    </div>
    <div class="col-sm-4" >
    <div class="row">
    <div class="col-sm-12" >
        <img src="resources/images/d.jpg" alt="Flower" width="200" height="200">
    </div>
    </div>
    <div class="row">
    <div class="col-sm-12" >
        <h3>Cricket</h3>
       
    </div>
    </div>
    </div>
    </center>
  </div>
  
</div>

 <div class="footer " style=" height:50px; background-color:#000000; margin-top:30px" >
 <br>
 <center>
 <span>&copy; 2016 </span>
 </center>
 </div>
</body>
</html>