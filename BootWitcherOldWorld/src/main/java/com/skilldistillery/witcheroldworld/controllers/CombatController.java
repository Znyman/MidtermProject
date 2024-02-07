package com.skilldistillery.witcheroldworld.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.witcheroldworld.data.LocationDAO;
import com.skilldistillery.witcheroldworld.data.MonsterDAO;
import com.skilldistillery.witcheroldworld.data.PlayerDAO;
import com.skilldistillery.witcheroldworld.data.WeaponDAO;
import com.skilldistillery.witcheroldworld.entities.Armor;
import com.skilldistillery.witcheroldworld.entities.Location;
import com.skilldistillery.witcheroldworld.entities.Monster;
import com.skilldistillery.witcheroldworld.entities.Player;
import com.skilldistillery.witcheroldworld.entities.Weapon;

import jakarta.servlet.http.HttpSession;

@Controller
public class CombatController {

	@Autowired
	private PlayerDAO playerDAO;

	@Autowired
	private MonsterDAO monsterDAO;

	@Autowired
	private WeaponDAO weaponDAO;
	
	@Autowired
	private LocationDAO locationDAO;

	@PostMapping("witcherAttack.do")
	public String witcherAttack(@RequestParam("weaponId") int weaponId, HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Weapon currentWeapon = weaponDAO.findById(weaponId);
		if (currentWeapon == null) {
			return "redirect:manageInventory.do";
		}
		Monster currentMonster = (Monster) session.getAttribute("monster");

		currentMonster.setHealth(currentMonster.getHealth() - currentWeapon.getDamage());
		currentMonster = monsterDAO.updateMonster(currentMonster);
		session.setAttribute("monster", currentMonster);
		model.addAttribute("monster", currentMonster);

		if (currentMonster.getHealth() <= 0) {
			currentPlayer.setExperienceLevel(
					currentPlayer.getExperienceLevel() + currentPlayer.getMonster().getExperienceReward());
			currentPlayer = playerDAO.updatePlayer(currentPlayer);
			session.setAttribute("player", currentPlayer);
			monsterDAO.deleteMonster(currentPlayer.getMonster().getId());
			currentPlayer.setMonster(null);
			session.removeAttribute("monster");
			return "monsterDefeated";
		}

		return "redirect:monsterAttack.do";
	}

	@GetMapping("monsterAttack.do")
	public String monsterAttack(HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Monster currentMonster = (Monster) session.getAttribute("monster");

		List<Armor> armors = currentPlayer.getArmors();
		int totalDefense = 0;
		for (Armor armor : armors) {
			totalDefense += armor.getDefense();
		}

		int damageToWitcher = currentMonster.getDamage() - totalDefense;

		if (damageToWitcher > 0) {
			currentPlayer.setCurrentHealth(currentPlayer.getCurrentHealth() - damageToWitcher);
			currentPlayer = playerDAO.updatePlayer(currentPlayer);
		}

		if (currentPlayer.getCurrentHealth() <= 0) {
			currentPlayer.setMonster(null);
			session.removeAttribute("monster");
			return "playerDefeated";
		}

		session.setAttribute("player", currentPlayer);
		model.addAttribute("player", currentPlayer);

		return "showMonster";
	}

	@PostMapping("meditate.do")
	public String meditate(HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");

		currentPlayer.setCurrentHealth(currentPlayer.getMaxHealth());
		currentPlayer = playerDAO.updatePlayer(currentPlayer);
		
		Location location = locationDAO.findById(1);
		currentPlayer.setLocation(location);
		
		model.addAttribute("location", location);
		session.setAttribute("location", location);
		session.setAttribute("player", currentPlayer);

		return "redirect:playGame.do";
	}

}
