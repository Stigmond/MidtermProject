package com.skilldistillery.crescendo.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.AlbumComment;
import com.skilldistillery.crescendo.entities.Blog;
import com.skilldistillery.crescendo.entities.BlogComment;
import com.skilldistillery.crescendo.entities.Topic;
import com.skilldistillery.crescendo.entities.TopicComment;
import com.skilldistillery.crescendo.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User getTestUser() {
		return em.find(User.class, 1);
	}

	@Override
	public User getUser(int id) {
		return em.find(User.class, id);
	}

	@Override
	public User createUser(User user) {

		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public User updateUser(User user) {
		User dbuser = em.find(User.class, user.getId());
		User newuser = user;

		dbuser.setAvatarUrl(newuser.getAvatarUrl());
		dbuser.setFirstName(newuser.getFirstName());
		dbuser.setLastName(newuser.getLastName());
		dbuser.setUsername(newuser.getUsername());
		dbuser.setPassword(newuser.getPassword());
		dbuser.setBody(newuser.getBody());

		em.flush();
		return dbuser;
	}

	public List<Album> getAlbums() {

		List<Album> albums = null;

		String sql = "SELECT a FROM Album a";

		albums = em.createQuery(sql, Album.class).getResultList();
		return albums;

	}

	public List<Blog> getBlogs() {

		List<Blog> blogs = null;

		String sql = "SELECT b FROM Blog b";

		blogs = em.createQuery(sql, Blog.class).getResultList();
		return blogs;

	}

	@Override
	public User attemptLogin(String username, String password) {
		String query = "SELECT u FROM User u WHERE username = :name AND password = :password";
		List<User> validUsers = em.createQuery(query, User.class).setParameter("name", username)
				.setParameter("password", password).getResultList();
		return (validUsers.size() == 0) ? null : validUsers.get(0);
	}

	@Override
	public Album getAlbumById(int id) {
		return em.find(Album.class, id);
	}

	@Override
	public List<Topic> getTopicsByKeyword(String keyword) {
		String query = "SELECT t FROM Topic t WHERE title LIKE :kw";
		return em.createQuery(query, Topic.class).setParameter("kw", "%" + keyword + "%").getResultList();

	}

	@Override
	public List<Topic> getTopicsByUser(String username) {
		String query = "SELECT t FROM Topic t WHERE t.user.username LIKE :kw";
		return em.createQuery(query, Topic.class).setParameter("kw", "%" + username + "%").getResultList();
	}

	@Override
	public List<Blog> getBlogsByKeyword(String keyword) {
		String query = "SELECT b FROM Blog b WHERE title LIKE :kw OR body LIKE :kw";
		return em.createQuery(query, Blog.class).setParameter("kw", "%" + keyword + "%").getResultList();

	}

	@Override
	public List<Blog> getBlogsByUser(String username) {
		String query = "SELECT b FROM Blog b WHERE b.user.username LIKE :kw";
		return em.createQuery(query, Blog.class).setParameter("kw", "%" + username + "%").getResultList();
	}

	@Override
	public List<TopicComment> getTopicCommentsByKeyword(String keyword) {
		String query = "SELECT tc FROM TopicComment tc WHERE body LIKE :kw";
		return em.createQuery(query, TopicComment.class).setParameter("kw", "%" + keyword + "%").getResultList();

	}

	@Override
	public List<TopicComment> getTopicCommentsByUser(String username) {
		String query = "SELECT tc FROM TopicComment tc WHERE tc.user.username LIKE :kw";
		return em.createQuery(query, TopicComment.class).setParameter("kw", "%" + username + "%").getResultList();
	}

	@Override
	public List<AlbumComment> getAlbumCommentsByKeyword(String keyword) {
		String query = "SELECT ac FROM AlbumComment ac WHERE body LIKE :kw";
		return em.createQuery(query, AlbumComment.class).setParameter("kw", "%" + keyword + "%").getResultList();

	}

	@Override
	public List<AlbumComment> getAlbumCommentsByUser(String username) {
		String query = "SELECT ac FROM AlbumComment ac WHERE ac.user.username LIKE :kw";
		return em.createQuery(query, AlbumComment.class).setParameter("kw", "%" + username + "%").getResultList();
	}

	@Override
	public List<BlogComment> getBlogCommentsByKeyword(String keyword) {
		String query = "SELECT bc FROM BlogComment bc WHERE body LIKE :kw";
		return em.createQuery(query, BlogComment.class).setParameter("kw", "%" + keyword + "%").getResultList();
	}

	@Override
	public List<BlogComment> getBlogCommentsByUser(String username) {
		String query = "SELECT bc FROM BlogComment bc WHERE bc.user.username LIKE :kw";
		return em.createQuery(query, BlogComment.class).setParameter("kw", "%" + username + "%").getResultList();
	}

	@Override
	public List<Album> getAlbumsByKeyword(String keyword) {
		String query = "SELECT a FROM Album a WHERE a.description LIKE :kw OR a.title LIKE :kw";
		return em.createQuery(query, Album.class).setParameter("kw", "%" + keyword + "%").getResultList();

	}

	@Override
	public Album editAlbum(Album album) {
		Album dalbum = em.find(Album.class, album.getId());
		Album newalbum = album;
		dalbum.setTitle(newalbum.getTitle());
		dalbum.setCoverUrl(newalbum.getCoverUrl());
		dalbum.setArtist(newalbum.getArtist());
		dalbum.setDescription(newalbum.getDescription());
		dalbum.setReleaseYear(newalbum.getReleaseYear());
		em.flush();
		return dalbum;
	}

}
