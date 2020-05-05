<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Patient" %>	
<% 

   session.setAttribute("statusMsg", "");
   System.out.println("Trying to process...");
   //Save----------------------------------------
   if (request.getParameter("patientName") != null) {
	   Patient patientObj = new Patient();
       String stsMsg = "";
    
    //Insert--------------------------
    if (request.getParameter("patientID") == "") {
        stsMsg = patientObj.insertPatient(request.getParameter("patientID"),
                request.getParameter("patientName"), 
                request.getParameter("patientAddress"), 
                request.getParameter("patientAge"),
                request.getParameter("patientPhone"));
    } else//Update----------------------
    {
        stsMsg = patientObj.updatePatient(
                        request.getParameter("patientID"), 
                        request.getParameter("patientName"), 
                        request.getParameter("patientAddress"), 
                        request.getParameter("patientAge"), 
                        request.getParameter("patientPhone"));
    }
    session.setAttribute("statusMsg", stsMsg);
   }
   //Delete--------------------------------
   if (request.getParameter("patientID") != null) {
	Patient patientObj = new Patient();
    String
    stsMsg = patientObj.deletePatient(request
            .getParameter("patientID"));
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

		<form class="formPatient" name="formPatient" method="post"
			action="patients.jsp">
			<div class="form-group">

				<lable for="patientID">Patient ID:</lable>
				<input type="patientID" class="form-control" id="patientID" placeholder="Enter your ID" name="patientID"><br>

				<lable for="patientName">Patient Name:</lable>
				<input type="patientName" class="form-control" id="patientName" placeholder="Enter your Name" name="patientName"><br>
				
				<lable for="patientAddress">Patient Address:</lable>
				<input type="patientAddress" class="form-control" id="patientAddress" placeholder="Enter your Address" name="patientAddress"><br>
				
				<lable for="patientAge">Patient Age:</lable>
				<input type="patientAge" class="form-control" id="patientAge" placeholder="Enter your Age" name="patientAge"><br>
				
				<lable for="patientPhone">Patient Phone:</lable>
				<input type="patientPhone" class="form-control" id="patientPhone" placeholder="Enter your Phone" name="patientPhone"><br>

				<input id="btnSave" name="btnSave" type="submit" value="Save" class="btn btn-primary"> 
			<!--  	<input type="hidden" id="hidPatientIDSave" name="hidPatientIDSave" value=""> -->
			</div>
		</form>

		<div id="alertSuccess" class="alert alert-success">
			<%
				out.print(session.getAttribute("statusMsg"));
			%>

		</div>

		<%
			Patient patientObj = new Patient();
		out.print(patientObj.readPatients());
		%>
		<script language="javascript">


</body>
</html>