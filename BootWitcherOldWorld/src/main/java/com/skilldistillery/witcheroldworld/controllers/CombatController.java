package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.witcheroldworld.data.MonsterDAO;
import com.skilldistillery.witcheroldworld.data.PlayerDAO;

@Controller
public class CombatController {
	
	@Autowired
	private PlayerDAO playerDAO;
	
	@Autowired
	private MonsterDAO monsterDAO;
	
	

}
