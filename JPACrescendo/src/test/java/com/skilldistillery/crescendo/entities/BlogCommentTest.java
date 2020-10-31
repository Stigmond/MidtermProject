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
		assertEquals("THIS IS A BLOG COMMENT", bComment.getBody());
		

	}

//	@Test
//	@DisplayName("testing blog creation time stamp")
//	void blogTime() {
//
//		Blog newBlog = new Blog();
//
//		newBlog.setBody("Body");
//		newBlog.setHeaderMediaUrl("test");
//		newBlog.setTitle("The blog");
//		newBlog.setCreatorId(1);
//
//		em.getTransaction().begin();
//		em.persist(newBlog);
//		em.flush();
//
//		em.getTransaction().commit();
//
//
//		assertNotNull(newBlog.getCreatedAt());
//
//	}

}
