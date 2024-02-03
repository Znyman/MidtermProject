package com.skilldistillery.witcheroldworld.data;

import java.util.List;

import com.skilldistillery.witcheroldworld.entities.Armor;

public interface ArmorDAO {

	Armor createArmor(Armor armor);
	Armor updateArmor(Armor armor);
	boolean deleteArmor(int id);
	List<Armor> findAll(int playerId);
	
	
	
}
