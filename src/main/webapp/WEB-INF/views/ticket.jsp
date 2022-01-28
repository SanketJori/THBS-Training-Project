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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
	integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>ticket</title>
</head>
<style>
#ticket_container {
	max-width: 700px;
	height: fit-content;
	padding: 20px;
	margin: 0 0 0 50px;
	box-shadow: 0px 5px 10px gray;
}

#table1>th, td {
	padding: 3px 10px;
}

#table2>tr, th, td {
	padding: 3px 20px;
}

#payment-div {
	max-width: 350px;
	height: fit-content;
	padding: 10px 10px 15px 10px;
	box-shadow: 0px 5px 10px gray;
}
</style>


<body>
	<div class="container-fluid">

		<div id="ticket" class="row mt-5 mb-5">
			<div class="col-8 border-1">
				<div id="ticket_container">
					<h2 class="text-center">Ticket</h2>

					<h5>Ticket Details :</h5>

					<hr>
					<table id="table1" class="">


						<tr>
							<td><h6>PNR :</h6></td>
							<td><h6 id="pnr">${pnr}</h6></td>

						</tr>
						<tr>
							<td><h6>Train Number :</h6></td>
							<td><h6>${train_no}</h6></td>

						</tr>
						<tr>
							<td><h6>From :</h6></td>
							<td><h6>${src}</h6></td>

						</tr>
						<tr>
							<td><h6>To :</h6></td>
							<td><h6>${dest}</h6></td>

						</tr>
						<tr>
							<td><h6>Travel Date :</h6></td>
							<td><h6>${travel_date}</h6></td>

						</tr>
						<tr>
							<td><h6>Passengers :</h6></td>
							<td><h6>${num_of_passengers}</h6></td>

						</tr>

					</table>

					<h5>Passenger Details :</h5>
					<hr>
					<table id="table2" class="">
						<tr>
							<th>Name</th>
							<th>Adhar Number</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Ticket Fare</th>
						</tr>
						<c:forEach items="${passenger}" var="entry">

							<tr>
								<td>${entry.key.getName()}</td>
								<td>${entry.key.getAdharNumber()}</td>
								<td>${entry.key.getAge()}</td>
								<td>${entry.key.getGender()}</td>
								<td>${entry.value}</td>
							</tr>


						</c:forEach>



					</table>
					<br>
					<h6>Total Ticket Price : ${totalTicketPrice }</h6>

				</div>

			</div>
			<!-- <div class="col-3">
				<button type="button" class="btn btn-success float-right"
					id="download">Download Ticket <i class="material-icons">download</i></button>
					
					<div> -->
			<div class="col-4 border-2">

				<form id="payment-div" onsubmit="processPayment()" >





					<h3 class="text-center">Payment Details</h3>

					<label class="form-label" for="cname">Name</label> <input
						class="form-control mb-2" type="text" id="cname" name="cardname"
						placeholder="Name of card holder" required> <label
						class="form-label for="ccnum">Card Number</label> <input
						class="form-control mb-3" type="text" id="ccnum" name="cardnumber"
						placeholder="Enter card number" required>

					<div class="row">
						<div class="col-7">
							<label class="form-label for="expyear">Exp month/year</label> <input
								class="form-control mb-2" type="text" id="expyear"
								name="expyear" placeholder="mm/yy" required>
						</div>
						<div class="col-5 pb-3">
							<label class="form-label for="cvv">CVV</label> <input
								class="form-control" type="text" id="cvv" name="cvv"
								placeholder="" required>
						</div>
					</div>




					<div class=" mt-3 pb-0">
						<button type="submit" class="btn btn-success text-center m-auto "
							id="payment" >Pay ${totalTicketPrice }</button>
					</div>


				</form>
				<div class="float-right  border w-50 mt-5">
					<button type="button" class="btn btn-success w-100 float-right"
						id="download">
						Download Ticket <i class="material-icons m-auto">download</i>
					</button>
				</div>



			</div>



		</div>
		<!-- row -->

	</div>
	<!-- container -->

</body>

<script>


	function processPayment(){
		alert("Payment Successfull \n ticket booked succsessful");
		var dnld = document.getElementById('download');
		dnld.classList.add("visible");
	}
	
	window.onload = function() {
		//alert("Ticket Booked Successfully");
		var pnr = document.getElementById('pnr').innerHTML;
		
		document.getElementById('download').addEventListener('click', ()=>{
			const ticket = this.document.getElementById('ticket_container');
			
			var opt = {
					  margin:       0.5,
					  filename:     pnr,
					  image:        { type: 'jpeg', quality: 0.98 },
					  html2canvas:  { scale: 2 },
					  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
					};
			html2pdf().from(ticket).set(opt).save()
			
		})
	}
</script>

</html>