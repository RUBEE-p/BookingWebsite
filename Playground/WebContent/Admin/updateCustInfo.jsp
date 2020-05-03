<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!Doctype html>

<html>
<head>
<title>Update Customer Information</title>
<link rel="stylesheet" type="text/css" href="../css/EditCustInfo.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

	<%
		try {

		//Create connection to MySql Database
		String url = "jdbc:mysql://127.0.0.1:3307/cs336Project";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "root", "");
		Statement stmt = con.createStatement();

		String updateId = request.getParameter("updateID");
		String retrieveItems = "SELECT * FROM Customer WHERE acctNumber = " + updateId + ";";
		ResultSet results = stmt.executeQuery(retrieveItems);
	
		
		results.next();
		
		
		String last = results.getString("LastName");
		String first = results.getString("FirstName");
		String address = results.getString("Address");
		String city = results.getString("City");
		String state = results.getString("State");
		String zip = results.getString("Zip_Code");
		String tel = results.getString("Telephone");
		String email = results.getString("Email");
		String accountNumber = results.getString("acctNumber");
		String date = results.getString("Account_Date");
		String creditcard = results.getString("CreditCard");
		String pref = results.getString("Preferences");
			
		System.out.println("adsf");
		System.out.println(last);
	%>



	<div class="inputForm">
		<form action="Admin.jsp" method="POST" id="custInfoForm">
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="fname">First name:</label><br> <input class="form-control" type="text" id="fname" name="fnameUpdate" value=<%=first%>>
				</div>

				<div class="form-group col-md-3">
					<label for="lname">Last name:</label> <input  
					class="form-control" type="text" id="lname" name="lnameUpdate" value=<%=last%>>
				</div>

				<div class="form-group col-md-4">
					<label for="acctN">Acct #:</label> <input class="form-control"
						type="text" id="acctN" name="acctNUpdate" required value=<%=accountNumber%>>
				</div>
				<div class="form-group col-md-2">
					<label for="date">Acct. Creation Date:</label> <input 
						class="form-control" type="text" id="date" name="dateUpdate" value=<%=date%>>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label for="address">Address:</label> <input class="form-control"
					type="text" id="address" name="addressUpdate" value=<%=address%>>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="city">City:</label> <input class="form-control"
						type="text" id="city" name="cityUpdate" value=<%=city%>>
				</div>
				<div class="form-group col-md-4">
					<label for="state">State:</label> <input class="form-control"
						type="text" id="state" name="stateUpdate" value=<%=state%> >
				</div>
				<div class="form-group col-md-2">
					<label for="zip">Zip Code:</label> <input class="form-control"
						type="text" id="zip" name="zipUpdate" value=<%=zip%>>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="tel">Tele:</label> <input  class="form-control"
						type="text" id="tel" name="telUpdate" value=<%=tel%>>
				</div>
				<div class="form-group col-md-6">
					<label for="email">Email:</label> <input class="form-control"
						type="text" id="email" name="emailUpdate" required value=<%=email%>>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="creditcard">Credit Card:</label> <input 
						class="form-control" type="text" id="creditcard" name="creditcardUpdate"
						required value=<%=creditcard%>>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="pref">Pref:</label> <input  class="form-control"
						type="text" id="pref" name="prefUpdate" value=<%=pref%>>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-2">
					<button class="btn btn-primary" id="check">Save</button>
				</div>
				
				<div class="form-group col-md-1">
					<a href="Admin.jsp">Cancel</a>
				</div>
			</div>

		</form>
	</div>

	<%
		//Close Connection
	con.close();
	} catch (Exception e) {

		e.printStackTrace();
		out.print("Failed To Connect");

	}
	%>


</body>
</html>