package com.skilldistillery.witcheroldworld.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.witcheroldworld.entities.Weapon;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class WeaponDAOImpl implements WeaponDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Weapon createWeapon(Weapon weapon) {
		em.persist(weapon);
		return weapon;
	}

	@Override
	public Weapon updateWeapon(Weapon weapon) {
		Weapon managedWeapon = em.find(Weapon.class, weapon.getId());
		managedWeapon.setDamage(weapon.getDamage());
		managedWeapon.setDescription(weapon.getDescription());
		managedWeapon.setName(weapon.getName());
		managedWeapon.setPlayer(weapon.getPlayer());
		managedWeapon.setTier(weapon.getTier());	
		return managedWeapon;
	}

	@Override
	public boolean deleteWeapon(int id) {
		Weapon managedWeapon = em.find(Weapon.class, id);
		if(managedWeapon == null) {
			return false;
		} 
		em.remove(managedWeapon);
		return true;
	}

	@Override
	public List<Weapon> findAll(int playerId) {
		String jpql = "SELECT weapon FROM Weapon weapon WHERE player_id = :player_id";
		List<Weapon> weapons = em.createQuery(jpql, Weapon.class).setParameter("player_id", playerId).getResultList();
		return weapons;
	}

	@Override
	public Weapon findById(int id) {
		Weapon weapon = em.find(Weapon.class, id);
		return weapon;
	}

}
