<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, Users.User, Users.CurrentUser"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=PT+Sans:400"
	rel="stylesheet">


<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<link type="text/css" rel="stylesheet" href="css/style.css" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<%
		System.out.println(CurrentUser.getCurrentUser());
	%>


	<div class="topnav">
		<a class="active" href="main.jsp">Home</a> <a href="myaccount.jsp">myAcccount</a>
		<a href="history.jsp">Reservations</a> <a href="login.jsp">Sign
			out</a>
	</div>
	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="booking-form">
						<form>
							<div class="form-group">
								<div class="form-checkbox">
									<label for="roundtrip"> <input type="radio"
										id="roundtrip" name="flight-type"> <span></span>Round
										Trip
									</label> <label for="one-way"> <input type="radio" id="one-way"
										name="flight-type"> <span></span>One Way
									</label> <label for="multi-city"> <input type="radio"
										id="multi-city" name="flight-type"> <span></span>MultiCity
									</label>

								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">Flying From</span> <input
											class="form-control" type="text" placeholder="City/Airport">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">Flying To</span> <input
											class="form-control" type="text" placeholder="City/Airport">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<span class="form-label">Leaving</span> <input
											class="form-control" type="date" required>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<span class="form-label">Arriving</span> <input
											class="form-control" type="date" required>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<span class="form-label">Adults (18+)</span> <select
											class="form-control">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5+</option>
										</select> <span class="select-arrow"></span>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<span class="form-label">Children (17-)</span> <select
											class="form-control">
											<option>0</option>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5+</option>
										</select> <span class="select-arrow"></span>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<span class="form-label">Seniors (65+)</span> <select
											class="form-control">
											<option>0</option>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5+</option>
										</select> <span class="select-arrow"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<span class="form-label">Travel Class</span> <select
											class="form-control">
											<option>First Class</option>
											<option>Business Class</option>
											<option>Economy Class</option>
										</select> <span class="select-arrow"></span>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-btn">
										<button class="submit-btn">Show flights</button>
									</div>
								</div>

								<div class="form-checkbox">
									<label for="domestic"> <input type="radio"
										id="domestic" name="flight"> <span></span>Domestic
									</label> <label for="international"> <input type="radio"
										id="international" name="flight"> <span></span>International
									</label>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>