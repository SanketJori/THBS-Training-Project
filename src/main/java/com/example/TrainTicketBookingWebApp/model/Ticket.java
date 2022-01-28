package com.example.TrainTicketBookingWebApp.model;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class Ticket {
	// Attributes
	private int counter;
	private String pnr;
	private Date travel_date;
	private Train train;
	private HashMap<Passenger, Integer> passengers = new HashMap<Passenger, Integer>();

	public Ticket() {

	}

	public Ticket(Date travel_date2, Train train) {
		this.travel_date = travel_date2;
		this.train = train;
		counter=100;
	}

	// getters and setters for Ticket class

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public String getPnr() {
		return pnr;
	}

	public void setPnr(String pnr) {
		this.pnr = pnr;
	}

	public String getTravel_date() {
		return new SimpleDateFormat("dd/mm/yyyy").format(travel_date);
	}

	public void setTravel_date(Date travel_date) {
		this.travel_date = travel_date;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	public HashMap<Passenger, Integer> getPassengers() {
		return passengers;
	}

	public void setPassenger(HashMap<Passenger, Integer> passenger) {
		this.passengers = passengers;
	}

	// method to calculate passenger fare
	private double calcPassengerFare(Passenger passenger) {
		
		double ticketPrice = train.getTicket_price();
		int age = passenger.getAge();
		String gender = passenger.getGender();
		if (age >= 60) {
			ticketPrice = ticketPrice * 0.4;
			return ticketPrice;
		} else if (gender =="female") {
			ticketPrice = ticketPrice * 0.75;
			return ticketPrice;
		} else if (age <= 12) {
			ticketPrice = ticketPrice * 0.5;
			return ticketPrice;
		} else {
			return ticketPrice;
		}

	}

	// Method to Generate PNR
	public String generatePNR() {
		char src = train.getSource_place().charAt(0);
		char desc = train.getDestination_place().charAt(0);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = simpleDateFormat.format(travel_date);
		String pnr = "" + src + "" + desc + "" + date + "_" + counter;
		counter++;
		return pnr;
	}

	// method to add passenger

	public void addPassenger(String name, long adharNumber, int age, String gender) {
		Passenger passenger = new Passenger(name, adharNumber, age, gender);
		double price = calcPassengerFare(passenger);
		passengers.put(passenger, (int) price);
		
		
	}

	// method to write ticket to File
	public void writeTicket() throws IOException {
		FileOutputStream fileOutStram = new FileOutputStream(generatePNR() + ".txt");
		StringBuilder stringBuilder = this.generateticket();
		fileOutStram.write(stringBuilder.toString().getBytes());
		fileOutStram.close();
		System.out.println(this.generatePNR());

	}

	// method to calculate total ticket price
	public double calculateTotalprice() {
		double totalticketPrice = 0;
		for (Passenger p : passengers.keySet()) {
			totalticketPrice += passengers.get(p);
		}
		return totalticketPrice;
	}

	// method to generate Ticket
	private StringBuilder generateticket() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String date = simpleDateFormat.format(travel_date);
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("PNR :           " + generatePNR() + "\n");
		stringBuilder.append("Train Number :  " + getTrain().getTrain_no() + "\n");
		stringBuilder.append("Train Name :    " + getTrain().getTrain_name() + "\n");
		stringBuilder.append("From :          " + getTrain().getSource_place() + "\n");
		stringBuilder.append("To :            " + getTrain().getDestination_place() + "\n");
		stringBuilder.append("Travel date :   " + date + "\n");
		stringBuilder.append("Passenger   :   " + "\n");
		stringBuilder.append("\n");
		stringBuilder.append("Name\t\tage\t\tGender\t\tFare\n");

		for (Map.Entry<Passenger, Integer> pie : passengers.entrySet()) {
			stringBuilder.append(pie.getKey().getName() + "\t\t" + pie.getKey().getAge() + "\t\t"
					+ pie.getKey().getGender() + "\t\t" + pie.getValue() + "\t\t");
		}
		stringBuilder.append("TotalPrice : " + calculateTotalprice());

		return stringBuilder;
	}

	@Override
	public String toString() {
		return "Ticket [counter=" + counter + ", pnr=" + pnr + ", travel_date=" + travel_date + ", train=" + train
				+ ", passengers=" + passengers + "]";
	}

}
