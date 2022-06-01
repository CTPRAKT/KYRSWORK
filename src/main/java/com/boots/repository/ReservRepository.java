package com.boots.repository;

import com.boots.entity.Reserv;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface ReservRepository extends CrudRepository<Reserv, Long> {
    List<Reserv> findByUsrname(String usrname);

}
