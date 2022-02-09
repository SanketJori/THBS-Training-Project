package com.example.TrainTicketBookingWebApp.controller;

import com.example.TrainTicketBookingWebApp.dao.*;
import com.example.TrainTicketBookingWebApp.model.*;


import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class formController {

	@PostMapping(path = "/processTicket")
	public String processTicket(HttpServletRequest request, Model m) {

		String src = request.getParameter("source_place");
		String dest = request.getParameter("destination_place");

		int nop = 0;

		TrainDAO td = new TrainDAO();
		Ticket ticket = null;
		Train train = null;
		try {

			train = td.findTrain(src, dest);
			if (train == null) {
				m.addAttribute("error_msg", "Train with given source and destination  not found.");
				return "ticketForm";
			}

			String date = request.getParameter("travel_date");
			System.out.println("Date : "+date);
			try {
				Date travel_date = new SimpleDateFormat("yyyy-MM-dd").parse(date);
				System.out.println("upper travel date: "+travel_date);

//				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
//				format.format(travel_date);
				
				
				
				// Current date
				Date current_date = new Date();
				System.out.println(train);
				System.out.println(current_date + "<-current\n travel-> " + travel_date  + "\nompa->" + travel_date.compareTo(current_date));

				// compare travel_date is greater than current date or not
				
				System.out.println(travel_date.compareTo(current_date));
				if (travel_date.compareTo(current_date) < 0) {
					m.addAttribute("date_error", " Invalid DATE. Travel Date must be after current date.");
					return "ticketForm";
				}

				// creating ticket object
				ticket = new Ticket(travel_date, td.findTrain(src, dest));

				nop = Integer.parseInt(request.getParameter("no_of_persons"));
				for (int i = 1; i <= nop; i++) {
//					System.out.println(request.getParameter("name" + i));
					String passenger_name = request.getParameter("name" + i);

					long adharNumber = Long.parseLong(request.getParameter("adharNumber" + i));

//					System.out.println(request.getParameter("age" + i));
					int age = Integer.parseInt(request.getParameter("age" + i));

//					System.out.println(request.getParameter("gender" + i));
					String gender = request.getParameter("gender" + i);

					ticket.addPassenger(passenger_name, adharNumber, age, gender);
//					System.out.println(i);
				}

			} catch (ParseException e) {
				// TODO Auto-generated catch block`
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		m.addAttribute("success_msg", "Ticket Booked Successfully.");

		String pnr = ticket.generatePNR();
		int train_no = train.getTrain_no();
		String train_name = train.getTrain_name();

//		String src = train.getSource_place();
//		String dest = train.getDestination_place();
		String travel_date = ticket.getTravel_date();
		// nop number of person

		m.addAttribute("passenger", ticket.getPassengers());

		double totalTicketPrice = ticket.calculateTotalprice();

		String ticketClass = request.getParameter("classes");

		m.addAttribute("pnr", pnr);
		m.addAttribute("train_no", train_no);
		m.addAttribute("train_name", train_name);
		m.addAttribute("src", src);
		m.addAttribute("dest", dest);
		m.addAttribute("travel_date", travel_date);
		m.addAttribute("ticket_class", ticketClass);
		m.addAttribute("num_of_passengers", nop);
		m.addAttribute("totalTicketPrice", totalTicketPrice);
		return "ticket";
	}

}
