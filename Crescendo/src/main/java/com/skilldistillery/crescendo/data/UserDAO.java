package com.skilldistillery.crescendo.data;


import java.util.List;

import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.AlbumComment;
import com.skilldistillery.crescendo.entities.Blog;
import com.skilldistillery.crescendo.entities.BlogComment;
import com.skilldistillery.crescendo.entities.Topic;
import com.skilldistillery.crescendo.entities.TopicComment;
import com.skilldistillery.crescendo.entities.User;

public interface UserDAO {

	User getTestUser();
	
	User getUser(int id);

	User createUser(User user);

	User updateUser(User user);

	List<Album> getAlbums();

	List<Blog> getBlogs();
	
	User attemptLogin(String username,  String password);
	
	Album getAlbumById(int id);

	List<Topic> getTopicsByKeyword(String keyword);
	List<Topic> getTopicsByUser(String username);
	List<Blog> getBlogsByKeyword(String keyword);
	List<Blog> getBlogsByUser(String username);
	List<TopicComment> getTopicCommentsByKeyword(String keyword);
	List<TopicComment> getTopicCommentsByUser(String username);
	List<AlbumComment> getAlbumCommentsByKeyword(String keyword);
	List<AlbumComment> getAlbumCommentsByUser(String username);
	List<BlogComment> getBlogCommentsByKeyword(String keyword);
	List<BlogComment> getBlogCommentsByUser(String username);
	List<Album> getAlbumsByKeyword(String keyword);

}
