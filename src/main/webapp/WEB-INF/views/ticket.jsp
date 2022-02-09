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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
	integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>ticket</title>
</head>
<style>
h6{
font-weight:bolder;
}

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

		<div id="ticket" class="row mt-1 mb-5">
			<div class="col-8 border-1">
				<div id="ticket_container">
					<h2 class="text-center">Ticket</h2>

					<h5><b>Ticket Details :</b></h5>

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
							<td><h6>Class :</h6></td>
							<td><h6>${ticket_class}</h6></td>

						</tr>
						<tr>
							<td><h6>Passengers :</h6></td>
							<td><h6>${num_of_passengers}</h6></td>

						</tr>

					</table>

					<h5><b>Passenger Details :</b></h5>
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
					
					
					<h6>Total Ticket Price : ${totalTicketPrice }</h6>
					<div class="float-right  border w-50 mt-5">
						<button type="button" class="btn btn-success  w-100 float-right"
							id="download">
							Download Ticket <i class="material-icons m-auto">download</i>
						</button>
					</div>

				</div>

			</div>
			<!-- <div class="col-3">
				<button type="button" class="btn btn-success float-right"
					id="download">Download Ticket <i class="material-icons">download</i></button>
					
					<div> -->
			<div class="col-4 border-2">

				<%-- <form id="payment-div" onsubmit="processPayment()">

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
							id="payment">Pay ${totalTicketPrice }</button>
					</div>


				</form> --%>

				<div class="">
					<h2 style="display: flex; justify-content: center">Payment
						Gateway</h2>

					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#upi">UPI</a></li>
						<li><a data-toggle="tab" href="#debitcard">Debit Card</a></li>
						<li><a data-toggle="tab" href="#creditcard">Credit Card</a></li>
					</ul>

					<div class="tab-content">
						<div id="upi" class="tab-pane fade in active">

							<div>
								<img style="width: 300px; height: 200px"
									src="https://www.businessleague.in/wp-content/uploads/2021/09/Google-Pay-PhonePe-Paytm.jpg"
									alt="Girl in a jacket" width="500" height="600">
								<!-- <img
									style="width: 300px; height: 300px"
									src="https://media.istockphoto.com/vectors/code-scan-label-scan-qr-code-icon-scan-me-text-vector-illustration-vector-id1324706577?k=20&m=1324706577&s=612x612&w=0&h=okYrdSTOH0q_g7-CISlefrWMlIv-ntZR_Bcy4ZkTwtE="
									alt="Girl in a jacket" width="500" height="600"> -->

								<form class="px-5">
									<label for="upi">Enter UPI Id : </label> <input type="text"
										id="upi" class="form-control" />
									<div class=" mt-3 pb-0">
										<button type="button"
											class="btn btn-primary text-center m-auto" id="payment" onclick="processPayment()">
											<b>Pay ${totalTicketPrice }</b> <i
												class="material-icons mx-2 m-auto align-middle"> payment</i>
										</button>
									</div>
								</form>


							</div>

						</div>

						<div
							style="box-shadow: 0px 5px 10px gray; padding: 20px 30px; width: auto; margin-top: 40px; margin-left: 20px; height: 400px"
							id="debitcard" class="tab-pane fade">
							<h3>Debit Card</h3>
							<form action="#">
								<div>
									<label class="form-label" for="cname">Name</label> <input
										class="form-control mb-2" type="text" id="cname"
										name="cardname" placeholder="Name of card holder" required>
									<label class="form-label" for="ccnum">Credit Card
										Number</label> <input class="form-control mb-3" type="text" id="ccnum"
										name="cardnumber" placeholder="Enter card number" required>

									<div class="">
										<div class="col-7">
											<label class="form-label" for="expyear">Exp
												month/year</label> <input class="form-control mb-2" type="text"
												id="expyear" name="expyear" placeholder="mm/yy" required>
										</div>
										<div class="col-5 pb-3">
											<label class="form-label" for="cvv">CVV</label> <input
												class="form-control" type="text" id="cvv" name="cvv"
												placeholder="" required>
										</div>
									</div>
									<div class=" mt-3 pb-0">
										<button type="button"
											class="btn btn-primary text-center m-auto" id="payment" onclick="processPayment()">
											<b>Pay ${totalTicketPrice }</b> <i
												class="material-icons mx-2 m-auto align-middle"> payment</i>
										</button>
									</div>
							</form>
						</div>
					</div>
					<div
						style="box-shadow: 0px 5px 10px gray; padding: 20px 30px; width: auto; margin-top: 40px; margin-left: 50px; height: 400px"
						id="creditcard" class="tab-pane fade">

						<h3>Credit Card</h3>
						<form action="#">
							<div>
								<label class="form-label" for="cname">Name</label> <input
									class="form-control mb-2" type="text" id="cname"
									name="cardname" placeholder="Name of card holder" required>
								<label class="form-label for="ccnum">Debit Card Number</label> <input
									class="form-control mb-3" type="text" id="ccnum"
									name="cardnumber" placeholder="Enter card number" required>

								<div class="">
									<div class="col-7">
										<label class="form-label for="expyear">Exp month/year</label>
										<input class="form-control mb-2" type="text" id="expyear"
											name="expyear" placeholder="mm/yy" required>
									</div>
									<div class="col-5 pb-3">
										<label class="form-label for="cvv">CVV</label> <input
											class="form-control" type="text" id="cvv" name="cvv"
											placeholder="" required>
									</div>
									<div class=" mt-3 pb-0">
										<button type="button"
											class="btn btn-primary text-center m-auto" id="payment" onclick="processPayment()">
											<b>Pay ${totalTicketPrice }</b> <i
												class="material-icons mx-2 m-auto align-middle"> payment</i>
										</button>
									</div>
								</div>
						</form>
					</div>
				</div>
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