package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.witcheroldworld.data.MonsterDAO;
import com.skilldistillery.witcheroldworld.data.PlayerDAO;
import com.skilldistillery.witcheroldworld.data.WeaponDAO;
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
	
	@PostMapping("witcherAttack.do")
	public String witcherAttack(@RequestParam("weaponId") int weaponId, HttpSession session, Model model) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Weapon currentWeapon = weaponDAO.findById(weaponId);
		Monster currentMonster = (Monster) session.getAttribute("monster");
		currentMonster.setHealth(currentMonster.getHealth() - currentWeapon.getDamage());
		currentMonster = monsterDAO.updateMonster(currentMonster);
		session.setAttribute("monster", currentMonster);
		model.addAttribute("monster", currentMonster);
		
		if (currentMonster.getHealth() <= 0) {
			monsterDAO.deleteMonster(currentPlayer.getMonster().getId());
			currentPlayer.setMonster(null);
			session.removeAttribute("monster");
			currentPlayer.setExperienceLevel(currentPlayer.getExperienceLevel() + 1);
			return "monsterDefeated";
		}
		
		return "redirect:monsterAttack.do";
	}
	
	@GetMapping("monsterAttack.do")
	public String monsterAttack() {
		
		
		return "showMonster";
	}

}
