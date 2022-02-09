<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Login page</title>
</head>
<style>
#train-details{
width:700px;
height: fit-content;
padding: 10px 20px;
border: 1px solid black;

}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
}

#add-train {
	max-width: 500px;
	height: fit-content;
	padding: 10px 20px;
	box-shadow: 0px 5px 5px gray;
	
}
</style>

<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand m-auto" href="#"><h3>Admin Panel</h3></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

			</div>
		</nav>




		<div id="train-details" class="m-auto">
			<h3 class="mb-3">Train details <span><a href="showTrains" class="btn btn-primary" >Show Trains</a></span></h3>
			<table id="table2" class="text-center">
				<tr>
					<th>Train NO</th>
					<th>Train Name</th>
					<th>Source Place</th>
					<th>Destination</th>
					<th>Ticket Fare</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${listTrains}" var="train">
					<tr>
						<td>${train.getTrain_no() }</td>
						<td>${train.getTrain_name() }</td>
						<td>${train.getSource_place() }</td>
						<td>${train.getDestination_place() }</td>
						<td>${train.getTicket_price()}</td>
						<td><input type="submit" name="update"
							class="modify  btn btn-sm btn-primary" id="modify-button"
							value="Update"></td>
						<td><a href="#" name="delete"
							class="delete  btn btn-sm btn-danger" id="delete-button"
							value="Delete">Delete</a></td>
					</tr>


				</c:forEach>



			</table>

		</div>

		<div id="add-train" class="mt-5 m-auto">
		<h3 class="text-center">Add Train</h3>

			<form action="saveTrain" method="post">

				<label for="train_no" class="form-label">Train No</label> <input
					type="number" name="train_no" class="form-control"
					placeholder="enter train number" requiree> </input>
					 <label
					for="train_name" class="form-label">Train Name</label> <input
					type="text" name="train_name" class="form-control"
					placeholder="enter train name" required></input> 
					<label
					for="source_place" class="form-label">Source Place</label> <input
					type="text" id="source_place" name="source_place" class="form-control"
					placeholder="enter Source Place" required></input> 
					<label
					for="destination_place" class="form-label">Destination place</label>
					 <input
					type="text" id="destination_place" name="destination_place" class="form-control"
					placeholder="enter Destination place" required></input>
					 <label
					for="ticket_price" class="form-label">Ticket prize</label> <input
					type="text" id="ticket_price" name="ticket_price" class="form-control"
					placeholder="enter Ticket prize" required></input>
	
					<input type="submit" id="add" class=" mt-5 text-center btn btn-success" value="Add Train">

			</form>


		</div>



		<br>


	</div>


	</div>


</body>
</html>