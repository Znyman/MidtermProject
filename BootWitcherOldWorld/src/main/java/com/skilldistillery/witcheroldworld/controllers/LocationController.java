package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.skilldistillery.witcheroldworld.data.LocationDAO;
import com.skilldistillery.witcheroldworld.entities.Location;
import com.skilldistillery.witcheroldworld.entities.Player;

import jakarta.servlet.http.HttpSession;

public class LocationController {

    @Autowired
    private LocationDAO locationDao;

	
    @GetMapping("playGame.do")
    public String startGame (HttpSession session, Model model) {
    	Player currentPlayer = (Player) session.getAttribute("player");
    	model.addAttribute("player", currentPlayer);
    	return "kaerSeren";
    }
    
}
