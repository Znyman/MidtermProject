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
	public String addWeaponToDAO(Weapon weapon, HttpSession session, RedirectAttributes redirectAttributes) {
		Player currentPlayer = (Player) session.getAttribute("player");
		weapon.setPlayer(currentPlayer);
		Weapon managedWeapon = weaponDAO.createWeapon(weapon);
		currentPlayer.addWeapon(managedWeapon);
		session.setAttribute("player", currentPlayer);
		redirectAttributes.addFlashAttribute("weapon", managedWeapon);
		redirectAttributes.addFlashAttribute("updateMessage", "Weapon added successfully!");
		return "redirect:weaponAdded.do";
	}

	@GetMapping("weaponAdded.do")
	public String weaponCreated() {

		return "redirect:subtractExperience.do";
	}

	@GetMapping("getWeapon.do")
	public String getWeapon(@RequestParam("id") int id, Model model) {
		Weapon managedWeapon = weaponDAO.findById(id);
		model.addAttribute("weapon", managedWeapon);
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
	public String deleteWeapon(@RequestParam("id") int id, Model model, HttpSession session) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Weapon weapon = weaponDAO.findById(id);
		currentPlayer.removeWeapon(weapon);

		boolean isDeleted = weaponDAO.deleteWeapon(id);
		session.setAttribute("player", currentPlayer);
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
	public String addArmorToDAO(Armor armor, HttpSession session, RedirectAttributes redirectAttributes) {
		Player currentPlayer = (Player) session.getAttribute("player");
		armor.setPlayer(currentPlayer);
		Armor managedArmor = armorDAO.createArmor(armor);
		currentPlayer.addArmor(managedArmor);
		session.setAttribute("player", currentPlayer);
		redirectAttributes.addFlashAttribute("armor", managedArmor);
		redirectAttributes.addFlashAttribute("updateMessage", "Armor added successfully!");
		return "redirect:armorAdded.do";
	}

	@GetMapping("armorAdded.do")
	public String armorCreated() {

		return "redirect:subtractExperience.do";
	}

	@GetMapping("getArmor.do")
	public String getArmor(@RequestParam("id") int id, Model model) {
		Armor managedArmor = armorDAO.findById(id);
		model.addAttribute("armor", managedArmor);
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
	public String deleteArmor(@RequestParam("id") int id, Model model, HttpSession session) {
		Player currentPlayer = (Player) session.getAttribute("player");
		Armor armor = armorDAO.findById(id);
		currentPlayer.removeArmor(armor);

		boolean isDeleted = armorDAO.deleteArmor(id);
		session.setAttribute("player", currentPlayer);
		if (isDeleted) {
			model.addAttribute("updateMessage", "Armor deleted successfully!");
		} else {
			model.addAttribute("updateMessage", "Armor not found!");
		}
		return "showArmor";
	}

}