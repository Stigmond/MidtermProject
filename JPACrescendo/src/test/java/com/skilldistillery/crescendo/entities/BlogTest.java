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
		assertNotNull(blog.getTitle());
		assertNotNull(blog.getBody());
		assertEquals(0, blog.getEdited());

	}

	@Test
	@DisplayName("testing blog creation time stamp")
	void blogTime() {

		Blog newBlog = new Blog();

		newBlog.setBody("Body");
		newBlog.setHeaderMediaUrl("test");
		newBlog.setTitle("The blog");
		newBlog.setUser(em.find(User.class, 1));
		em.getTransaction().begin();
		em.persist(newBlog);
		em.flush();

		em.getTransaction().commit();

		

		assertNotNull(newBlog.getCreatedAt());

	}
	
	@Test
	@DisplayName("testing mapping to user table")
	void utMapping() {
		
		assertNotNull(blog);
//		assertEquals("admin", blog.getUser());
		
	}
	
	@Test
	@DisplayName("testing blog to genre mapping")
	void blogToGenre() {
		assertNotNull(blog);
		assertNotNull(blog.getGenres());
		assertTrue(blog.getGenres().size() > 0);
		assertEquals("NEO-CLASSICAL POST-METAL", blog.getGenres().get(0).getName());	
	}
	
	@Test
	@DisplayName("testing blog to blog commment")
	void blogCommentToComment() {
		
		assertNotNull(blog);
		assertEquals(2, blog.getBlogComments().size());
	}
	

}




