package com.skilldistillery.crescendo.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class GenreTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Genre genre;

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
		genre = em.find(Genre.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		genre = null;
		em = null;
	}

	@Test
	@DisplayName("testing artist entity")
	void artistEntity() {
		assertNotNull(genre);
		assertEquals("NEO-CLASSICAL POST-METAL", genre.getName());
	}
	@Test
	@DisplayName("Genre to blog")
	void genreToBlog() {
		assertNotNull(genre);
		assertTrue(genre.getBlogs().size() > 0);
		assertEquals("BLOGS SUCK", genre.getBlogs().get(0).getTitle());
	}
	@Test
	@DisplayName("Genre to Thread Mapping")
	void threadToGenre() {
		assertNotNull(genre);
		assertTrue(genre.getThreads().size() > 0);
		assertEquals("RANDOM DISCUSSION THREAD", genre.getThreads().get(0).getTitle());
	}
	
}
