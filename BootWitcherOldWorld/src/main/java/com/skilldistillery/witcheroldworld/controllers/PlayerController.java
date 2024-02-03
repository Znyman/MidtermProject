package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.witcheroldworld.data.PlayerDAO;
import com.skilldistillery.witcheroldworld.entities.Player;

@Controller
public class PlayerController {

	@Autowired
	private PlayerDAO playerDAO;

//	@GetMapping("/")
//	public String getAllPlayers(Model model, int userId) {
//		List<Player> players = playerDAO.findAll(userId);
//		model.addAttribute("players", players);
//		return "managePlayers"; 
//	}

	@GetMapping("createPlayer.do")
	public String showCreatePlayerForm() {

		return "createPlayer";
	}

	@PostMapping("createPlayer.do")
	public String createPlayer(Player player, RedirectAttributes redirectAttributes) {
		Player managedPlayer = playerDAO.createPlayer(player);
		System.out.println(managedPlayer.getExperienceLevel());

		redirectAttributes.addFlashAttribute("player", managedPlayer);
		redirectAttributes.addFlashAttribute("updateMessage", "Player added successfully!");
		return "redirect:playerAdded.do";
	}

	@GetMapping("playerAdded.do")
	public String playerCreated(@ModelAttribute("player") Player player, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("player", player);

		return "redirect:intro.do";
	}

	@PostMapping("updatePlayer.do")
	public String updatePlayer(Player player, Model model) {
		Player managedPlayer = playerDAO.updatePlayer(player);
		model.addAttribute("player", managedPlayer);
		model.addAttribute("updateMessage", "Your player has been updated successfully.");
		return "showPlayer";
	}

	@GetMapping("deletePlayer.do")
	public String deletePlayer(@RequestParam("id") int id, Model model) {
		boolean isDeleted = playerDAO.deletePlayer(id);
		if (isDeleted) {
			model.addAttribute("updateMessage", "Player deleted successfully!");
		} else {
			model.addAttribute("updateMessage", "Player not found!");
		}
		return "showPlayer";
	}

	@GetMapping("intro.do")
	public String startGame(@ModelAttribute("player") Player player, Model model) {
		model.addAttribute("player", player);

		return "introduction";
	}
}
