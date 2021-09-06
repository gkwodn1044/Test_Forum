<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

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

	<%

		// if session has userEmail value, then store it into userEmail. if not, set as null

		String userEmail = null;

		if (session.getAttribute("userEmail") != null) {

			userEmail = (String) session.getAttribute("userEmail");

		}

	%>

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
     
     					<%
     
     						if(userEmail == null){
     
     					%>
     
      						<a class="dropdown-item" href="login.jsp">Login</a>
      
      						<a class="dropdown-item" href="join.jsp">Join</a>
      
     					<%
     
     						}
     					
     						else{
     
     					%>
     
      						<a class="dropdown-item" href="logoutAction.jsp">Logout</a>
      
     					<%
     
     						}
     
     					%>
     
     				</div>
    
    			</li>
    
   			</ul>

  		</div> 

	</nav>

	<!-- Write -->

	<div class="container">

		<form action="postAction.jsp" method="post">

			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">

				<thead>

					<tr>

						<th colspan="2" style="background-color: #eeeeee; text-align: center;">Create Post</th>

					</tr>

				</thead>

				<tbody>

					<tr>

						<td><input type="text" class="form-control" placeholder="Title" name="forumTitle" maxlength="50"/></td>

					</tr>

					<tr>

						<td><textarea class="form-control" placeholder="Content" name="forumContent" maxlength="2048" style="height: 350px;"></textarea></td>

					</tr>

				</tbody>

			</table>	

			<input type="submit" class="btn btn-primary float-right" value="Submit"/>

		</form>

	</div>

	<!-- Bootstrap jQuery/JS  -->
 
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>