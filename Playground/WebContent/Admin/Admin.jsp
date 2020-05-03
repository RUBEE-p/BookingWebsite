<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!Doctype html>
<html>

<head>
<title>Admin Page</title>
<link rel="stylesheet" type="text/css" href="../css/EditCustInfo.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

	<div id="sidebar" class="sidenav">
		<button id="closeBtn" class="btn glyphicon glyphicon-remove"
			onclick="closeNav()"></button>
		<h3 style="color: white; padding: 6px 8px 6px 16px;">Welcome
			Admin</h3>
		<a href = "Admin.jsp">Customer Information</a>
    <a href = "SalesReport.jsp">Sales Report</a>
    <a href = "Reservations.jsp">Reservations</a>
    <a href = "Revenue.jsp">Revenue</a>
    <a href = "Flights.jsp">Flights</a>
	</div>

	<div id="main">

		<button id="openbtn" onclick="openNav()"
			class="btn glyphicon glyphicon-menu-hamburger"></button>
		<div class="titleBar">
			<h1 id="title">
				Customer Information
				
			</h1>
		</div>

		<div class="inputForm">
			<form action="Admin.jsp" method="POST" id="custInfoForm">
				<div class="form-row">
					<div class="form-group col-md-3">
						<label for="fname">First name:</label><br> <input
							class="form-control" type="text" id="fname" name="fname">
					</div>

					<div class="form-group col-md-3">
						<label for="lname">Last name:</label> <input class="form-control"
							type="text" id="lname" name="lname">
					</div>

					<div class="form-group col-md-4">
						<label for="acctN">Acct #:</label> <input class="form-control"
							type="text" id="acctN" name="acctN" required>
					</div>
					<div class="form-group col-md-2">
						<label for="date">Acct. Creation Date:</label> <input
							class="form-control" type="text" id="date" name="date">
					</div>
				</div>
				<div class="form-group col-md-12">
					<label for="address">Address:</label> <input class="form-control"
						type="text" id="address" name="address">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="city">City:</label> <input class="form-control"
							type="text" id="city" name="city">
					</div>
					<div class="form-group col-md-4">
						<label for="state">State:</label> <input class="form-control"
							type="text" id="state" name="state">
					</div>
					<div class="form-group col-md-2">
						<label for="zip">Zip Code:</label> <input class="form-control"
							type="text" id="zip" name="zip">
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="tel">Tele:</label> <input class="form-control"
							type="text" id="tel" name="tel">
					</div>
					<div class="form-group col-md-6">
						<label for="email">Email:</label> <input class="form-control"
							type="text" id="email" name="email" required>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="creditcard">Credit Card:</label> <input
							class="form-control" type="text" id="creditcard"
							name="creditcard" required>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="pref">Pref:</label> <input class="form-control"
							type="text" id="pref" name="pref">
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-2">
						<button class="btn btn-primary" id="check">Add</button>
					</div>
					
				</div>

			</form>
		</div>

	

		<%
			try {

			//Create connection to MySql Database
			String url = "jdbc:mysql://127.0.0.1:3307/cs336Project";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "");
			Statement stmt = con.createStatement();

			//Parameters from Added Customer
			String last = request.getParameter("lname");
			String first = request.getParameter("fname");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String accountNumber = request.getParameter("acctN");
			String date = request.getParameter("date");
			String creditcard = request.getParameter("creditcard");
			String pref = request.getParameter("pref");
			String id = request.getParameter("id");

			String getAllCustomers = "Select * from Customer";

			//Read from input form and insert into database
			if ((accountNumber != null && creditcard != null && email != null)
			&& (accountNumber.length() > 0 && creditcard.length() > 0 && email.length() > 0)) {
					String insert = "INSERT INTO Customer (LastName, FirstName,Address,City ,State,Zip_Code,Telephone,Email,acctNumber,Account_Date,CreditCard,Preferences) VALUES ('"
					+ first + "','" + last + "','" + address + "','" + city + "','" + state + "','" + zip + "','" + tel
					+ "','" + email + "','" + accountNumber + "','" + date + "','" + creditcard + "','" + pref + "');";
	
					ResultSet results = stmt.executeQuery(getAllCustomers);
					Boolean containsDuplicate = false;
					
					//Prevents Duplicate Entries
					while (results.next()) {
	
						System.out.println(results.getString("acctNumber") + " " + accountNumber);
						if (results.getString("acctNumber").equals(accountNumber)) {
							
								containsDuplicate = true;
								break;
						}
	
					}
					
					
					
					if (!containsDuplicate) {
	
						stmt.execute(insert);
						
					} else {
						
						%>
						<script>Alert("Can not have duplicate Account Numbers"); Console.log("Duplicated");</script>
						<%
					}

			}
			
			
			String lastUpdate = request.getParameter("lnameUpdate");
			String firstUpdate = request.getParameter("fnameUpdate");
			String addressUpdate = request.getParameter("addressUpdate");
			String cityUpdate = request.getParameter("cityUpdate");
			String stateUpdate = request.getParameter("stateUpdate");
			String zipUpdate = request.getParameter("zipUpdate");
			String telUpdate = request.getParameter("telUpdate");
			String emailUpdate = request.getParameter("emailUpdate");
			String accountNumberUpdate = request.getParameter("acctNUpdate");
			String dateUpdate = request.getParameter("dateUpdate");
			String creditcardUpdate = request.getParameter("creditcardUpdate");
			String prefUpdate = request.getParameter("prefUpdate");
			System.out.println(lastUpdate);
			//Check if update occurred and update cooresponding row in db
			if ((accountNumberUpdate != null && creditcardUpdate != null && emailUpdate != null)
				&& (accountNumberUpdate.length() > 0 && creditcardUpdate.length() > 0 && emailUpdate.length() > 0)) {
				System.out.println("Updating");
				String updateQuery = "Update Customer Set FirstName = '"
						+ firstUpdate + "', LastName = '" + lastUpdate + "', Address = '" + addressUpdate + "',City = '" + cityUpdate + "',State = '" + stateUpdate + "', Zip_Code = '" + zipUpdate + "', Telephone = '" + telUpdate
						+ "',Email = '" + emailUpdate + "', acctNumber = '" + accountNumberUpdate + "', Account_Date = '" + dateUpdate + "', CreditCard = '" + creditcardUpdate + "',Preferences = '" + prefUpdate + "' Where acctNumber = " + accountNumberUpdate + ";";
				stmt.executeUpdate(updateQuery);
			}
			
			
			//Check if item was deleted from table and delete from database
			if(id != null){
				
				String delete = "DELETE FROM Customer WHERE acctNumber = " + id + ";";
				stmt.execute(delete);
				System.out.println("Deleted");
				
			}

		//Fetch All Customer Information
		ResultSet results = stmt.executeQuery(getAllCustomers);
		%>
		<table class="table" style="width: 100%" id="custInfoTable">

			<tr>

				<th width="7%">First Name</th>
				<th width="7%">Last Name</th>
				<th>Address</th>
				<th width="5%">City</th>
				<th width="4%">State</th>
				<th width="5%">Zip Code</th>
				<th width="7%">Telephone</th>
				<th>Email Address</th>
				<th>Acct. Number</th>
				<th>Acct. Creation Date</th>
				<th>Credit Card</th>
				<th width="5%">Pref.</th>
				<th width="4%">Delete</th>
				<th width="4%">Update</th>
			</tr>

			<tbody>
				<%
					while (results.next()) {
				%>

				<tr>
					<td><%=results.getString("LastName")%></td>
					<td><%=results.getString("FirstName")%></td>
					<td><%=results.getString("Address")%></td>
					<td><%=results.getString("City")%></td>
					<td><%=results.getString("State")%></td>
					<td><%=results.getString("Zip_Code")%></td>
					<td><%=results.getString("Telephone")%></td>
					<td><%=results.getString("Email")%></td>
					<td><%=results.getString("acctNumber")%></td>
					<td><%=results.getString("Account_Date")%></td>
					<td><%=results.getString("CreditCard")%></td>
					<td><%=results.getString("Preferences")%></td>
					<td><a href="Admin.jsp?id=<%=results.getString("acctNumber") %>"><button class='btn glyphicon glyphicon-trash' 
					onclick=deleteRow(this)></button></a></td>
					<td><a href="updateCustInfo.jsp?updateID=<%=results.getString("acctNumber") %>"><button class='btn glyphicon glyphicon-pencil' >
					</button></a></td>
				</tr>


				<%
					}
				%>

			</tbody>
		</table>
	</div>

	<script>
		function openNav() {

			document.getElementById("sidebar").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
		}

		function closeNav() {
			console.log("Working");
			document.getElementById("sidebar").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
		}

		function deleteRow(element) {
			
			console.log("trying to delete");
			document.getElementById("custInfoTable").deleteRow(
					element.closest('tr').rowIndex);
		}
			
		
	
	</script>
</body>




<%
	//Close Connection
con.close();
} catch (Exception e) {

	e.printStackTrace();
	out.print("Failed To Connect");

}
%>

</html>