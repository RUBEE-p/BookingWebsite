<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Revenue Page</title>
<link href="css/AdminRevenue.css" rel="stylesheet" type="text/css">
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
		<a href="Admin.jsp">Customer Information</a> <a href="SalesReport.jsp">Sales
			Report</a> <a href="Reservations.jsp">Reservations</a> <a
			href="Revenue.jsp">Revenue</a> <a href="Flights.jsp">Flights</a>
	</div>

	<div id="main">
		<button id="openbtn" onclick="openNav()"
			class="btn glyphicon glyphicon-menu-hamburger"></button>
		<div class="titleBar">
			<h1 id="title">
				Revenue
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

			String flightList = "Select Airline_Name, Flight_No From Airline natural join Flight order by Airline_Name";
			ResultSet flightResults = stmt.executeQuery(flightList);
		%>

		<div class="dropDownSelect"
			style="width: 200px; margin-top: 100px; margin-bottom: 50px; margin-right: 50px; float: left;">

			<%
				String flightForm;
			if (request.getParameter("flightForm") != null) {
				flightForm = request.getParameter("flightForm");

			} else {

				flightForm = "";
			}

			while (flightResults.next()) {

				String flight = flightResults.getString("Airline_Name") + ":" + flightResults.getString("Flight_No");
			%>

			<form action=Revenue.jsp id="flightForm">
				<select class="form-control" name="flightForm"
					onchange="$('#flightForm').submit();">
					<option value="" disabled selected><%=flightForm%></option>
					<option value=<%=flight%>><%=flight%></option>

				</select>
			</form>



			<%
				}
			flightResults.close();
			%>
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

			<%
				String Airline = "";
			String FlightNo = "";
			if (flightForm.length() > 0) {

				Airline = flightForm.substring(0, flightForm.indexOf(":"));
				FlightNo = flightForm.substring(flightForm.indexOf(":") + 1, flightForm.length());

			}

			String flightRevenueQ = "Select * from Reservation natural join Airline Where Airline_Name = '" + Airline
					+ "' and Flight_No = '" + FlightNo + "';";
			ResultSet flightRevResults = stmt.executeQuery(flightRevenueQ);
			%>
			<tbody>


				<%
					while (flightRevResults.next()) {
				%>

				<tr>
					<td><%=flightRevResults.getString("Reservation_No")%></td>
					<td><%=flightRevResults.getString("BookingFee")%></td>
					<td><%=flightRevResults.getString("TotalFare")%></td>
					<td><%=flightRevResults.getString("ReservationDate")%></td>
					<td><%=flightRevResults.getString("Passengers")%></td>
					<td><%=flightRevResults.getString("FareRestriction")%></td>
					<td><%=flightRevResults.getString("CustRep")%></td>
					<td><%=flightRevResults.getString("acctNumber")%></td>
					<td><%=flightRevResults.getString("Flight_No")%></td>
					<td><%=flightRevResults.getString("AirLine_ID")%></td>
					<td><%=flightRevResults.getString("Dept_Airport_ID")%></td>
					<td><%=flightRevResults.getString("Arrive_Airport_ID")%></td>

				</tr>


				<%
					}

				flightRevResults.close();
				String flightRevenue = "SELECT SUM(BookingFee) from Reservation natural join Airline Where Airline_Name = '" + Airline
						+ "' and Flight_No = '" + FlightNo + "';";
				ResultSet total = stmt.executeQuery(flightRevenue);
				total.next();

				String revenue = "";

				if (total.getObject(1) != null) {

					revenue = total.getString(1);
				}
				%>

			</tbody>
		</table>

		<h3>
			Total Revenue:<%=revenue%></h3>



		<div class="dropDownSelect"
			style="width: 200px; margin-top: 100px; margin-bottom: 50px;">

			<%
			total.close();
				String cityForm;
			if (request.getParameter("cityForm") != null) {
				cityForm = request.getParameter("cityForm");

			} else {

				cityForm = "";
			}

			String cityList = "Select City From Airport order by city";
			ResultSet cityResults = stmt.executeQuery(cityList);
			%>

			<form action=Revenue.jsp id="cityForm">
				<select class="form-control" name="cityForm"
					onchange="$('#cityForm').submit();">
					<%
						while (cityResults.next()) {
					%>


					<option value="" disabled selected><%=cityForm%></option>
					<option value=<%=cityResults.getString("city")%>><%=cityResults.getString("city")%></option>



					<%
						}
					%>

				</select>
			</form>
		</div>

		<table class="table" style="width: 100%" id="custInfoTable">
			<tr>
				<th>Reservation Number</th>
				<th>Passenger(s)</th>
				<th>Legs</th>
				<th>Total Fare</th>
				<th>Fare Restrictions</th>
				<th>Booking Fee</th>
				<th>Customer Rep.</th>
			</tr>

			<%
			cityResults.close();
			System.out.println(cityForm);
			String cityResultsQ = "Select * from Reservation natural join Airport Where City = '" + cityForm + "';";
			ResultSet cityRevResults = stmt.executeQuery(cityResultsQ);
			
			%>
			<tbody>

				<%
					while (cityRevResults.next()) {
				%>

				<tr>
					<td><%=cityRevResults.getString("Reservation_No")%></td>
					<td><%=cityRevResults.getString("BookingFee")%></td>
					<td><%=cityRevResults.getString("TotalFare")%></td>
					<td><%=cityRevResults.getString("ReservationDate")%></td>
					<td><%=cityRevResults.getString("Passengers")%></td>
					<td><%=cityRevResults.getString("FareRestriction")%></td>
					<td><%=cityRevResults.getString("CustRep")%></td>
					<td><%=cityRevResults.getString("acctNumber")%></td>
					<td><%=cityRevResults.getString("Flight_No")%></td>
					<td><%=cityRevResults.getString("AirLine_ID")%></td>
					<td><%=cityRevResults.getString("Dept_Airport_ID")%></td>
					<td><%=cityRevResults.getString("Arrive_Airport_ID")%></td>

				</tr>


				<%
					}

				cityRevResults.close();
				String cityRevenueQ = "SELECT SUM(BookingFee) from Reservation natural join Airport Where City = '" + cityForm + "';";
				ResultSet citytotal = stmt.executeQuery(cityRevenueQ);
				citytotal.next();

				String cityRevenue = "";

				if (citytotal.getObject(1) != null) {

					cityRevenue = citytotal.getString(1);
				}
				%>
			</tbody>
		</table>

		<h3>
			Total Revenue:<%=cityRevenue%></h3>

		<%
		citytotal.close();
			//Close Connection
		con.close();
		} catch (Exception e) {

			e.printStackTrace();
			out.print("Failed To Connect");

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