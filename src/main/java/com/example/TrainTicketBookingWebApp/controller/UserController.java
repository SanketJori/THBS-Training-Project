package com.example.TrainTicketBookingWebApp.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.TrainTicketBookingWebApp.model.User;
import com.example.TrainTicketBookingWebApp.repository.UserRepository;
import com.example.TrainTicketBookingWebApp.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@PostMapping("/userRegister")
	public String registerUser(User user, Model m) {
		Optional<User> optional = userService.getUserEmail(user.getEmail());

		if (optional.isEmpty()) {
			userService.saveUser(user);
			m.addAttribute("succsess_Register", "New user Registered Successfully");
			return "userLoginForm";
		}

		m.addAttribute("error_register", "User with given E-mail already exists.");
		return "userRegisterForm";

	}

	@PostMapping("/processUserLoginForm")
	public String processLoginForm(String email, String password, Model m) {

		System.out.println(email + password);

		Optional<User> optonal = userService.getUser(email, password);

		if (optonal.isEmpty()) {
			m.addAttribute("login_error", "Invalid username or password");
			return "userLoginForm";
		} else {

			return "ticketForm";
		}

	}

}
