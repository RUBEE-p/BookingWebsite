<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, Users.User, Users.CurrentUser"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/login.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			//root@:3306
			//Create a connection string

			String url = "jdbc:mysql://localhost:3306/project_local?serverTimezone=EST5EDT";
			//String url = "jdbc:mysql://127.0.0.1:3306/?user=root";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "malistair");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the HelloWorld.jsp

			//Get parameters from the HTML form at the login.jsp
			String newEmail = request.getParameter("ru_email");
			String newPswd = request.getParameter("password");

			//if it is an admin
			if ((newEmail.equals("admin")) && (newPswd.equals("admin"))) {
				session.setAttribute("user_name", "admin");
	%><script>
								window.location.href = "admin-syssup/admin.jsp";
							</script>
	<%
		return;
			}

			if ((newEmail.equals("")) && (newPswd.equals(""))) {
	%>
	<script>
		alert("Please enter your email and password");
		window.location.href = "login.jsp";
	</script>
	<%
		} else {
				String str = "SELECT * FROM Login e WHERE e.username='" + newEmail + "' AND e.password='" + newPswd
						+ "'";

				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);

				if (result.next()) {

					System.out.println(str);

					/* session.setAttribute("user_name", result.getString("user_name"));
					session.setAttribute("user_email", newEmail);
					
					System.out.println(str); */
					User u = new User(result.getString("username"), result.getString("password"),
							result.getString("acctNumber"));
					CurrentUser cu = new CurrentUser(u);
					System.out.println(CurrentUser.getCurrentUser());
	%>
	<script>
		//alert("login success!");
		window.location.href = "main.jsp";
	</script>
	<%
		//close the connection.
				} else {
					out.print("User not found");
	%>
	<script>
		alert("User not found, or you entered a wrong password.");
		window.location.href = "login.jsp";
	</script>
	<%
		}
			}
			con.close();

		} catch (Exception e) {
			out.print("failed");
			out.println(e);
	%>
	<script>
		alert("Sorry, unexcepted error happens.");
		window.location.href = "login.jsp";
	</script>
	<%
		}
	%>

</body>
</html>