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

class MonsterTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Monster monster;

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
		monster = em.find(Monster.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		monster = null;
	}

	@Test
	void test_Monster_entity_mapping() {
		assertNotNull(monster);
		assertEquals("Ekimmara", monster.getName());
		assertEquals(7, monster.getDamage());
		assertEquals(12, monster.getHealth());
	}

}
