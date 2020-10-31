package com.skilldistillery.crescendo.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
		em = null;
	}

	@Test
	void testBindings() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("TEX", user.getFirstName());
	}
	
	@Test
	void oneToMany() {
		assertNotNull(user);
		assertEquals(1, user.getBlogs().size());
	}

	@Test
	void listOfTradesOneToMany() {
		assertNotNull(user);
		assertEquals(1, user.getTrades().size());
		
	}
	
	@Test
	void listOfThreadOneToMany() {
		assertNotNull(user);
		assertEquals(1, user.getThreads().size());
	}
	@Test
	void listOfBlogCommentsOTM() {
		assertNotNull(user);
		assertTrue(user.getBlogComments().size() > 0);
	}
	@Test
	void  userToAlbumComments() {
		assertNotNull(user);
		assertEquals("I LIKE THIS ALBUM", user.getAlbumComments().get(0).getBody());
		assertTrue(user.getAlbumComments().size() > 0);
	}
	
	
	
}
