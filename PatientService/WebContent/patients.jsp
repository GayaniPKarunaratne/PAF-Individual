<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Patient" %>	
<% 

   //session.setAttribute("statusMsg", "");
   //System.out.println("Trying to process...");
   //Save----------------------------------------
   if (request.getParameter("patientName") != null) {
	   Patient patientObj = new Patient();
       String stsMsg = "";
    
    //Insert--------------------------
    if (request.getParameter("hidPatientIDSave") == "") {
        stsMsg = patientObj.insertPatient(request.getParameter("patientName"), 
                request.getParameter("patientAddress"), 
                request.getParameter("patientAge"),
                request.getParameter("patientPhone"));
    } else//Update----------------------
    {
        stsMsg = patientObj.updatePatient(request.getParameter("hidPatientIDSave"),
                        request.getParameter("patientName"), 
                        request.getParameter("patientAddress"), 
                        request.getParameter("patientAge"), 
                        request.getParameter("patientPhone"));
    }
    session.setAttribute("statusMsg", stsMsg);
   }
   //Delete--------------------------------
   if (request.getParameter("hidPatientIDDelete") != null) {
	Patient patientObj = new Patient();
    String stsMsg = patientObj.deletePatient(request.getParameter("hidPatientIDDelete"));
    session.setAttribute("statusMsg", stsMsg);
   }
   %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Insert</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="./Components/patients.js"></script>
</head>
<body>

	<div class="container">
		<h2>Patient Register Details</h2>

		<form class="formPatient" name="formPatient" method="post" id="formPatient"
			action="patients.jsp">
			<div class="form-group">

			<!-- 	<label for="patientID">Patient ID:</label>
				<input type="patientID" class="form-control" id="patientID" placeholder="Enter your ID" name="patientID"><br>  -->

				<label for="patientName">Patient Name:</label>
				<input type="patientName" class="form-control" id="patientName" placeholder="Enter your Name" name="patientName"><br>
				
				<label for="patientAddress">Patient Address:</label>
				<input type="patientAddress" class="form-control" id="patientAddress" placeholder="Enter your Address" name="patientAddress"><br>
				
				<label for="patientAge">Patient Age:</label>
				<input type="patientAge" class="form-control" id="patientAge" placeholder="Enter your Age" name="patientAge"><br>
				
				<label for="patientPhone">Patient Phone:</label>
				<input type="patientPhone" class="form-control" id="patientPhone" placeholder="Enter your Phone" name="patientPhone"><br>

				<button id="btnSave" name="btnSave" type="button"  value="Save" class="btn btn-primary">Save</button>
			  	<input type="hidden" id="hidPatientIDSave" name="hidPatientIDSave" value="">
			</div>
		</form>

		<div id="alertSuccess" class="alert alert-success">
			<%
				out.print(session.getAttribute("statusMsg"));
			%>

		</div>
		<div id="alertError" class="alert alert-danger">
	
		</div>

		<%
			Patient patientObj = new Patient();
		out.print(patientObj.readPatients());
		%>
		<script language="javascript">


</body>
</html>