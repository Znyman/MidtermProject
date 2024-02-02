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

class PlayerTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Player Player;

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
		Player = em.find(Player.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		Player = null;
	}

	@Test
	void test_Player_entity_mapping() {
		assertNotNull(Player);
		assertNotNull(Player.getName());
		assertEquals("Isabella", Player.getName());
	}

}
