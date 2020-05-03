<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Reservations Page</title>
<link href="../css/AdminReservations.css" rel="stylesheet" type="text/css">
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
				Reservations
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
			//String month = "Choose One";

			String FlightNumber = request.getParameter("FlightNumber");
			if(FlightNumber == null){
				FlightNumber = "";
			}
			String flightList = "Select r.Reservation_No, r.ReservationDate, r.Passengers, a.Airport_Name, b.Airport_Name, Dept_Time, Arrival_Time, r.Flight_No, Airline_Name, l.Dept_Date, l.Meal, l.Seat_No, l.Class, r.TotalFare, r.FareRestriction, r.BookingFee, r.CustRep	From Reservation r natural join Leg l natural join Airline natural join Route join Airport a on(a.Airport_ID=r.Dept_Airport_ID) join Airport b on(b.Airport_ID=r.Arrive_Airport_ID) Where r.Flight_No='"
			+ FlightNumber + "';";
			ResultSet results = stmt.executeQuery(flightList);
		%>


		<div class="md-form mt-0"
			style="width: 400px; margin-top: 100px; margin-bottom: 50px;">
			<form action="Reservations.jsp">
				<div class="form-inline">
					<div class="form-group">
						<input type="submit" class="btn btn-default"></input> <input
							class="form-control" type="text" placeholder="Flight Number"
							aria-label="Search" name="FlightNumber">

					</div>
				</div>
			</form>
		</div>
		
		<h2>
			Flight:
			<%=FlightNumber%></h2>
		<table class="table" style="width: 100%" id="custInfoTable">
			<tr>
				<th>Res. No.</th>
				<th>Res.Date</th>
				<th>Passenger(s)</th>
				<th>Dept. Airport</th>
				<th>Arrival Airport</th>
				<th>Dept. Time</th>
				<th>Arrival Time</th>
				<th>Flight No.</th>
				<th>Airline</th>
				<th>Dept. Date</th>
				<th>Meal</th>
				<th>Seat</th>
				<th>Class</th>
				<th>Total Fare</th>
				<th>Restrictions</th>
				<th>Booking Fee</th>
				<th>Cust. Rep.</th>
			</tr>


			<tbody>

				<%
					while (results.next()) {
				%>


				<tr>
					<td><%=results.getString("Reservation_No")%></td>
					<td><%=results.getString("ReservationDate")%></td>
					<td><%=results.getString("Passengers")%></td>
					<td><%=results.getString("Airport_Name")%></td>
					<td><%=results.getString("Airport_Name")%></td>
					<td><%=results.getString("Dept_Time")%></td>
					<td><%=results.getString("Arrival_Time")%></td>
					<td><%=results.getString("Flight_No")%></td>
					<td><%=results.getString("AirLine_Name")%></td>
					<td><%=results.getString("Dept_Date")%></td>
					<td><%=results.getString("Meal")%></td>
					<td><%=results.getString("Seat_No")%></td>
					<td><%=results.getString("Class")%></td>
					<td><%=results.getString("TotalFare")%></td>
					<td><%=results.getString("FareRestriction")%></td>
					<td><%=results.getString("BookingFee")%></td>
					<td><%=results.getString("CustRep")%></td>

				</tr>

				<%
					}

				String CustName = request.getParameter("CustName");
				String FirstName = "";
				String LastName = "";
			
				if(CustName != null){
					
					if(CustName.indexOf(" ") > 0){
						FirstName = CustName.substring(0, CustName.indexOf(" "));
						LastName = CustName.substring(CustName.indexOf(" ") + 1, CustName.length());
						System.out.println(FirstName + " " + LastName);
					} else {
						FirstName = CustName;
					}
				} else {
					
					CustName = "";
				}
				String custName = "Select FirstName, LastName, r.Reservation_No, r.ReservationDate, r.Passengers, a.Airport_Name, b.Airport_Name, Dept_Time, Arrival_Time, r.Flight_No, Airline_Name, l.Dept_Date, l.Meal, l.Seat_No, l.Class, r.TotalFare, r.FareRestriction, r.BookingFee, r.CustRep From Customer natural join Reservation r natural join Leg l natural join Airline natural join Route join Airport a on(a.Airport_ID=r.Dept_Airport_ID) join Airport b on(b.Airport_ID=r.Arrive_Airport_ID) Where (substring(LastName,1, " + FirstName.length() + ") = '" + FirstName + "') or (substring(LastName,1, " + LastName.length() + ") = '" + LastName + "' and substring(FirstName,1, " + FirstName.length() +") = '" + FirstName + "');";
				ResultSet name_results = stmt.executeQuery(custName);
				
				%>


			</tbody>
		</table>

		<div class="md-form mt-0"
			style="width: 400px; margin-top: 100px; margin-bottom: 50px;">
			<form action=Reservations.jsp>
				<div class="form-inline">
					<div class="form-group">
						<input type="submit" class="btn btn-default"></input> <input
							class="form-control" type="text" placeholder="Customer"
							aria-label="Search" name="CustName">

					</div>
				</div>
			</form>
		</div>	

		<h2>
			Customer:
			<%=CustName%></h2>
		<table class="table" style="width: 100%" id="custInfoTable">
			<tr>
				<th>Name</th>
				<th>Res. No.</th>
				<th>Res.Date</th>
				<th>Passenger(s)</th>
				<th>Dept. Airport</th>
				<th>Arrival Airport</th>
				<th>Dept. Time</th>
				<th>Arrival Time</th>
				<th>Flight No.</th>
				<th>Airline</th>
				<th>Dept. Date</th>
				<th>Meal</th>
				<th>Seat</th>
				<th>Class</th>
				<th>Total Fare</th>
				<th>Restrictions</th>
				<th>Booking Fee</th>
				<th>Cust. Rep.</th>
			</tr>


			<tbody>

				<%
					while (name_results.next()) {
				%>


				<tr>
					<td><%=name_results.getString("FirstName") + " " +  name_results.getString("LastName")%></td>
					<td><%=name_results.getString("Reservation_No")%></td>
					<td><%=name_results.getString("ReservationDate")%></td>
					<td><%=name_results.getString("Passengers")%></td>
					<td><%=name_results.getString("Airport_Name")%></td>
					<td><%=name_results.getString("Airport_Name")%></td>
					<td><%=name_results.getString("Dept_Time")%></td>
					<td><%=name_results.getString("Arrival_Time")%></td>
					<td><%=name_results.getString("Flight_No")%></td>
					<td><%=name_results.getString("AirLine_Name")%></td>
					<td><%=name_results.getString("Dept_Date")%></td>
					<td><%=name_results.getString("Meal")%></td>
					<td><%=name_results.getString("Seat_No")%></td>
					<td><%=name_results.getString("Class")%></td>
					<td><%=name_results.getString("TotalFare")%></td>
					<td><%=name_results.getString("FareRestriction")%></td>
					<td><%=name_results.getString("BookingFee")%></td>
					<td><%=name_results.getString("CustRep")%></td>

				</tr>

				<%
					}
				%>

			</tbody>
		</table>
		
		<%
		
			name_results.close();
			String topCustomerQuery = "Select FirstName, LastName, Max(Fee) as TotalPrice From (Select FirstName, LastName, sum(BookingFee) as Fee From Reservation join Customer using(acctNumber) Group by acctNumber) as r2;";
			ResultSet topCustomerResults = stmt.executeQuery(topCustomerQuery);
			topCustomerResults.next();
		
		%>
		
		<h2>Top Customer: <%=" " + topCustomerResults.getString("FirstName") + " " + topCustomerResults.getString("LastName") + " ($" + topCustomerResults.getString("TotalPrice") + ")"%></h2>

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