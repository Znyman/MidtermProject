package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.witcheroldworld.data.PlayerDAO;
import com.skilldistillery.witcheroldworld.entities.Player;
import com.skilldistillery.witcheroldworld.entities.User;

import jakarta.servlet.http.HttpSession;

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
	public String showCreatePlayerForm(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "createPlayer";
	}

	@PostMapping("createPlayer.do")
	public String createPlayer(Player player, RedirectAttributes redirectAttributes, HttpSession session) {
		User currentUser = (User) session.getAttribute("loginUser");
		player.setUser(currentUser);
		Player managedPlayer = playerDAO.createPlayer(player);
		session.setAttribute("player", managedPlayer);
		redirectAttributes.addFlashAttribute("player", managedPlayer);
		redirectAttributes.addFlashAttribute("updateMessage", "Player added successfully!");
		return "redirect:playerAdded.do";
	}

	@GetMapping("playerAdded.do")
	public String playerCreated() {
		return "redirect:intro.do";
	}

	@GetMapping("playerSession.do")
	public String setPlayerSession(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loginUser");
		Player currentPlayer = playerDAO.findByUserId(currentUser.getId());

		if (currentPlayer != null) {
			model.addAttribute("player", currentPlayer);
			session.setAttribute("player", currentPlayer);
		}
		return "account";
	}

	@GetMapping("showPlayer.do")
	public String showPlayer(Model model, HttpSession session) {
		model.addAttribute("player", session.getAttribute("player"));
		return "showPlayer";
	}

	@PostMapping("updatePlayer.do")
	public String updatePlayer(Player player, Model model, HttpSession session) {
		Player managedPlayer = playerDAO.updatePlayer(player);
		session.setAttribute("player", managedPlayer);
		model.addAttribute("player", managedPlayer);
		model.addAttribute("updateMessage", "Your player has been updated successfully.");
		return "showPlayer";
	}

	@PostMapping("deletePlayer.do")
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
	public String startGame() {
		return "introduction";
	}
}