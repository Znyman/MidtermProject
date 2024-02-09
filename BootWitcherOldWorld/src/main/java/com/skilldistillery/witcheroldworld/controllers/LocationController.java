
package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.witcheroldworld.data.LocationDAO;
import com.skilldistillery.witcheroldworld.data.MonsterDAO;
import com.skilldistillery.witcheroldworld.data.PlayerDAO;
import com.skilldistillery.witcheroldworld.entities.Location;
import com.skilldistillery.witcheroldworld.entities.Player;

import jakarta.servlet.http.HttpSession;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO locationDao;
	@Autowired
	private PlayerDAO playerDao;
	@Autowired
	private MonsterDAO monsterDao;

	@GetMapping("playGame.do")
	public String startGame(HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		if (currentPlayer != null) {
			if (currentPlayer.getMonster() != null) {
				currentPlayer.setMonster(null);
				monsterDao.deleteMonsterByPlayerId(currentPlayer.getId());
			}
			Location currentLocation = currentPlayer.getLocation();

			if (currentLocation == null) {
				currentLocation = locationDao.findById(1);
				currentPlayer.setLocation(currentLocation);
				playerDao.updatePlayer(currentPlayer);
				session.setAttribute("player", currentPlayer);
				model.addAttribute("player", currentPlayer);
				model.addAttribute("location", currentLocation);
				return "locations/kaerSeren";
			}

			session.setAttribute("location", currentLocation);
			model.addAttribute("location", currentLocation);

			switch (currentLocation.getName()) {
			case "Ard Modron":
				return "locations/ardModron";
			case "Ban Ard":
				return "locations/banArd";
			case "Beauclair":
				return "locations/beauclair";
			case "Behelt Nar":
				return "locations/beheltNar";
			case "Cidaris":
				return "locations/cidaris";
			case "Cintra":
				return "locations/cintra";
			case "Dhuwod":
				return "locations/dhuwod";
			case "Doldeth":
				return "locations/doldeth";
			case "Glenmore":
				return "locations/glenmore";
			case "Gorthur Guaed":
				return "locations/gorthurGuaed";
			case "Haern Caduch":
				return "locations/haernCaduch";
			case "Hengfors":
				return "locations/hengfors";
			case "Kaer Morhen":
				return "locations/kaerMorhen";
			case "Kaer Seren":
				return "locations/kaerSeren";
			case "Loc Ichaer":
				return "locations/locIchaer";
			case "Novigrad":
				return "locations/novigrad";
			case "Stygga":
				return "locations/stygga";
			case "Vengerberg":
				return "locations/vengerberg";
			case "Vizima":
				return "locations/vizima";
			default:
				return "locations/kaerSeren";
			}
		} else {
			return "home";
		}
	}

	@GetMapping("changeLocation.do")
	public String changeLocation(@RequestParam("locationId") int locationId, HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Location updatedLocation = locationDao.findById(locationId);
		currentPlayer.setLocation(updatedLocation);
		playerDao.updatePlayer(currentPlayer);
		session.setAttribute("player", currentPlayer);
		session.setAttribute("location", updatedLocation);
		return "redirect:playGame.do";
	}

}