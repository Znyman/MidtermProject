package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.witcheroldworld.data.UserDAO;
import com.skilldistillery.witcheroldworld.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping(path = {"", "/", "home.do"})
	public String home() {
		return "home";
	}
	
	@GetMapping(path = "login.do")
	public String loginGet(HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			return "account";
		}
		return "home";
	}
	
	@PostMapping(path = "login.do")
	public String loginPost(User user, HttpSession session) {
		User loginUser = userDAO.authenticateUser(user.getUsername(), user.getPassword());
		if (loginUser != null && user != null) {
			if (loginUser.getUsername().equals(user.getUsername())) {
				if (loginUser.getPassword().equals(user.getPassword())) {
					session.setAttribute("loginUser", loginUser);
					return "account";
				}
			}
		}
		return "home";
	}
	
	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "home";
	}
	
	@PostMapping(path = "createAccount.do")
	public String createUser(User user, RedirectAttributes redirect) {
		User managedUser = userDAO.create(user);
		redirect.addFlashAttribute("loginUser", managedUser);
		return "redirect:userCreated.do";
	}
	
	@GetMapping(path = "userCreated.do")
	public String userCreated(User user) {
		return "account";
	}
	
	@GetMapping(path = "account.do")
	public String goToAccountPage() {
		return "account";
	}
	
}
