package com.skilldistillery.witcheroldworld.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.witcheroldworld.data.ArmorDAO;
import com.skilldistillery.witcheroldworld.data.WeaponDAO;
import com.skilldistillery.witcheroldworld.entities.Armor;
import com.skilldistillery.witcheroldworld.entities.Player;
import com.skilldistillery.witcheroldworld.entities.Weapon;

import jakarta.servlet.http.HttpSession;

@Controller
public class InventoryController {

	@Autowired
	private WeaponDAO weaponDAO;

	@Autowired
	private ArmorDAO armorDAO;

	@GetMapping("manageInventory.do")
	public String getAllInventory(Model model, HttpSession session) {
		Player currentPlayer = (Player) session.getAttribute("player");
		model.addAttribute("player", currentPlayer);
		List<Weapon> weaponsInventory = weaponDAO.findAll(currentPlayer.getId());
		model.addAttribute("weapons", weaponsInventory);
		List<Armor> armorsInventory = armorDAO.findAll(currentPlayer.getId());
		model.addAttribute("armors", armorsInventory);
		return "manageInventory";
	}

	@GetMapping("newWeapon.do")
	public String showCreateWeaponForm(Model model) {
		return "createWeapon";
	}

	@PostMapping("newWeapon.do")
	public String addWeaponToDao(Weapon weapon, HttpSession session, RedirectAttributes redirectAttributes) {
		Player currentPlayer = (Player) session.getAttribute("player");
		weapon.setPlayer(currentPlayer);
		Weapon managedWeapon = weaponDAO.createWeapon(weapon);
		redirectAttributes.addFlashAttribute("weapon", managedWeapon);
		redirectAttributes.addFlashAttribute("updateMessage", "Weapon added successfully!");
		return "redirect:weaponAdded.do";
	}

	@GetMapping("weaponAdded.do")
	public String weaponCreated(Weapon weapon) {
		return "showWeapon";
	}

	@PostMapping("updateWeapon.do")
	public String updateWeapon(Weapon weapon, Model model) {
		Weapon managedWeapon = weaponDAO.updateWeapon(weapon);
		model.addAttribute("weapon", managedWeapon);
		model.addAttribute("updateMessage", "Your weapon has been updated successfully.");
		return "showWeapon";
	}

	@PostMapping("deleteWeapon.do")
	public String deleteWeapon(@RequestParam("id") int id, Model model) {
		boolean isDeleted = weaponDAO.deleteWeapon(id);
		if (isDeleted) {
			model.addAttribute("updateMessage", "Weapon deleted successfully!");
		} else {
			model.addAttribute("updateMessage", "Weapon not found!");
		}
		return "showWeapon";
	}

	@GetMapping("newArmor.do")
	public String showCreateArmorForm(Model model) {
		return "createArmor";
	}

	@PostMapping("newArmor.do")
	public String saveArmor(Armor armor, HttpSession session, RedirectAttributes redirectAttributes) {
		Player currentPlayer = (Player) session.getAttribute("player");
		armor.setPlayer(currentPlayer);
		Armor managedArmor = armorDAO.createArmor(armor);
		redirectAttributes.addFlashAttribute("armor", managedArmor);
		redirectAttributes.addFlashAttribute("updateMessage", "Armor added successfully!");
		return "redirect:armorAdded.do";
	}

	@GetMapping("armorAdded.do")
	public String armorCreated(Armor armor) {

		return "showArmor";
	}

	@PostMapping("updateArmor.do")
	public String updateArmor(Armor armor, Model model) {
		Armor managedArmor = armorDAO.updateArmor(armor);
		model.addAttribute("armor", managedArmor);
		model.addAttribute("updateMessage", "Armor updated successfully!");
		return "showArmor";
	}

	@PostMapping("deleteArmor.do")
	public String deleteArmor(@RequestParam("id") int id, Model model) {
		boolean isDeleted = armorDAO.deleteArmor(id);
		if (isDeleted) {
			model.addAttribute("updateMessage", "Armor deleted successfully!");
		} else {
			model.addAttribute("updateMessage", "Armor not found!");
		}
		return "showArmor";
	}
}