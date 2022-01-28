package com.example.TrainTicketBookingWebApp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String homepage(Model m) {
		
		return "index";
		
	}
	
	@RequestMapping("/userLogin")
	public String userLogin() {
		return "userLoginForm";
	}
		
	@RequestMapping("/userRegister")
	public String userRegister() {
		
		return "userRegisterForm";
	}
	
	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "adminLoginForm";
	}
	
	@RequestMapping("/adminPannel")
	public String adminPannel() {
		return "adminPannel";
	}
	
	@RequestMapping("/ticketForm")
	public String ticketForm(){
		
		return "ticketForm";
	}
	
	

}
