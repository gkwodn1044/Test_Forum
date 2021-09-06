<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>Test Forum</title>

</head>

<body>

	<%

		session.invalidate();	// make session invalid

	%>

	<script>	//메인으로 이동

		location.href = 'main.jsp';

	</script>

</body>

</body>

</html>