package com.example.TrainTicketBookingWebApp.dao;
import java.sql.*;

import com.example.TrainTicketBookingWebApp.model.*;
public class TrainDAO {
		
	private static final String url = "jdbc:mysql://localhost:3306/traindb";
	private static final String userName = "root";
	private static final String password = "sanket@99";
	
	private static Connection con = null;
	
	public static Connection getConnection() throws SQLException,ClassNotFoundException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url,userName,password);
		return con;
		
	}
	
	public Train findTrain(String src, String dest) throws SQLException,ClassNotFoundException {
		getConnection();
		
		Train train = null;
		Statement st = null;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from trains where SOURCE_PLACE = '" +  src  + "' AND DESTINATION_PLACE = '" + dest +"'");
			while(rs.next()) {
				train = new Train(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getDouble(5));
			}
			
		}catch (Exception e) {
			// TODO: handle exception 
			e.printStackTrace();
		}
		con.close();
		return train;
		
	}
	
}
 