package com.example.TrainTicketBookingWebApp.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.TrainTicketBookingWebApp.model.Train;


@Repository
public interface TrainRepository extends JpaRepository<Train, Integer> {

}
