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

class BlogCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private BlogComment bComment;

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
		bComment = em.find(BlogComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		bComment = null;
		em = null;
	}

	@Test
	@DisplayName("testing blog entity")
	void blogEntity() {
		assertNotNull(bComment);
		assertEquals("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur est quam, sollicitudin non consectetur eu, iaculis id leo. Phasellus sed arcu nibh. Praesent sed est tortor. Morbi sodales nisi nec leo commodo, ac fringilla nisi varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.", bComment.getBody());
		

	}
	
	@Test
	@DisplayName("testing blog comment")
	void blogComment() {
		assertNotNull(bComment);
		assertEquals("TEX", bComment.getUser().getFirstName());
		
	}

}
