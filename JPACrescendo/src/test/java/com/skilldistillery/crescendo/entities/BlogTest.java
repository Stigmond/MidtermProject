package com.skilldistillery.crescendo.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

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

class BlogTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Blog blog;

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
		blog = em.find(Blog.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		blog = null;
		em = null;
	}

	@Test
	@DisplayName("testing blog entity")
	void blogEntity() {
		assertNotNull(blog);
		assertEquals("BLOGS SUCK", blog.getTitle());
		assertEquals("THEY REALLY DO SUCK", blog.getBody());
		assertEquals(0, blog.getEdited());

	}

	@Test
	@DisplayName("testing blog creation time stamp")
	void blogTime() {

		Blog newBlog = new Blog();

		newBlog.setBody("Body");
		newBlog.setHeaderMediaUrl("test");
		newBlog.setTitle("The blog");
		newBlog.setCreatorId(1);

		em.getTransaction().begin();
		em.persist(newBlog);
		em.flush();

		em.getTransaction().commit();


		assertNotNull(newBlog.getCreatedAt());

	}

}
