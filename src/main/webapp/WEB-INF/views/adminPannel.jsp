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
<title>Login page</title>
</head>
<style>
/* #train-details {
	box-shadow: 0px 5px 5px gray;
	padding: 10px 20px;
	margin: 50px;
} */
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding:3px;
}
#add-train {
	max-width: 500px;
	height: fit-content;
	padding: 10px 20px;
	box-shadow: 0px 5px 5px gray;
	border: 1px solid black;
}
</style>

<body>
	<div class="container-fluid">
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



		<center>
			<div id="train-details" class="m-auto">
				<h3>Train details</h3>
				<table  width="800px" height="300px" class="text-center">
					<tr border=1px>
						<td><b>Train_No</b></td>
						<td><b>Train_Name</b></td>
						<td><b>Source</b></td>
						<td><b>Destination</b></td>
						<td><b>TicketPrice</b></td>
						<td><b>Update Train</b></td>
						<td><b>Delete Train</b></td>
					</tr>
					<tr>
						<td>1001</td>
						<td>Shatabdi express</td>
						<td>Bangalore</td>
						<td>Delhi</td>
						<td>2500</td>
						<td><input type="submit" name="value"
							class="modify  btn btn-sm btn-primary" id="modify-button"
							value="Update"></td>
						<td><input type="submit" name="value"
							class="delete  btn btn-sm btn-danger" id="delete-button"
							value="Delete"></td>
					</tr>
					<tr>
						<td>1002</td>
						<td>Shatabdi Express</td>
						<td>Delhi</td>
						<td>Bangalore</td>
						<td>2500</td>
						<td><input type="submit" name="value"
							class="modify  btn btn-sm btn-primary" id="modify-button"
							value="Update"></td>
						<td><input type="submit" name="value"
							class="delete btn btn-sm btn-danger" id="delete-button"
							value="Delete"></td>
					</tr>
					<tr>
						<td>1003</td>
						<td>Udyan Express</td>
						<td>Bangalore</td>
						<td>Mumbai</td>
						<td>1500</td>
						<td><input type="submit" name="value"
							class="modify  btn btn-sm btn-primary" id="modify-button"
							value="Update"></td>
						<td><input type="submit" name="value"
							class="delete btn btn-sm btn-danger" id="delete-button"
							value="Delete"></td>
					</tr>
					<tr>
						<td>1004</td>
						<td>Udyan Express</td>
						<td>Mumbai</td>
						<td>Bangalore</td>
						<td>1500</td>
						<td><input type="submit" name="value"
							class="modify  btn btn-sm btn-primary" id="modify-button"
							value="Update"></td>
						<td><input type="submit" name="value"
							class="delete btn btn-sm btn-danger" id="delete-button"
							value="Delete"></td>
					</tr>
					<tr>
						<td>1005</td>
						<td>Brindavan Express</td>
						<td>Bangalore</td>
						<td>Chennai</td>
						<td>1000</td>
						<td><input type="submit" name="value"
							class="modify  btn btn-sm btn-primary" id="modify-button"
							value="Update"></td>
						<td><input type="submit" name="value"
							class="delete btn btn-sm btn-danger" id="delete-button"
							value="Delete"></td>
					</tr>
					<tr>
						<td>1006</td>
						<td>Brindavan express</td>
						<td>Chennai</td>
						<td>Bangalore</td>
						<td>1000</td>
						<td><input type="submit" name="value"
							class="modify btn btn-sm btn-primary" id="modify-button"
							value="Update"></td>
						<td><input type="submit" name="value"
							class="delete btn btn-sm btn-danger" id="delete-button"
							value="Delete"></td>
					</tr>
				</table>
			</div>
		</center>

		<br>

		<div id="add-train" class="m-auto mb-5">
			<h3 class="text-center">Add Train</h3>
			<form action="#" class="display m-auto">

				<lable class="form-label">TrainNo</lable>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					class="form-control" type="number" name="trainno"
					placeholder="Enter TrainNo" required><br>
				<lable class="form-label">TrainName</lable>
				&nbsp;&nbsp;<input class="form-control" type="text" name="trainname"
					placeholder="Enter TrainName"><br> <label>Source</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="form-control" type="text" name="source"
					placeholder="Enter Source" required ><br> <label
					class="form-label">Destination</label>&nbsp;&nbsp;<input
					class="form-control" type="text" name="destination"
					placeholder="Enter Destination" required><br> <label
					class="form-label">TicketPrice</label>&nbsp;&nbsp;<input
					class="form-control" type="number" name="ticketprice"
					placeholder="Enter TicketPrice" required><br> <br>

				<div class="text-center buttons">
					<td><input type="submit"
						class="add btn btn-success" id="add-button" value="Add Train"></td>

				</div>

			</form>
		</div>
	</div>


	</div>


</body>
</html>