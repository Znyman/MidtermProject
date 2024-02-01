package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.witcheroldworld.data.UserDAO;
import com.skilldistillery.witcheroldworld.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping(path = {"", "/", "home.do"})
	public String home(Model model) {
		User user = userDAO.authenticateUser("test", "test");
		model.addAttribute("testUser", user);
		return "home";
	}
	
}
