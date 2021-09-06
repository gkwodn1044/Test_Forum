<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- viewport -->

	<meta name="viewport" content="width=device-width" initial-scale="1">

	<!-- Bootstrap CSS stylesheet -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 
	<style>
 
 		@media (min-width: 768px)
 		{
 			.container
 			{
 				width: 750px;
 			}
 		}
 
 		@media (min-width: 992px)
 		{
 			.container
 			{
 				width: 940px;
 			}
 		}
 
 	</style>

	<title>Test Forum</title>

</head>

<body>

	<!-- navigation bar  -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light">

  		<a class="navbar-brand" href="main.jsp">Test Forum</a>
  
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

  		<div class="collapse navbar-collapse" id="navbarSupportedContent">

   			<ul class="navbar-nav mr-auto">
    
    			<li class = "nav-item">
	
     				<a class="nav-link" href="forum.jsp">Forum</a>
     
    			</li>
    
   			</ul> 
   
   			<ul class="navbar-nav ml-auto">
    
    			<li class="nav-item dropdown">
    
     				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</a>
     
     				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
     
      					<a class="dropdown-item" href="login.jsp">Login</a>
      
      					<a class="dropdown-item" href="join.jsp">Join</a>
     
     				</div>
    
    			</li>
    
   			</ul>

  		</div> 

 	</nav>

	<!-- join form -->
 
	<div class="container">
 
  		<div class="jumbotron">
   
   			<form action="joinAction.jsp" method="post">
   
    			<h1 class="header" style="text-align: center">Join</h1>
    
    			<div class="form-group">
    
     				<label for="InputEmail">Email Address</label>
     
     				<input type="email" class="form-control" id="InputEmail" name="userEmail" placeholder="Enter email" maxlength="50">
     
    			</div>
    
    			<div class="form-group">
    
     				<label for="InputPassword">Password</label>
    
     				<input type="password" class="form-control" id="InputPassword" name="userPassword" aria-describedby="passwordHelp" placeholder="Enter password" maxlength="20">
    
     				<small id="passwordHelp" class="form-text text-muted">Password must include more than 1 number, 1 uppercase and 1 special character(~,!,@,etc) (8 to 20 digits)</small>
    
    			</div>
    
    			<div class="form-group">
    
     				<label for="InputName">Name</label>
     
     				<input type="name" class="form-control" id="InputName" name="userName" placeholder="Enter name" maxlength="20">
    
    			</div>
    
    			<div class="btn-group" data-toggle="buttons">
     
     				<label class="btn btn-default active">
     
     					<input type="radio" name="userGender" autocomplete="off" value="Male" checked>Male
      
     				</label>
      
     				<label class="btn btn-default">
      
     					<input type="radio" name="userGender" autocomplete="off" value="Female">Female
      
     				</label>
     
    			</div>
    
    			<button type="submit" class="btn btn-primary form-control">Submit</button>
   
   			</form>
 
 		</div>
 
	</div>

	<!-- Bootstrap jQuery/JS  -->
 
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>