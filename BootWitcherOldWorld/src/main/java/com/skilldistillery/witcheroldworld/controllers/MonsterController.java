package com.skilldistillery.witcheroldworld.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.witcheroldworld.data.MonsterDAO;
import com.skilldistillery.witcheroldworld.entities.Armor;
import com.skilldistillery.witcheroldworld.entities.Location;
import com.skilldistillery.witcheroldworld.entities.Monster;
import com.skilldistillery.witcheroldworld.entities.Player;
import com.skilldistillery.witcheroldworld.entities.Weapon;

import jakarta.servlet.http.HttpSession;

@Controller
public class MonsterController {
	
	@Autowired
	private MonsterDAO monsterDAO;
	
	@GetMapping("showMonster.do")
	public String showMonster(HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Location currentLocation = currentPlayer.getLocation();
		List<Weapon> weapons = currentPlayer.getWeapons();
		List<Armor> armors = currentPlayer.getArmors();
		
		List<Location> newLocations = new ArrayList<>();
		newLocations.add(currentLocation);
		
		Monster monster = new Monster();
		Monster monsterToCopy = monsterDAO.findById(currentLocation.getId());
		monster.setDamage(monsterToCopy.getDamage());
		monster.setDescription(monsterToCopy.getDescription());
		monster.setExperienceReward(monsterToCopy.getExperienceReward());
		monster.setHealth(monsterToCopy.getHealth());
		monster.setImageUrl(monsterToCopy.getImageUrl());
		monster.setLocations(newLocations);
		monster.setName(monsterToCopy.getName());
		monster.setPlayer(currentPlayer);
		monster = monsterDAO.createMonster(monster);
		
		session.setAttribute("armors", armors);
		model.addAttribute("armors", armors);
		session.setAttribute("weapons", weapons);
		model.addAttribute("weapons", weapons);
		session.setAttribute("monster", monster);
		model.addAttribute("monster", monster);
		return "showMonster";
	}
}
