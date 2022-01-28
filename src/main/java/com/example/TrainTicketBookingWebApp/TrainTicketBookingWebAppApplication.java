package com.example.TrainTicketBookingWebApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication(scanBasePackages = "com.example.TrainTicketBookingWebApp")

public class TrainTicketBookingWebAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(TrainTicketBookingWebAppApplication.class, args);
	}

}
