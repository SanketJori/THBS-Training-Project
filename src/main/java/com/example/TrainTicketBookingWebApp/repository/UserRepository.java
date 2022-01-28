package com.example.TrainTicketBookingWebApp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.TrainTicketBookingWebApp.model.*;




public interface UserRepository extends JpaRepository<User, Integer> {
	
	Optional<User>findByEmailAndPassword(String email, String password);

}
