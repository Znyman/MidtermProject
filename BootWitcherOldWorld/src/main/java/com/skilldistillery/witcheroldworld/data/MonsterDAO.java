package com.skilldistillery.witcheroldworld.data;

import com.skilldistillery.witcheroldworld.entities.Monster;

public interface MonsterDAO {

	Monster findById(int id);
	Monster updateMonster(Monster monster);
	Monster createMonster(Monster monster);
	boolean deleteMonster(int id);
	
	
}
