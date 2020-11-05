package com.skilldistillery.crescendo.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.AlbumComment;
import com.skilldistillery.crescendo.entities.Artist;
import com.skilldistillery.crescendo.entities.Blog;
import com.skilldistillery.crescendo.entities.BlogComment;
import com.skilldistillery.crescendo.entities.Genre;
import com.skilldistillery.crescendo.entities.Topic;
import com.skilldistillery.crescendo.entities.TopicComment;
import com.skilldistillery.crescendo.entities.Trade;
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
		Album album = em.find(Album.class, id);
		album.getAlbumComments().size();
		return album;
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

	@Override
	public Album editAlbum(Album album, String artistName) {
		Album dalbum = em.find(Album.class, album.getId());
		Album newalbum = album;
		dalbum.setTitle(newalbum.getTitle());
		dalbum.setCoverUrl(newalbum.getCoverUrl());
		dalbum.setDescription(newalbum.getDescription());
		dalbum.setReleaseYear(newalbum.getReleaseYear());

		if (!dalbum.getArtist().getName().equals(artistName)) {

			Artist updatedArtist = new Artist();
			updatedArtist.setName(artistName);
			updatedArtist.addAlbum(album);
			dalbum.setArtist(updatedArtist);
// TO-DO: Create a remove old album from artist list
		}
		em.flush();
		return dalbum;
	}

	@Override
	public Album createAlbum(Album album, String artistName) {
		Artist tempArtist = null;
		tempArtist = findArtistByName(artistName);
		if (tempArtist == null) {
			tempArtist = new Artist();
			tempArtist.setName(artistName);
			tempArtist.addAlbum(album);
			album.setArtist(tempArtist);
		} else {
			tempArtist.addAlbum(album);
			album.setArtist(tempArtist);
		}
		em.persist(tempArtist);
		em.persist(album);
		em.flush();
		return album;
	}

	@Override
	public Artist findArtist(int id) {

		Artist artist = em.find(Artist.class, id);

		return artist;
	}

	@Override
	public Artist findArtistByName(String artistName) {

		String sql = "SELECT a FROM Artist a WHERE a.name = :name";
		Artist artist;
		try {
			artist = em.createQuery(sql, Artist.class).setParameter("name", artistName).getSingleResult();
		} catch (Exception e) {
			artist = null;

		}
		return artist;
	}

	@Override
	public Artist createArtist(Artist artist) {

		em.persist(artist);
		em.flush();
		return artist;
	}

	@Override
	public List<Trade> getBuySell() {
		String query = "SELECT t FROM Trade t WHERE (t.direction = 'buy' OR t.direction = 'sell') AND t.active=1";
		return em.createQuery(query, Trade.class).getResultList();
	}

	@Override
	public List<Trade> getTrades() {
		String query = "SELECT t FROM Trade t WHERE t.direction = 'trade' AND t.active=1";
		return em.createQuery(query, Trade.class).getResultList();
	}

	@Override
	public Trade getTradeById(int id) {
		return em.find(Trade.class, id);
	}

	@Override
	public List<Trade> getTradesByUser(int id) {
		String query = "SELECT t FROM Trade t WHERE t.user.id=:cid";
		return em.createQuery(query, Trade.class).setParameter("cid", id).getResultList();
	}

	@Override
	public Blog getBlogById(int id) {
		Blog blog = em.find(Blog.class, id);
		blog.getBlogComments().size();
		return blog;
	}

	@Override
	public Topic getTopicById(int id) {

		Topic topic = em.find(Topic.class, id);
		topic.getThreadComments().size();

		return topic;
	}

	@Override
	public Topic getTopicByTitle(String title) {
		Topic topic = new Topic();
		topic = null;
		String sql = "SELECT t FROM Topic t WHERE t.title = :title";
		try {
			topic = em.createQuery(sql, Topic.class).setParameter("title", title).getSingleResult();
		} catch (Exception e) {
			topic = null;
		}	
		return topic;
	}
	
	@Override
	public TopicComment getFirstCommentOnTopic(int topicId) {
		String query = "SELECT tc FROM TopicComment tc WHERE tc.thread.id = :tid ORDER BY tc.id ASC";

		return em.createQuery(query, TopicComment.class).setParameter("tid", topicId).getResultList().get(0);
	}

	@Override
	public TopicComment addReplyToTopic(TopicComment comment) {

		em.persist(comment);
		em.flush();
		return comment;
	}

	@Override
	public AlbumComment addReplyToAlbum(AlbumComment comment) {
		em.persist(comment);
		em.flush();
		return comment;
	}

	@Override
	public BlogComment addReplyToBlog(BlogComment comment) {
		em.persist(comment);
		em.flush();
		return comment;
	}

	@Override
	public Blog addBlog(Blog blog) {
		em.persist(blog);
		em.flush();
		return blog;
	}

	@Override
	public Genre getGenreById(int id) {
		return em.find(Genre.class, id);

	}
	
	@Override
	public BlogComment getBlogCommentById(int id) {
		return em.find(BlogComment.class, id);
	}

	@Override
	public AlbumComment getAlbumCommentById(int id) {
		return em.find(AlbumComment.class, id);
	}

	@Override
	public TopicComment getTopicCommentById(int id) {
		return em.find(TopicComment.class, id);
	}
	
	@Override
	public Boolean deleteComment( TopicComment comment ) {
		try {
			String delete= "DELETE FROM TopicComment tc WHERE tc.id = :cid";

			em.createQuery(delete).setParameter("cid", comment.getId()).executeUpdate();
			
		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	@Override
	public Boolean deleteComment( AlbumComment comment ) {
		try {
			String delete= "DELETE FROM AlbumComment ac WHERE ac.id = :cid";

			em.createQuery(delete).setParameter("cid", comment.getId()).executeUpdate();
			
		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	@Override
	public Boolean deleteComment( BlogComment comment ) {
		try {
			String delete= "DELETE FROM BlogComment bc WHERE bc.id = :cid";

			em.createQuery(delete).setParameter("cid", comment.getId()).executeUpdate();
			
		} catch (Exception e) {
			return false;
		}

		return true;
	}

	@Override
	public Boolean deleteDiscussionTopic(Topic topic) {
		try {
			String deleteComments = "DELETE FROM TopicComment tc WHERE tc.thread.id = :tid";
			String deleteTopic = "DELETE FROM Topic t WHERE t.id = :tid";

			em.createQuery(deleteComments).setParameter("tid", topic.getId()).executeUpdate();
			em.createQuery(deleteTopic).setParameter("tid", topic.getId()).executeUpdate();
		} catch (Exception e) {
			return false;
		}

		return true;
	}

	@Override
	public Boolean deleteAlbum(Album album) {
		try {
			String deleteComments = "DELETE FROM AlbumComment ac WHERE ac.album.id = :tid";
			String deleteTopic = "DELETE FROM Album a WHERE a.id = :tid";

			em.createQuery(deleteComments).setParameter("tid", album.getId()).executeUpdate();
			em.createQuery(deleteTopic).setParameter("tid", album.getId()).executeUpdate();
		} catch (Exception e) {
			return false;
		}

		return true;
	}

	@Override
	public Boolean deleteBlog(Blog blog) {
		try {
			String deleteComments = "DELETE FROM BlogComment bc WHERE bc.blog.id = :tid";
			String deleteTopic = "DELETE FROM Blog b WHERE b.id = :tid";

			em.createQuery(deleteComments).setParameter("tid", blog.getId()).executeUpdate();
			em.createQuery(deleteTopic).setParameter("tid", blog.getId()).executeUpdate();
		} catch (Exception e) {
			return false;
		}

		return true;
	}

	@Override
	public Topic createTopic(User user, String topicTitle) {
		User topicUser = getUser(user.getId());
		Topic newTopic = new Topic();
		newTopic.setTitle(topicTitle);
		newTopic.setUser(topicUser);
		em.persist(newTopic);
		em.flush();
		System.out.println(newTopic);
		return newTopic;
	}

	public TopicComment addTopicComment(TopicComment comment) {
		em.persist(comment);
		em.flush();
		System.out.println(comment);
		return comment;
	}
	

}
