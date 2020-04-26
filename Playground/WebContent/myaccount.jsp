<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=submit] {
  width: 10%;
  background-color: black;
  color: white;
  padding: 5px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}


div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

</style>
<body>
<div class="topnav">
  <a class="active" href="main.jsp">Home</a>
  <a href="myaccount.jsp">myAcccount</a>
<a href="history.jsp">Reservations</a>
  <a href="login.jsp">Sign out</a>



</div>

<h3><center>About Me</center></h3>

<div>
  <form action="/action_page.php">
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name...">
    <input type="submit" value="Edit">
    <span style="display:block; height: 2px;"></span>

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name...">
    <input type="submit" value="Edit">
    <span style="display:block; height: 2px;"></span>

    <label for="addy">Address</label>
    <input type="text" id="addy" name="address" placeholder="Address...">
    <input type="submit" value="Edit">
    <span style="display:block; height: 2px;"></span>

    <label for="cit">City</label>
    <input type="text" id="cit" name="city" placeholder="City...">
    <input type="submit" value="Edit">
    <span style="display:block; height: 2px;"></span>

    <label for="state">State</label>
    <select id="state" name="State">
      	<option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>
    </select>
    <span style="display:block; height: 2px;"></span>
  

    <label for="zip">Zip Code</label>
    <input type="text" id="zip" name="zip code" placeholder="Zip Code...">
    <input type="submit" value="Edit">
    <span style="display:block; height: 2px;"></span>

    <label for="ssn">Last 4 Digits of Social Security</label>
    <input type="text" id="ssn" name="lastname" placeholder="Social Security...">
    <input type="submit" value="Edit">
    <span style="display:block; height: 2px;"></span>

    <label for="cc">Credit Card Number</label>
    <input type="text" id="cc" name="credit" placeholder="Credit Card...">
    <input type="submit" value="Edit">
    
   
   
  
  </form>
</div>

</body>
</html>