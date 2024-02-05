package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.witcheroldworld.data.LocationDAO;
import com.skilldistillery.witcheroldworld.entities.Location;
import com.skilldistillery.witcheroldworld.entities.Player;

import jakarta.servlet.http.HttpSession;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO locationDao;

	@GetMapping("playGame.do")
	public String startGame(HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Location currentLocation = currentPlayer.getLocation();
		if (currentLocation == null) {
			currentLocation = locationDao.findById(1);
			currentPlayer.setLocation(currentLocation);
			model.addAttribute("player", currentPlayer);
			model.addAttribute("location", currentLocation);
			return "redirect:updatePlayerLocation.do";
		}
		return currentLocation.getName();
	}

	
	
}
