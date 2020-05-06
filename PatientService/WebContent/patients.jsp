<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Patient"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Registration</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="./Components/patients.js"></script>
</head>
<body>

	<div class="container">
	<div class="row">
	<div class="col-6">
		<h2>Patient Register Details2</h2>

		<form name="formPatient" id="formPatient">
			<div class="form-group">

				<!-- 	<label for="patientID">Patient ID:</label>
				<input type="patientID" class="form-control" id="patientID" placeholder="Enter your ID" name="patientID"><br>  -->

				<label for="patientName">Patient Name:</label> <input
					type="patientName" class="form-control" id="patientName"
					placeholder="Enter your Name" name="patientName"><br>

				<label for="patientAddress">Patient Address:</label> <input
					type="patientAddress" class="form-control" id="patientAddress"
					placeholder="Enter your Home Address" name="patientAddress"><br>

				<label for="patientAge">Patient Age:</label> <input
					type="patientAge" class="form-control" id="patientAge"
					placeholder="Enter your Age" name="patientAge"><br> 
				<label for="patientPhone">Patient Phone:</label> <input
					type="patientPhone" class="form-control" id="patientPhone"
					placeholder="Enter your Phone Number" name="patientPhone"><br>

				<input id="btnSave" name="btnSave" type="button" value="Save"
					class="btn btn-primary">
				<input type="hidden" id="hidPatientIDSave" name="hidPatientIDSave"
					value="">
			</div>
		</form>

		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div>
		<br>
		
		<div id="divPatientsGrid">
			<%
				Patient patientObj = new Patient();
				out.print(patientObj.readPatients());
			%>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
		