package com.skilldistillery.witcheroldworld.data;

import com.skilldistillery.witcheroldworld.entities.Monster;

public interface MonsterDAO {

	Monster findById(int id);
	Monster updateMonster(Monster monster);
	boolean deleteMonster(int id);
	
	
}
