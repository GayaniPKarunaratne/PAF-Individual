$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	console.log("called");
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validatePatientForm();
	console.log( status !== "success");
	if ( status !== "success"  ) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	$("#formPatient").submit();
});


// UPDATE==========================================
$(document).on("click",".btnUpdate", function(event) {
			$("#hidPatientIDSave").val(
			$(this).closest("tr").find('#hidPatientIDUpdate').val());
			$("#patientName").val($(this).closest("tr").find('td:eq(0)').text());
			$("#patientAddress").val($(this).closest("tr").find('td:eq(1)').text());
			$("#patientAge").val($(this).closest("tr").find('td:eq(2)').text());
			$("#patientPhone").val($(this).closest("tr").find('td:eq(3)').text());
		});
// CLIENTMODEL=========================================================================
function validatePatientForm() {
	// ID
//	if ($("#patientID").val().trim() == "") {
//		return "Insert Patient ID.";
//	}
	// NAME
	if ($("#patientName").val().trim() == "") {
		return "Insert Patient Name.";
	}
	
	// Address-------------------------------
	if ($("#patientAddress").val().trim() == "") {
		return "Insert Patient Address.";
	}
	// Age
	var tmpAge = $("#patientAge").val().trim();
	if (!$.isNumeric(tmpAge)) {
		return "Insert Patient Age.";
	}
	// convert to decimal price
//	$("#itemPrice").val(parseFloat(tmpPrice).toFixed(2));
	
	// Phone------------------------
	var tmpPhone = $("#patientPhone").val().trim();
	if (!$.isNumeric(tmpPhone)) {
		return "Insert Patient Phone.";
	}
	return "success";
}
