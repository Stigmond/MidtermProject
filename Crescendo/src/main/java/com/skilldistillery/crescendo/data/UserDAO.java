package com.skilldistillery.crescendo.data;

import java.util.List;

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

public interface UserDAO {

	User getTestUser();

	User getUser(int id);

	User createUser(User user);

	User updateUser(User user);

	List<Album> getAlbums();

	List<Blog> getBlogs();

	Blog getBlogById(int id);

	User attemptLogin(String username, String password);

	Album getAlbumById(int id);

	Artist findArtist(int id);

	Album createAlbum(Album album, String name);

	Artist findArtistByName(String name);

	Artist createArtist(Artist artist);

	List<Topic> getTopicsByKeyword(String keyword);

	List<Topic> getTopicsByUser(String username);

	List<Blog> getBlogsByKeyword(String keyword);

	List<Blog> getBlogsByUser(String username);

	Topic getTopicById(int id);

	TopicComment addReplyToTopic(TopicComment comment);

	List<TopicComment> getTopicCommentsByKeyword(String keyword);

	List<TopicComment> getTopicCommentsByUser(String username);

	TopicComment getFirstCommentOnTopic(int topicId);

	List<AlbumComment> getAlbumCommentsByKeyword(String keyword);

	List<AlbumComment> getAlbumCommentsByUser(String username);
	
	AlbumComment addReplyToAlbum(AlbumComment comment);

	List<BlogComment> getBlogCommentsByKeyword(String keyword);

	List<BlogComment> getBlogCommentsByUser(String username);

	List<Album> getAlbumsByKeyword(String keyword);

	Album editAlbum(Album album, String artistName);

	List<Trade> getBuySell();

	List<Trade> getTrades();

	Trade getTradeById(int id);

	List<Trade> getTradesByUser(int id);

	
	Blog addBlog(Blog blog);
	Genre getGenreById(int id);
	


	BlogComment addReplyToBlog(BlogComment comment);

}
