package com.skilldistillery.crescendo.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.AlbumComment;
import com.skilldistillery.crescendo.entities.Blog;
import com.skilldistillery.crescendo.entities.BlogComment;
import com.skilldistillery.crescendo.entities.Genre;
import com.skilldistillery.crescendo.entities.Topic;
import com.skilldistillery.crescendo.entities.TopicComment;

@SpringBootTest
class UserDAOImplTest {
	@Autowired
	private UserDAOImpl dao;
	private List<Topic> threads;
	
	
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
			
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}
	
	@BeforeEach
	void setUp() throws Exception {
		threads = new ArrayList<Topic>();
	}

	@AfterEach
	void tearDown() throws Exception {
		threads = null;
	}

	
	@Test
	@DisplayName("search by keyword")
	void searchByKeyword() {
		threads = dao.getTopicsByKeyword("A");
		assertNotNull(threads);
		assertEquals(5, threads.size());
		
		
	}
	
	@Test
	@DisplayName("search by keyword")
	void searchByUser() {
		threads = dao.getTopicsByUser("pr");
		assertNotNull(threads);
		assertEquals(0, threads.size());
		
		
	}
	
	@Test
	@DisplayName("search blogs by keyword")
	void searchBlogsByKeyword() {
		List<Blog> blogs = dao.getBlogsByKeyword("lor");
		assertNotNull(blogs);
		assertTrue(blogs.size() > 0);
		
		
	}
	
	@Test
	@DisplayName("search blogs by username")
	void searchBlogsByUsername() {
		List<Blog> blogs = dao.getBlogsByUser("b_");
		assertNotNull(blogs);
		assertEquals(4, blogs.size());
		
		
	}
	
	@Test
	@DisplayName("search Topic Comment by keyword")
	void searchTopicCommentsByKeyword() {
		List<TopicComment> topicComments = dao.getTopicCommentsByKeyword("ab");
		assertNotNull(topicComments);
		assertEquals(11, topicComments.size());
		
		
	}
	
	@Test
	@DisplayName("search blogs by username")
	void searchTopicCommentsByUsername() {
		List<TopicComment> topicComments = dao.getTopicCommentsByUser("zap");
		assertNotNull(topicComments);
		assertEquals(4, topicComments.size());
		
		
	}
	
	@Test
	@DisplayName("search Album Comment by keyword")
	void searchAlbumCommentsByKeyword() {
		List<AlbumComment> albumComments = dao.getAlbumCommentsByKeyword("co");
		assertNotNull(albumComments);
		assertTrue(albumComments.size() > 0);
		
		
	}
	@Test
	@DisplayName("search Album Comment by username")
	void searchAlbumCommentsByUsername() {
		List<AlbumComment> albumComments = dao.getAlbumCommentsByUser("fry");
		assertNotNull(albumComments);
		assertEquals(4, albumComments.size());
		
		
	}
	
	@Test
	@DisplayName("search Blog Comment by keyword")
	void searchBlogCommentsByKeyword() {
		List<BlogComment> blogComments = dao.getBlogCommentsByKeyword("x");
		assertNotNull(blogComments);
		assertEquals(12, blogComments.size());
		
		
	}
	
	@Test
	@DisplayName("search Blog Comment by username")
	void searchBlogCommentsByUsername() {
		List<BlogComment> blogComments = dao.getBlogCommentsByUser("rich");
		assertNotNull(blogComments);
		assertEquals(6, blogComments.size());
		
		
	}
	
	@Test
	@DisplayName("search Album Comment by keyword")
	void searchAlbumsByKeyword() {
		List<Album> album = dao.getAlbumsByKeyword("#");
		assertNotNull(album);
		assertEquals(3, album.size());
		
		
	}
	
	@Test
	@DisplayName("show Blog by id number")
	void showBlogIdNum() {
		Blog b = dao.getBlogById(1);
		assertNotNull(b);
		assertEquals("BLOGS SUCK", b.getTitle());
	}
	
	@Test
	@DisplayName("show Genre byid number")
	void showGenreIdNum() {
		Genre g = dao.getGenreById(1);
		assertNotNull(g);
		assertEquals(g.getName(), "NEO-CLASSICAL POST-METAL");
		
	}

}
