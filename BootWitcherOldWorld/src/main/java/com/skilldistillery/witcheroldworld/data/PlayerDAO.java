package com.skilldistillery.witcheroldworld.data;

import java.util.List;

import com.skilldistillery.witcheroldworld.entities.Player;

public interface PlayerDAO {

	Player findById(int id);
	Player createPlayer(Player player);
	Player updatePlayer(Player player);
	boolean deletePlayer(int id);
//	List<Player> findAll(int userId);
	Player findByUserId(int userId);
	
}
