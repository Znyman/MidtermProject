package com.skilldistillery.witcheroldworld.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.witcheroldworld.entities.Location;
import com.skilldistillery.witcheroldworld.entities.Monster;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class MonsterDAOImpl implements MonsterDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Monster findById(int id) {
		Monster monster = em.find(Monster.class, id);
		return monster;
	}

	@Override
	public Monster updateMonster(Monster monster) {
		Monster managedMonster = em.find(Monster.class, monster.getId());
		managedMonster.setName(monster.getName());
		managedMonster.setDescription(monster.getDescription());
		managedMonster.setHealth(monster.getHealth());
		managedMonster.setDamage(monster.getDamage());
		managedMonster.setExperienceReward(monster.getExperienceReward());
		managedMonster.setLocations(monster.getLocations());

		return managedMonster;
	}

	@Override
	public boolean deleteMonster(int id) {
		Monster managedMonster = em.find(Monster.class, id);
		if (managedMonster.getHealth() > 0) {
			return false;
		}
		em.remove(managedMonster);
		return true;
	}

	@Override
	public Monster createMonster(Monster monster) {
		em.persist(monster);
		return monster;
	}

	@Override
	public boolean deleteMonsterByPlayerId(int playerId) {
		String jpql = "SELECT m FROM Monster m WHERE m.player.id = :pId AND m.id > 19";
		List<Monster> monsters = em.createQuery(jpql, Monster.class).
				setParameter("pId", playerId).getResultList();
		for (Monster monster : monsters) {
			if (monster.getLocations() != null) {
				List<Location> locations = new ArrayList<>(monster.getLocations());
				for (Location location : locations) {
					monster.removeLocation(location);
				} 
			}
			em.flush();
			em.remove(monster);
		}
		if (monsters.size() > 0) {
			return true;
		}
		return false;
	}

}
