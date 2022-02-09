package com.example.TrainTicketBookingWebApp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.TrainTicketBookingWebApp.model.Train;
import com.example.TrainTicketBookingWebApp.model.User;
import com.example.TrainTicketBookingWebApp.repository.TrainRepository;

@Service
public class TrainService {

	@Autowired
	TrainRepository trainRepository;

	public List<Train> getAllTrains() {
		return trainRepository.findAll();

	}

	public void saveTrain(Train train) {

		trainRepository.save(train);

	}
	
	public void deleteTrain(int trainId) {
		trainRepository.deleteById(trainId);

	}
}
