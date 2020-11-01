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

class ThreadCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ThreadComment tcomment;

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
		tcomment = em.find(ThreadComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		tcomment = null;
		em = null;
	}

	@Test
	@DisplayName("testing thread comment entity")
	void threadEntity() {
		assertNotNull(tcomment);
		assertEquals("OH GODS WHY", tcomment.getBody());
	}

	@Test
	@DisplayName("testing thread comment to thread entity")
	void threadToComment() {
		assertNotNull(tcomment);
		assertEquals("RANDOM DISCUSSION THREAD", tcomment.getThread().getTitle());
	}

	@Test
	@DisplayName("testing thread comment to user entity")
	void threadToUser() {
		assertNotNull(tcomment);
//		assertEquals("TEX", tcomment.getUser().getFirstName());
		assertEquals("A DUMMY USER RECORD", tcomment.getUser().getBody());
	}

}
