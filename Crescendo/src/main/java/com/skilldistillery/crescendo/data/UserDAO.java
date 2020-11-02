package com.skilldistillery.crescendo.data;

import com.skilldistillery.crescendo.entities.User;

public interface UserDAO {

	User getTestUser();

	User createUser(User user);

	User updateUser(int id, User user);
}
