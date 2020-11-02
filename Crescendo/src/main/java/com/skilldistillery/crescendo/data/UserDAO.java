package com.skilldistillery.crescendo.data;

import com.skilldistillery.crescendo.entities.Album;
import com.skilldistillery.crescendo.entities.User;

public interface UserDAO {

	User getTestUser();

	User createUser(User user);

	User updateUser(User user);
	
	User attemptLogin(String username,  String password);
	
	Album getAlbumById(int id);
}
