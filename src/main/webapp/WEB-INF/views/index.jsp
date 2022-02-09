<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Train Ticket Booking App</title>
</head>
<style>
#welcome-div{
height:fit-content;
padding : 20px 20px;


}
img{
width:700px;
height:600px;

}
.btn{
border:1px solid #129;

}
.btn:hover {
  background-color: #129;
}

</style>
<body>
	<div class="container-fluid">
		<!-- <div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<h3 class="text-center m-auto"><img src="data:image/png;base64,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" alt="Site Logo"></h3>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
						aria-controls="navbarNavAltMarkup" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div>
						<h6></h6>
					</div>
				</div>
			</nav>
		</div> -->

		<div class="row">
			<div class="col-6 ">
			<img alt="" src="https://thebrandhopper.com/wp-content/uploads/2021/01/Indian-Railway-Catering-and-Tourism-Corporation.png">
			</div>
			<div id="welcome-div" class="col-5 mt-5 shadow m-auto">
				<h1 style="color:#128" class="text-center">Welcome to IRCTC</h1>
				<h5 style="color:#569" class="text-center">Book your train ticket here</h5>
				<div id="btn-div" class="text-center row mt-5">
				
					<div class=" col-6">
					

						<a  href="userLogin"
							 class="text-uppercase btn btn-lg btn-outline-dark">User Login</a>

					</div>
					<div class="col-5">
						<a href="adminLogin"
							class="text-uppercase btn btn-lg btn-outline-dark">Admin
							Login</a>
					</div>

				</div>
			</div>
		</div>




		<!-- <footer class="text-center container  footer fixed-bottom text-white"
			style="background-color: #f1f1f1;">
			<div style="font-size: 50px; padding: 10px;">
				<a href="https://www.facebook.com/" target="_blank"><i
					class="bi bi-facebook"></i></a> <a href="https://www.twitter.com/"
					target="_blank"><i class="bi bi-twitter"></i></a> <a
					href="https://www.google.com/" target="_blank"><i
					class="bi bi-google"></i></a> <a href="https://www.linkedin.com/"
					target="_blank"><i class="bi bi-linkedin"></i></a>

			</div>
			Grid container

			Copyright
			<div class="text-center text-dark p-3"
				style="background-color: rgba(0, 0, 0, 0.2);">
				© 2021 Copyright: <a class="text-dark"
					href="https://www.irctc.co.in/nget/train-search">irctc.com</a>
			</div>
			Copyright
		</footer> -->


	</div>
</html>