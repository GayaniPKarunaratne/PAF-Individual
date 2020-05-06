//package com;
//
//import com.Patient;
////For REST Service
//import javax.ws.rs.*;
//import javax.ws.rs.core.MediaType;
////For JSON
//import com.google.gson.*;
////For XML
//import org.jsoup.*;
//import org.jsoup.parser.*;
//import org.jsoup.nodes.Document;
//
//@Path("/Patients")
//public class PatientService {
//	Patient patientObj = new Patient();
//
//	@GET
//	@Path("/")
//	@Produces(MediaType.TEXT_HTML)
//	public String readPatients() {
//		return patientObj.readPatients();
//	}
//
//	@POST
//	@Path("/")
//	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
//	@Produces(MediaType.TEXT_PLAIN)
//	public String insertPatient(@FormParam("patientID") String patientID,@FormParam("patientName") String patientName,
//			@FormParam("patientAddress") String patientAddress, @FormParam("patientAge") String patientAge,
//			@FormParam("patientPhone") String patientPhone) {
//		String output = patientObj.insertPatient(patientID,patientName, patientAddress, patientAge, patientPhone);
//		return output;
//	}
//
//	@PUT
//	@Path("/")
//	@Consumes(MediaType.APPLICATION_JSON)
//	@Produces(MediaType.TEXT_PLAIN)
//	public String updatePatient(String patientData) {
//		// Convert the input string to a JSON object
//		JsonObject patientObject = new JsonParser().parse(patientData).getAsJsonObject();
//		// Read the values from the JSON object
//		String patientID = patientObject.get("patientID").getAsString();
//		String patientName = patientObject.get("patientName").getAsString();
//		String patientAddress = patientObject.get("patientAddress").getAsString();
//		String patientAge = patientObject.get("patientAge").getAsString();
//		String patientPhone = patientObject.get("patientPhone").getAsString();
//		String output = patientObj.updatePatient(patientID, patientName, patientAddress, patientAge, patientPhone);
//		return output;
//	}
//	
//	@DELETE
//	@Path("/")
//	@Consumes(MediaType.APPLICATION_XML)
//	@Produces(MediaType.TEXT_PLAIN)
//	public String deletePatient(String patientData)
//	{
//	//Convert the input string to an XML document
//	 Document doc = Jsoup.parse(patientData, "", Parser.xmlParser());
//
//	//Read the value from the element <patientID>
//	 String patientID = doc.select("patientID").text();
//	 String output = patientObj.deletePatient(patientID);
//	return output;
//	}
//
//
//}