<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Flights Page</title>
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
		<a href = "CustInfo.jsp">Customer Information</a>
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
				Flights Report
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

			String flightList = "Select line.Airline_Name, f.Flight_No, dept.Airport_Name, arrive.Airport_Name, r.Dept_Time, r.Arrival_Time, f.Seat_Total, f.Working_Days From Flight f Join Route r Using(Flight_No, AirLine_ID) Join Airport arrive on arrive.Airport_ID=r.Arrive_Airport_ID Join Airport dept on dept.Airport_ID=r.Dept_Airport_ID Join Airline line using(AirLine_ID);";
			ResultSet results = stmt.executeQuery(flightList);
		%>


		<table class="table" style="width: 100%" id="custInfoTable">
			<tr>
				<th>Airline Name</th>
				<th>Flight No.</th>
				<th>Dept. From</th>
				<th>Arrive To</th>
				<th>Dept.Time</th>
				<th>Arrive Time</th>
				<th>Seat Total</th>
				<th>Days</th>


			</tr>
			<tbody>

				<%
					while (results.next()) {
				%>

				<tr>
					<td><%=results.getString("Airline_Name")%></td>
					<td><%=results.getString("Flight_No")%></td>
					<td><%=results.getString("Airport_Name")%></td>
					<td><%=results.getString("Airport_Name")%></td>
					<td><%=results.getString("Dept_Time")%></td>
					<td><%=results.getString("Arrival_Time")%></td>
					<td><%=results.getString("Seat_Total")%></td>
					<td><%=results.getString("Working_Days")%></td>


				</tr>


				<%
					}
				%>



			</tbody>
		</table>





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