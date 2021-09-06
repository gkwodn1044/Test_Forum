<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %> <!-- use UserDAO class -->

<%@ page import="java.io.PrintWriter" %> <!-- java io class -->

<%@ page import="java.util.regex.Pattern" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- use java beans to recieve user info / scope : use only in this page -->

<jsp:useBean id="user" class="user.User" scope="page" />

<jsp:setProperty name="user" property="userEmail" />

<jsp:setProperty name="user" property="userPassword" /> 

<jsp:setProperty name="user" property="userName" />

<jsp:setProperty name="user" property="userGender" />

<!DOCTYPE html>

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>Test Forum</title>

</head>

<body>

	<%
	
		// logged in members cannot acces this page

		String userEmail = null;
	
		String pwPattern = "^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{8,20}$";
		
		boolean matcher = Pattern.compile(pwPattern).matcher(user.getUserPassword()).matches();

		if(session.getAttribute("userEmail") != null ) {

			userEmail = (String) session.getAttribute("userEmail");

		}

		if(userEmail != null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('You are already logged in')");

			script.println("location.href = 'main.jsp'");

			script.println("</script>");	

		}
		
		else {
		
			if (user.getUserEmail() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('Please fill all essential forms')");

				script.println("history.back()");

				script.println("</script>");

			}
			
			if (user.getUserPassword().contains(" ")) {
				
				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('Password cannot contains space character')");

				script.println("history.back()");

				script.println("</script>");
				
			}
			
			if (!matcher) {
				
				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('Password must include more than 1 number, 1 uppercase and 1 special character(~,!,@,etc) (8 to 20 digits)')");

				script.println("history.back()");

				script.println("</script>");

			}
			
			else {
				
				UserDAO userDAO = new UserDAO();	// create instance

				int result = userDAO.join(user);				

				if(result == -1) {	// if email already exists in DB

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('Email already exists')");

					script.println("history.back()");

					script.println("</script>");

				}
				
				else {	// join success

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("location.href = 'main.jsp'");

					script.println("</script>");
					
				}
				
			}
			
		}
	%>
	
</body>

</body>

</html>