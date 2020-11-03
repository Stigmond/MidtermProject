package com.skilldistillery.crescendo.data;

import java.util.List;

import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.Artist;
import com.skilldistillery.crescendo.entities.Blog;

import com.skilldistillery.crescendo.entities.Album;

import com.skilldistillery.crescendo.entities.User;

public interface UserDAO {

	User getTestUser();

	User getUser(int id);

	User createUser(User user);

	User updateUser(User user);

	List<Album> getAlbums();

	List<Blog> getBlogs();

	User attemptLogin(String username, String password);

	Album getAlbumById(int id);

	Artist findArtist(int id);

	Album createAlbum(Album album, String name);

	Artist findArtistByName(String name);

	Artist createArtist(Artist artist);

}
