<!DOCTYPE html>
<html lang="en">
<head>
  <title>PointSport</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">PointSport</a>
    </div>
    <ul class="nav navbar-nav">
      <li> <a href ="${pageContext.request.contextPath}/index">Home</a></li>
     <li><a href="${pageContext.request.contextPath}/contactus">ContactUs</a></li>
      <li><a href="${pageContext.request.contextPath}/aboutus">AboutUs</a></li>
       <li><a href="${pageContext.request.contextPath}/category">Categories</a></li>
       <li><a href="${pageContext.request.contextPath}/product">Products</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <li ><a href="${pageContext.request.contextPath}/signup">Sign Up</a></li>
      <li ><a href="${pageContext.request.contextPath}/login">Login</a></li>
      
      
    </ul>
  </div>
</nav>
  

</body>
</html>

