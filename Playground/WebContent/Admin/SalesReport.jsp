<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Sales Report Page</title>
<link href="css/AdminSalesReport.css" rel="stylesheet" type="text/css">
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
				Sales Report
				</hr>
			</h1>
		</div>


		<%
			try {

			//Create connection to MySql Database
			String url = "jdbc:mysql://127.0.0.1:3307/cs336Project";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "");
			Statement stmt = con.createStatement();

			//String totalSales = "SELECT * FROM Reservation";

			//Parameter From Form
			String month = "Choose One";

			String monthlySales = "SELECT * FROM Reservation WHERE substring(ReservationDate, 1, 2) = "
			+ request.getParameter("month") + ";";
			ResultSet results = stmt.executeQuery(monthlySales);

			if (request.getParameter("month") != null) {
				switch (Integer.parseInt(request.getParameter("month"))) {

			case 01 :
				month = "January";
				break;
			case 02 :
				month = "February";
				break;
			case 03 :
				month = "March";
				break;
			case 04 :
				month = "April";
				break;
			case 05 :
				month = "May";
				break;
			case 06 :
				month = "June";
				break;
			case 07 :
				month = "July";
				break;
			case 8 :
				month = "August";
				break;
			case 9 :
				month = "September";
				break;
			case 10 :
				month = "October";
				break;
			case 11 :
				month = "November";
				break;
			case 12 :
				month = "December";
				break;
				}
			}
		%>

		<div class="dropDownSelect" style="width: 200px; margin-top: 100px;">
			<form action="SalesReport.jsp" id="monthForm">
				<select class="form-control" name="month"
					onchange="$('#monthForm').submit();">
					<option value="" disabled selected><%=month%></option>
					<option value="01">January</option>
					<option value="02">February</option>
					<option value="03">March</option>
					<option value="04">April</option>
					<option value="05">May</option>
					<option value="06">June</option>
					<option value="07">July</option>
					<option value="08">August</option>
					<option value="09">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select>
			</form>
		</div>




		<table class="table" style="width: 100%" id="custInfoTable">
			<tr>
				<th>Reservation Number</th>
				<th>Booking Fee</th>
				<th>Total Fare</th>
				<th>Reservation Date</th>
				<th>Passenger(s)</th>
				<th>Fare_Restriction</th>
				<th>CustRep</th>
				<th>Account Number</th>
				<th>Flight Number</th>
				<th>Airline ID</th>
				<th>Departing Airport ID</th>
				<th>Arriving Airport ID</th>
			</tr>
			<tbody>

				<%
					while (results.next()) {
				%>

				<tr>
					<td><%=results.getString("Reservation_No")%></td>
					<td><%=results.getString("BookingFee")%></td>
					<td><%=results.getString("TotalFare")%></td>
					<td><%=results.getString("ReservationDate")%></td>
					<td><%=results.getString("Passengers")%></td>
					<td><%=results.getString("FareRestriction")%></td>
					<td><%=results.getString("CustRep")%></td>
					<td><%=results.getString("acctNumber")%></td>
					<td><%=results.getString("Flight_No")%></td>
					<td><%=results.getString("AirLine_ID")%></td>
					<td><%=results.getString("Dept_Airport_ID")%></td>
					<td><%=results.getString("Arrive_Airport_ID")%></td>

				</tr>


				<%
					}

				results.close();
				String monthlyRevenue = "SELECT SUM(BookingFee) FROM Reservation WHERE substring(ReservationDate, 1, 2) = "
						+ request.getParameter("month") + ";";
				ResultSet total = stmt.executeQuery(monthlyRevenue);
				total.next();
				
				String revenue = "";
				
				if(total.getObject(1) != null){
				
					revenue = total.getString(1);
				}
				
				
				%>



			</tbody>
		</table>


		<h2>
			Total Revenue:
			<%= revenue%>
		</h2>



		<%
			con.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		%>
	</div>
	<script>
		function openNav() {
			document.getElementById("sidebar").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
		}

		function closeNav() {
			document.getElementById("sidebar").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
		}

		$(document).ready(function() {
			$('.mdb-select').materialSelect();
		});
	</script>



</body>