package com.example.TrainTicketBookingWebApp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.TrainTicketBookingWebApp.model.Train;
import com.example.TrainTicketBookingWebApp.service.TrainService;

@Controller
public class TrainController {

	@Autowired
	TrainService trainService;

	@PostMapping("/processAdminLoginForm")
	public String processAdminLoginForm(HttpServletRequest request, Model m) {
		String aname = request.getParameter("admin_name");
		String apassword = request.getParameter("admin_password");

		System.out.println(aname + " " + apassword);

		if (aname != null) {
			m.addAttribute("admin", aname);
			return "adminPannel";

		} else {

			m.addAttribute("admin_error", "Invalid Admin Name and Password");

			return "adminLoginForm";

		}

	}
	
	@RequestMapping("/showTrains")
	public String showTrains(Model m) {
		List<Train> train = trainService.getAllTrains();
		System.out.println("train : "+train);
		m.addAttribute("listTrains", train);
		return "adminPannel"; 
	}
	
	@PostMapping("/saveTrain")
	public String saveTrain(Train train,Model m) {
		
		trainService.saveTrain(train);
		
		return "adminPannel";
	}
	
	@RequestMapping("/deleteTrain")
	public String deleteTrain(int trainId) {
		
		trainService.deleteTrain(trainId);
		return "adminpannel";
	}
	
	

	
}
