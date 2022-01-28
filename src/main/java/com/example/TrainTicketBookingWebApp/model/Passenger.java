package com.example.TrainTicketBookingWebApp.model;

public class Passenger implements Comparable<Passenger> {
	
	private String name;
	private long adharNumber;
	private int age;
	private String gender; 

	public Passenger(String name, long adharNumber, int age, String gender) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.adharNumber=adharNumber;
		this.age = age;
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	public long getAdharNumber() {
		return adharNumber;
	}

	public void setAdharNumber(int adharNumber) {
		this.adharNumber = adharNumber;
	}

	@Override
	public String toString() {
		return "Passenger [name=" + name + ", age=" + age + ", gender=" + gender + "]";
	}

	public int compareTo(Passenger o) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
		
}
