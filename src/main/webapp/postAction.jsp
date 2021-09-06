<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="forum.ForumDAO"%>	<!-- use ForumDAO class -->

<%@ page import="java.io.PrintWriter"%>	<!-- java io class -->

<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8");

%>

<!-- use java beans to recieve user info / scope : use only in this page -->

<jsp:useBean id="forum" class="forum.Forum" scope="page" />

<jsp:setProperty name="forum" property="forumTitle" />

<jsp:setProperty name="forum" property="forumContent" />

<%

	System.out.println(forum);

%>

<!DOCTYPE html>

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>Test Forum</title>

</head>

<body>

	<%

		String userEmail = null;

		if (session.getAttribute("userEmail") != null) {

			userEmail = (String) session.getAttribute("userEmail");

		}

		if (userEmail == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Login required')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

		} 
		
		else {

			if (forum.getForumTitle() == null || forum.getForumContent() == null) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('Please fill all essential forms')");

				script.println("history.back()");

				script.println("</script>");

			} 
			
			else {

				ForumDAO ForumDAO = new ForumDAO();

				int result = ForumDAO.write(forum.getForumTitle(), userEmail, forum.getForumContent());

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('Fail to post')");

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