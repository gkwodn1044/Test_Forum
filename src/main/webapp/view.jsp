<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="forum.Forum"%>

<%@ page import="forum.ForumDAO"%>

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

		int forumID = 0;

		if (request.getParameter("forumID") != null) {

			forumID = Integer.parseInt(request.getParameter("forumID"));

		}

		if (forumID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Invalid post')");

			script.println("location.href = 'forum.jsp'");

			script.println("</script>");

		}

		Forum forum = new ForumDAO().getForum(forumID);

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

	<!-- view -->

	<div class="container">

		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">

			<thead>

				<tr>

					<th colspan="3" style="background-color: #eeeeee; text-align: center;">View</th>

				</tr>

			</thead>

			<tbody>

				<tr>

					<td style="width: 20%;">Title</td>

					<td colspan="2"><%= forum.getForumTitle() %></td>

				</tr>

				<tr>

					<td>Author</td>	

					<td colspan="2"><%= forum.getUserName() %></td>

				</tr>

				<tr>

					<td>Date</td>	

					<td colspan="2"><%= forum.getForumDate().substring(0, 11) + forum.getForumDate().substring(11, 13) + ":" + forum.getForumDate().substring(14, 16)%></td>

				</tr>

				<tr>

					<td>Content</td>	

					<td colspan="2" style="min-height: 200px;"><%= forum.getForumContent() %></td>

				</tr>
				
			</tbody>

		</table>	

		<a href = "forum.jsp" class="btn btn-primary">List</a>

		<%

			// if user is author of the post, user can edit/delete post

			if(userEmail != null && userEmail.equals(forum.getUserName())){

		%>

			<a href="edit.jsp?forumID=<%= forumID %>" class="btn btn-primary">edit</a>

			<a onclick="return confirm('Are you sure to delete?')" href="deleteAction.jsp?forumID=<%= forumID %>" class="btn btn-primary	">delete</a>

		<%					

			}

		%>

	</div>

	<!-- Bootstrap jQuery/JS  -->
 
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>