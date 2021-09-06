<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="forum.Forum"%>

<%@ page import="forum.ForumDAO"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");

%>

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
		
		if(userEmail == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Login required')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");
			
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
		
		if (!userEmail.equals(forum.getUserName())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Permission denied')");

			script.println("location.href = 'forum.jsp'");

			script.println("</script>");				

		}
		
		else {
			
			if (request.getParameter("forumTitle") == null || request.getParameter("forumContent") == null || request.getParameter("forumTitle").equals("") || request.getParameter("forumContent").equals("")) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('Please fill all essential forms')");

				script.println("history.back()");

				script.println("</script>");

			} 
			
			else {

				ForumDAO forumDAO = new ForumDAO();

				int result = forumDAO.edit(forumID, request.getParameter("forumTitle"), request.getParameter("forumContent"));

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('Failed to edit')");

					script.println("history.back()");

					script.println("</script>");

				} 
				
				else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("location.href='forum.jsp'");

					script.println("</script>");

				}

			}
			
		}

	%>

</body>

</html>