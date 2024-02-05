package com.skilldistillery.witcheroldworld.data;

import org.springframework.stereotype.Service;

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
		managedMonster.setHealth(monster.getHealth());
		managedMonster.setDamage(monster.getDamage());
		managedMonster.setExperienceReward(monster.getExperienceReward());

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

}
