package com.example.TrainTicketBookingWebApp.model;

public class Train {
	private int train_no;
	private String train_name;
	private String source_place;
	private String destination_place;
	private double ticket_price;
	
	public Train(int train_no, String train_name, String source_place, String destination_place, double ticket_price) {
		super();
		this.train_no = train_no;
		this.train_name = train_name;
		this.source_place = source_place;
		this.destination_place = destination_place;
		this.ticket_price = ticket_price;
	}

	public int getTrain_no() {
		return train_no;
	}

	public void setTrain_no(int train_no) {
		this.train_no = train_no;
	}

	public String getTrain_name() {
		return train_name;
	}

	public void setTrain_name(String train_name) {
		this.train_name = train_name;
	}

	public String getSource_place() {
		return source_place;
	}

	public void setSource_place(String source_place) {
		this.source_place = source_place;
	}

	public String getDestination_place() {
		return destination_place;
	}

	public void setDestination_place(String destination_place) {
		this.destination_place = destination_place;
	}

	public double getTicket_price() {
		return ticket_price;
	}

	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}

	@Override
	public String toString() {
		return "Train [train_no=" + train_no + ", train_name=" + train_name + ", source_place=" + source_place
				+ ", destination_place=" + destination_place + ", ticket_price=" + ticket_price + "]";
	} 
	
	
}
