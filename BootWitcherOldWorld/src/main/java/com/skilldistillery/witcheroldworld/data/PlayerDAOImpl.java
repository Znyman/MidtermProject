package com.skilldistillery.witcheroldworld.data;

import java.util.List;

import org.springframework.stereotype.Service;


import com.skilldistillery.witcheroldworld.entities.Player;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class PlayerDAOImpl implements PlayerDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Player findById(int id) {
		Player player = em.find(Player.class,id);
		return player;
	}

	@Override
	public Player createPlayer(Player player) {
		em.persist(player);
		return player;
	}

	@Override
	public Player updatePlayer(Player player) {
		Player managedPlayer = em.find(Player.class, player.getId());
		managedPlayer.setName(player.getName());
		managedPlayer.setDescription(player.getDescription());
		managedPlayer.setMaxHealth(player.getMaxHealth());
		managedPlayer.setExperienceLevel(player.getExperienceLevel());
			
		return managedPlayer;
	}

	@Override
	public boolean deletePlayer(int id) {
		Player managedPlayer = em.find(Player.class, id);
		if(managedPlayer == null) {
			return false;
		}
		em.remove(managedPlayer);
		return true;
	}

//	@Override
//	public List<Player> findAll(int userId) {
//		String jpql = "SELECT player FROM Player player WHERE player.userId = :userId";
//		List<Player> players = em.createQuery(jpql, Player.class).setParameter("userId", userId).getResultList();
//		return players;
//	}

	@Override
	public Player findByUserId(int userId) {
		String jpql = "SELECT player FROM Player player WHERE player.userId = :userId";
		Player player = em.createQuery(jpql, Player.class).setParameter("userId", userId).getSingleResult();
		
		return player;
	}

	
	
}
