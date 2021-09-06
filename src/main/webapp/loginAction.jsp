<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %>	<!-- use UserDAO class -->

<%@ page import="java.io.PrintWriter" %>	<!-- java io class -->

<% request.setCharacterEncoding("UTF-8"); %>

<!-- use java beans to recieve user info / scope : use only in this page -->

<jsp:useBean id="user" class="user.User" scope="page" />

<jsp:setProperty name="user" property="userEmail" />

<jsp:setProperty name="user" property="userPassword" /> 

<!DOCTYPE html>

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>Test_Forum</title>

</head>

<body>

	<%
	
		// logged in members cannot acces this page

		String userEmail = null;

		if(session.getAttribute("userEmail") != null ){

			userEmail = (String) session.getAttribute("userEmail");

		}

		if(userEmail != null){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('You are already logged in')");

			script.println("location.href = 'main.jsp'");

			script.println("</script>");	

		}

		UserDAO userDAO = new UserDAO(); // create instance

		int result = userDAO.login(user.getUserEmail(), user.getUserPassword());

		// login success

		if(result == 1){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href = 'main.jsp'");
			
			session.setAttribute("userEmail", user.getUserEmail());

			script.println("</script>");

		}

		// login fail

		else if(result == 0){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Wrong Password')");

			script.println("history.back()");

			script.println("</script>");

		}

		// no email in DB

		else if(result == -1){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('Non-existent Email address')");

		script.println("history.back()");

		script.println("</script>");

		}

		// DB error

		else if(result == -2){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('DB error occurred')");

		script.println("history.back()");

		script.println("</script>");

		}		

	%>

</body>

</body>

</html>