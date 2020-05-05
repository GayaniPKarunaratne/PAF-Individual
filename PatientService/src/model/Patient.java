package model;

import java.sql.*;

public class Patient {
	// A common method to connect to the DB
	private Connection connect() {
		Connection con = null;
//		try
//		{
//			Class.forName("com.mysql.jdbc.Driver");
//
//			//Provide the correct details: DBServer/DBName, username, password
//			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/patients", "root", "");
//		}
//		catch (Exception e)
//		{e.printStackTrace();}

		String url = "jdbc:mysql://localhost:3306/patients";
		String username = "root";
		String password = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);

		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public String insertPatient(String id, String name, String address, String age, String phone) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = " insert into patients(patientID,patientName,patientAddress,patientAge,patientPhone)"
					+ "values (?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, id);
			preparedStmt.setString(2, name);
			preparedStmt.setString(3, address);
			preparedStmt.setString(4, age);
			preparedStmt.setString(5, phone);
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Inserted successfully";
		} catch (Exception e) {
			output = "Error while inserting the patient.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String readPatients() {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border=\"1\"><tr><th>Patient ID</th><th>Patient Name</th><th>Patient Address</th><th>Patient Age</th><th>Patient Phone</th><th>Update</th><th>Remove</th></tr>";
			String query = "select * from patients";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String patientID = rs.getString("patientID");
				String patientName = rs.getString("patientName");
				String patientAddress = rs.getString("patientAddress");
				String patientAge = rs.getString("patientAge");
				String patientPhone = rs.getString("patientPhone");
				// Add into the html table
				output += "<tr><td>" + patientID + "</td>";
				output += "<td>" + patientName + "</td>";
				output += "<td>" + patientAddress + "</td>";
				output += "<td>" + patientAge + "</td>";
				output += "<td>" + patientPhone + "</td>";
				// buttons
				output += "<td><input name=\"btnUpdate\" type=\"button\"value=\"Update\" class=\"btnUpdate btn btn-secondary\"></td>"
						+ "<td><form method=\"post\" action=\"patients.jsp\">"
						+ "<input name=\"btnRemove\" type=\"submit\" value=\"Remove\"class=\"btn btn-danger\">"
						+ "<input name=\"patientID\" type=\"hidden\" value=\"" + patientID + "\">" + "</form></td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the patients.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updatePatient(String id, String name, String address, String age, String phone) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE patients SET patientName=?,patientAddress=?,patientAge=?,patientPhone=?WHERE patientID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, name);
			preparedStmt.setString(2, address);
			preparedStmt.setString(3, age);
			preparedStmt.setString(4, phone);
			preparedStmt.setString(5, id);
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Updated successfully";
		} catch (Exception e) {
			output = "Error while updating the patient.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deletePatient(String patientID) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from patients where patientID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, patientID);
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Deleted successfully";
		} catch (Exception e) {
			output = "Error while deleting the patient.";
			System.err.println(e.getMessage());
		}
		return output;
	}
}