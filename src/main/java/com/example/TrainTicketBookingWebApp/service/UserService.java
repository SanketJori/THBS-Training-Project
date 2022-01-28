package com.example.TrainTicketBookingWebApp.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import com.example.TrainTicketBookingWebApp.model.User;
import com.example.TrainTicketBookingWebApp.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	
	public void saveUser(User user) {

		userRepository.save(user);

	}

	public Optional<User> getUser(String email, String password) {
		return userRepository.findByEmailAndPassword(email, password);
	}

}
