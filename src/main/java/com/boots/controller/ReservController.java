package com.boots.controller;

import com.boots.entity.Reserv;
import com.boots.repository.ReservRepository;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ReservController {
    @Autowired
    private ReservRepository reservRepository;
    @Autowired
    private UserService userService;
    int value=0;

    @GetMapping("/")
    public String indexR(Model model){

        model.addAttribute("allUsers", userService.allUsers());

        return "index";
    }

@GetMapping("/test")
public String test(@RequestParam String usrname, Model model){


        Iterable<Reserv> reserves = reservRepository.findByUsrname(usrname);
        model.addAttribute("reserves", reserves);
        value+=1;
        return "index";


}
    @PostMapping("/ad")
    public String indexAdd(@RequestParam String name, @RequestParam String author,@RequestParam String usrname, Model model){

        Reserv reservs = new Reserv(name, author, usrname);
        reservRepository.save(reservs);
        return "redirect:/";
    }

    @PostMapping("/add")
    public String addBook(@RequestParam(required = true, defaultValue = "" ) String name,
                              @RequestParam(required = true, defaultValue = "" ) String author, @RequestParam String usrname,
                              Model model) {

            Reserv reserv = new Reserv(name, author, usrname);
            reservRepository.save(reserv);

        return "redirect:/";
    }
    @PostMapping("/{id}/remove")
    public String deleteData(@PathVariable(value = "id") Long id, Model model) {

       Reserv reservs = reservRepository.findById(id).orElseThrow();
       reservRepository.delete(reservs);


        return "redirect:/";
    }

}
