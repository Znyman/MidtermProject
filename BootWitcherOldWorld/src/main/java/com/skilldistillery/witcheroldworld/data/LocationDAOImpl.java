package com.skilldistillery.witcheroldworld.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.witcheroldworld.entities.Location;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class LocationDAOImpl implements LocationDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Location findById(int locationId) {
		return em.find(Location.class, locationId);
	}
}
