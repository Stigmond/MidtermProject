package com.skilldistillery.crescendo.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ThreadTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Thread thread;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("SocialApp");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf = null;
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		thread = em.find(Thread.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		thread = null;
		em = null;
	}

	@Test
	@DisplayName("testing thread entity")
	void threadEntity() {
		assertNotNull(thread);
		assertEquals("RANDOM DISCUSSION THREAD", thread.getTitle());

	}

	@Test
	@DisplayName("testing thread creation time stamp")
	void threadTime() {

		Thread newThread = new Thread();

		newThread.setTitle("title");
		newThread.setCreatorId(1);

		em.getTransaction().begin();
		em.persist(newThread);
		em.flush();

		em.getTransaction().commit();

		assertNotNull(newThread.getCreatedAt());

	}

}
