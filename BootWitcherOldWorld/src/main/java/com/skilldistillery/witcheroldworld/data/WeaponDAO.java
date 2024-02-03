package com.skilldistillery.witcheroldworld.data;

import java.util.List;

import com.skilldistillery.witcheroldworld.entities.Weapon;

public interface WeaponDAO {

	Weapon findById(int id);
	Weapon createWeapon(Weapon weapon);
	Weapon updateWeapon(Weapon weapon);
	boolean deleteWeapon(int id);
	List<Weapon> findAll(int playerId);
	
}
