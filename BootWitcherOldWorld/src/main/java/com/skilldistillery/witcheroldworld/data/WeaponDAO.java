package com.skilldistillery.witcheroldworld.data;

import java.util.List;

import com.skilldistillery.witcheroldworld.entities.Weapon;

public interface WeaponDAO {

	Weapon createWeapon(Weapon weapon);
	Weapon updateWeapon(Weapon weapon);
	boolean deleteWeapon(int id);
	List<Weapon> findAll(Weapon weapon);
	
}
