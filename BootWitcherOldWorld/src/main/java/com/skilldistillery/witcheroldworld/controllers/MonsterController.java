package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.witcheroldworld.data.MonsterDAO;
import com.skilldistillery.witcheroldworld.entities.Location;
import com.skilldistillery.witcheroldworld.entities.Monster;
import com.skilldistillery.witcheroldworld.entities.Player;

import jakarta.servlet.http.HttpSession;

@Controller
public class MonsterController {
	
	@Autowired
	private MonsterDAO monsterDAO;
	
	@GetMapping("showMonster.do")
	public String showMonster(HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Location currentLocation = currentPlayer.getLocation();
		Monster monster;
		switch (currentLocation.getName()) {
		case "Kaer Seren":
			monster = monsterDAO.findById(currentLocation.getId());
		case "Hengfors":
			monster = monsterDAO.findById(currentLocation.getId());
		case "Cidaris":
			monster = monsterDAO.findById(currentLocation.getId());
		case "Cintra":
			monster = monsterDAO.findById(currentLocation.getId());
		case "Novigrad":
			monster = monsterDAO.findById(currentLocation.getId());
		default:
			monster = monsterDAO.findById(currentLocation.getId());
		}
		model.addAttribute("monster", monster);
		return "showMonster";
	}
}
