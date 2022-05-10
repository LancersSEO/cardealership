/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.left2code.CarDealership.controller;

import com.left2code.CarDealership.model.Room;
import com.left2code.CarDealership.model.Special;
import com.left2code.CarDealership.servicelayer.ServiceLayerVS;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author AC
 */
@Controller
@RequestMapping("/home")
public class HomeController {
    
    @Autowired
    ServiceLayerVS service;
    
    @GetMapping({"", "/", "/index"})
    public String index(Model model) {
        List<Room> featured = service.getFeaturedRooms();
        model.addAttribute("featured", featured);
        model.addAttribute("pageName", "Home");
        return "home/index";
    }
}
