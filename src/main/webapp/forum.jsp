<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="forum.ForumDAO"%>

<%@ page import="forum.Forum"%>

<%@ page import="java.util.ArrayList"%>

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
		
		int pageNumber = 1;	// default page number
		
		// if page number already exists
		
		if (request.getParameter("pageNumber") != null) {
			
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			
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

	<!-- forum -->

	<div class="container">

		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd"> 

			<thead>

				<tr>

					<th style="background-color: #eeeeee; text-align: center;">#</th>

					<th style="background-color: #eeeeee; text-align: center;">Title</th>

					<th style="background-color: #eeeeee; text-align: center;">Author</th>

					<th style="background-color: #eeeeee; text-align: center;">Date</th>

				</tr>

			</thead>

			<tbody>
			
				<%
				
					ForumDAO forumDAO = new ForumDAO();
				
					ArrayList<Forum> list = forumDAO.getList(pageNumber);
					
					for (int i = 0; i < list.size(); i++) {
				
				%>

				<tr>

					<td><%=list.get(i).getForumID()%></td>

					<td><a href="view.jsp?forumID=<%=list.get(i).getForumID()%>"><%=list.get(i).getForumTitle()%></a></td>

					<td><%=list.get(i).getUserName()%></td>
					
					<td><%=list.get(i).getForumUpdate().substring(0, 11) + list.get(i).getForumUpdate().substring(11, 13) + ":" + list.get(i).getForumUpdate().substring(14, 16)%></td>

				</tr>
				
				<%
				
					}
				
				%>

			</tbody>

		</table>
		
		<!-- move page -->
		
		<%
		
			if (pageNumber > 1) {
		
		%>
		
			<a href="forum.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">previous</a>
			
		<%
		
			}
		
		%>
		
		<%
		
			if (forumDAO.nextPage(pageNumber)) {
		
		%>
		
			<a href="forum.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-right">next</a>
			
		<%
		
			}
			
		%>
		
		<%

			if (userEmail != null) {

		%>

			<a href = "post.jsp" class="btn btn-primary float-right">Post</a>
			
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