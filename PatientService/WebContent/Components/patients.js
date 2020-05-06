$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	//console.log("called");
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validatePatientForm();
	//console.log(status !== "success");
	if (status !== "success") {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidPatientIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "PatientsAPI",
		type : type,
		data : $("#formPatient").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onPatientSaveComplete(response.responseText, status);
		}
	});
	// $("#formPatient").submit();
});


function onPatientSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);

		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();

			$("#divPatientsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}

	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}

	$("#hidPatientIDSave").val("");
	$("#formPatient")[0].reset();

}

// UPDATE==========================================
$(document).on("click",".btnUpdate",function(event) {
					$("#hidPatientIDSave").val(
							$(this).closest("tr").find('#hidPatientIDUpdate').val());
					$("#patientName").val(
							$(this).closest("tr").find('td:eq(0)').text());
					$("#patientAddress").val(
							$(this).closest("tr").find('td:eq(1)').text());
					$("#patientAge").val(
							$(this).closest("tr").find('td:eq(2)').text());
					$("#patientPhone").val(
							$(this).closest("tr").find('td:eq(3)').text());
					
				});
// DELETE===========================================================================

$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "PatientsAPI",
		type : "DELETE",
		data : "patientID=" + $(this).closest("tr").find('#hidPatientIDUpdate').val(),
		dataType : "text",
		complete : function(response, status) {
			onPatientDeleteComplete(response.responseText, status);
		}
	});
});

function onPatientDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divPatientsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// CLIENTMODEL=========================================================================
function validatePatientForm() {
	// ID
	// if ($("#patientID").val().trim() == "") {
	// return "Insert Patient ID.";
	// }
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
	// $("#itemPrice").val(parseFloat(tmpPrice).toFixed(2));

	// Phone------------------------
	var tmpPhone = $("#patientPhone").val().trim();
	if (!$.isNumeric(tmpPhone)) {
		return "Insert Patient Phone.";
	}
	return "success";
}
