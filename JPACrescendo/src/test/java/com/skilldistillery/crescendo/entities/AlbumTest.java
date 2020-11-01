package com.skilldistillery.crescendo.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class AlbumTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Album album;

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
		album = em.find(Album.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		album = null;
		em = null;
	}

	@Test
	@DisplayName("testing album entity")
	void albumEntity() {
		assertNotNull(album);
		assertEquals("THE #FFFFFF ALBUM", album.getTitle());
		assertEquals("NOT WORTH LISTENING", album.getDescription());
		assertEquals(2019, album.getReleaseYear());
	}

	@Test
	@DisplayName("testing album to genre")
	void albumToGenre() {
		assertNotNull(album);
		assertEquals("NEO-CLASSICAL POST-METAL", album.getGenres().get(0).getName());
	}

	@Test
	@DisplayName("testing album to album comments")
	void albumToAlbumComments() {
		assertNotNull(album);
		assertEquals("I LIKE THIS ALBUM", album.getAlbumComments().get(0).getBody());
	}

}
