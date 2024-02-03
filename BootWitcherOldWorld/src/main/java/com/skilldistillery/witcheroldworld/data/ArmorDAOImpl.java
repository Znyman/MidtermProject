package com.skilldistillery.witcheroldworld.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.witcheroldworld.entities.Armor;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class ArmorDAOImpl implements ArmorDAO {
@PersistenceContext
private EntityManager em;
	
	@Override
	public Armor createArmor(Armor armor) {
		em.persist(armor);
		return armor;
	}

	@Override
	public Armor updateArmor(Armor armor) {
		Armor managedArmor = em.find(Armor.class, armor.getId());
		managedArmor.setDefense(armor.getDefense());
		managedArmor.setDescription(armor.getDescription());
		managedArmor.setName(armor.getName());
		managedArmor.setPlayer(armor.getPlayer());
		managedArmor.setTier(armor.getTier());	
		return managedArmor;
		
	}

	@Override
	public boolean deleteArmor(int id) {
		Armor managedArmor = em.find(Armor.class, id);
		if(managedArmor == null) {
			return false;
		}
		em.remove(managedArmor);
		return true;
	}

	@Override
	public List<Armor> findAll(int playerId) {
		String jpql = "SELECT armor FROM Armor armor WHERE player_id = :player_id";
		List<Armor> armors = em.createQuery(jpql, Armor.class).setParameter("player_id", playerId).getResultList();
		return armors;
	}

}
