<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>Book Ticket</title>
</head>
<style>
.container {
	width: 500px;
	height: auto;
	box-shadow: 0px 5px 10px gray;
}
</style>
<body>
	<p class="text-success text-center msg">${success_msg}</p>
	<p class="text-danger text-center msg">${error_msg}</p>
	<p class="text-danger text-center msg">${date_error}</p>
	<div class="container m-2 mx-auto bg-dark">

		<form action="processTicket" method="post">
			<div class="m-auto p-4 " id="container">
				<h4 class="text-center mb-4 text-light">Book Your Train Ticket</h4>
				<label class="text-light mb-2" for="from"><i
					class="material-icons align-middle">send</i> From </label> <select
					class="form-select mb-2 border-dark" name="source_place" id="from"
					required>
					<option value="">Select Source Place</option>
					<option value="Bangalore">Bangalore</option>
					<option value="Delhi">Delhi</option>
					<option value="Mumbai">Mumbai</option>
					<option value="Chennai">Chennai</option>
				</select> <label class="text-light mb-2 mt-2" for="to"><i
					class="material-icons align-middle">place</i> To </label> <select
					class="form-select mb-2 border-dark" name="destination_place"
					id="to" required>
					<option value="">Select Destination Place</option>
					<option value="Bangalore">Bangalore</option>
					<option value="Delhi">Delhi</option>
					<option value="Mumbai">Mumbai</option>
					<option value="Chennai">Chennai</option>
					


				</select>
				<div class="row">
					<div class="col">
						<label class="text-light mb-2 mt-2" for="travel_date"><i
							class="material-icons align-middle ">event</i> Select travel date</label>
						<input class="form-control mb-2 border-dark" type="date"
							name="travel_date" id="travel_date" value="select date" required>
					</div>
					<div class="col">
						</select> <label class="text-light mb-2 mt-2" for="classes"><i
							class="material-icons align-middle "></i> All
							Classes</label> <select class="form-select mb-2 border-dark"
							name="classes" id="classes" required>
							<option value="">Select Class</option>
							<option value="general">General</option>
							<option value="1A">AC First Class</option>
							<option value="2A">AC 2 Tier</option>
							<option value="sleeper">Sleeper</option>
						</select>
					</div>
				</div>


				<label class="text-light mb-2 mt-2" for="no_of_persons"><i
					class="material-icons align-middle">person</i> Select no of persons
				</label>
				<div class="row">
					<div class="col">

						<select class="form-select select" name="no_of_persons"
							id="no_of_persons" required>
							<option value="">Passengers</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
						</select>

					</div>

					<div class="col ">
						<input class="form-control btn btn-primary" type="button"
							value="add" id="submit-btn" onclick="add_passenger()">
					</div>
				</div>
				<hr class="text-light">
				<div class="row">
					<div class="col" id="passenger-container"></div>
				</div>


				<input class="btn btn-success mt-3 form-control" type="submit"
					value="Book Ticket">
			</div>

		</form>
	</div>
</body>
</html>

<script>
	function add_passenger() {
		var count = document.getElementById("no_of_persons").value;
		for (var i = 1; i <= count; i++) {

			// create a variable to access parent container
			var my_container = document.getElementById("passenger-container");
			my_container.classList.add("text-light");
			// my_container.appendChild(document.createElement("hr"));

			var newLable = document.createElement("label");
			var new_element = document.createElement('input');
			var new_ID = document.createElement('input');
			var newAge = document.createElement('input');

			newLable.classList.add("text-light");
			newLable.innerHTML = "Enter details of passenger " + i;
			my_container.appendChild(newLable);

			new_element.type = "text";
			new_element.placeholder = "Name";
			new_element.name = "name" + i;
			new_element.classList.add("form-control", "mb-2");
			new_element.required = true;
			my_container.appendChild(new_element);

			new_ID.type = "number";
			new_ID.placeholder = "Adhar Number";
			new_ID.name = "adharNumber" + i;
			new_ID.classList.add("form-control", "mb-2");
			new_ID.required = true;
			my_container.appendChild(new_ID);

			newAge.type = "number";
			newAge.placeholder = "Age";
			newAge.name = "age" + i;
			newAge.classList.add("form-control", "mb-1");
			newAge.required = true;
			my_container.appendChild(newAge);

			var newGender = document.createElement('input');
			newGender.type = "radio";
			newGender.name = "gender" + i;
			newGender.value = "Male";
			newGender.required = true;
			newGender.classList.add("form-check-input");
			newGender.classList.add("mx-2")
			my_container.appendChild(newGender);
			my_container.appendChild(document.createTextNode("Male"));

			var newGender = document.createElement('input');
			newGender.type = "radio";
			newGender.name = "gender" + i;
			newGender.value = "Female";
			newGender.classList.add("form-check-input");
			newGender.classList.add("mx-2")
			my_container.appendChild(newGender);
			my_container.appendChild(document.createTextNode("Female"));
			my_container.appendChild(document.createElement("br"));
			my_container.appendChild(document.createElement("hr"));

		}
	}
</script>