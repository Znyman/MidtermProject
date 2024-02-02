package com.skilldistillery.witcheroldworld.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class WeaponTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Weapon weapon;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("WitcherOldWorld");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		weapon = em.find(Weapon.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		weapon = null;
	}

	@Test
	void test_Weapon_entity_mapping() {
		assertNotNull(weapon);
		assertNotNull(weapon.getName());
		assertEquals("silver sword", weapon.getName());
	}

}
